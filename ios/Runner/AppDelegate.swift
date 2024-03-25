import UIKit
import Flutter


var _eventChannels: [String: FlutterEventChannel] = [:]
var _streamHandlers: [String: MotionStreamHandler] = [:]
var _isCleanUp = false

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      
      GeneratedPluginRegistrant.register(with: self)
      
      guard let controller = window?.rootViewController as? FlutterViewController else {
            fatalError("rootViewController is not type FlutterViewController")
          }

      let gyroscopeStreamHandler = FPPGyroscopeStreamHandler()
      let gyroscopeStreamHandlerName = "gyroscope"
      let gyroscopeChannel = FlutterEventChannel(
              name: gyroscopeStreamHandlerName,
              binaryMessenger: controller.binaryMessenger
      )
      gyroscopeChannel.setStreamHandler(gyroscopeStreamHandler)
      _eventChannels[gyroscopeStreamHandlerName] = gyroscopeChannel
      _streamHandlers[gyroscopeStreamHandlerName] = gyroscopeStreamHandler

      let methodChannel = FlutterMethodChannel(
              name: "method",
              binaryMessenger: controller.binaryMessenger
      )
      methodChannel.setMethodCallHandler { call, result in
          let streamHandler: MotionStreamHandler!;
          switch (call.method) {
          case "setGyroscopeSamplingPeriod":
              streamHandler = _streamHandlers[gyroscopeStreamHandlerName]
          default:
              return result(FlutterMethodNotImplemented)
          }
          streamHandler.samplingPeriod = call.arguments as! Int
          result(nil)
      }

      _isCleanUp = false
      
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    
//    func detachFromEngineForRegistrar(registrar: NSObject!) {
//            _cleanUp()
//        }
//    
//    static func _cleanUp() {
//            _isCleanUp = true
//            for channel in _eventChannels.values {
//                channel.setStreamHandler(nil)
//            }
//            _eventChannels.removeAll()
//            for handler in _streamHandlers.values {
//                handler.onCancel(withArguments: nil)
//            }
//            _streamHandlers.removeAll()
//        }
}
