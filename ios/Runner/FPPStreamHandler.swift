//
//  FPPStreamHandler.swift
//  Runner
//
//  Created by Alvaro Armijos on 25/3/24.
//

import Foundation
import Flutter
import UIKit
import CoreMotion

let GRAVITY = 9.81
var _motionManager: CMMotionManager!

public protocol MotionStreamHandler: FlutterStreamHandler {
    var samplingPeriod: Int { get set }
}

func _initMotionManager() {
    if (_motionManager == nil) {
        _motionManager = CMMotionManager()
        _motionManager.gyroUpdateInterval = 0.2
    }
}

func sendTriplet(x: Float64, y: Float64, z: Float64, sink: @escaping FlutterEventSink) {
    if _isCleanUp {
        return
    }
    // Even after [detachFromEngineForRegistrar] some events may still be received
    // and fired until fully detached.
    DispatchQueue.main.async {
        let triplet = [x, y, z]
        triplet.withUnsafeBufferPointer { buffer in
            sink(FlutterStandardTypedData.init(float64: Data(buffer: buffer)))
        }
    }
}

class FPPGyroscopeStreamHandler: NSObject, MotionStreamHandler {

    var samplingPeriod = 200000 {
        didSet {
            _initMotionManager()
            _motionManager.gyroUpdateInterval = Double(samplingPeriod) * 0.000001
        }
    }

    func onListen(
            withArguments arguments: Any?,
            eventSink sink: @escaping FlutterEventSink
    ) -> FlutterError? {
        _initMotionManager()
        _motionManager.startGyroUpdates(to: OperationQueue()) { data, error in
            if _isCleanUp {
                return
            }
            if (error != nil) {
                sink(FlutterError(
                        code: "UNAVAILABLE",
                        message: error!.localizedDescription,
                        details: nil
                ))
                return
            }
            let rotationRate = data!.rotationRate
            sendTriplet(x: rotationRate.x, y: rotationRate.y, z: rotationRate.z, sink: sink)
        }
        return nil
    }

    func onCancel(withArguments arguments: Any?) -> FlutterError? {
        _motionManager.stopGyroUpdates()
        return nil
    }

//    func dealloc() {
//        AppDelegate._cleanUp()
//    }
}
