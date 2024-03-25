package com.example.star_wars

import android.content.Context
import android.hardware.Sensor
import android.hardware.SensorManager
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {

    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    private lateinit var methodChannel: MethodChannel

    private lateinit var gyroscopeChannel: EventChannel

    private lateinit var gyroscopeStreamHandler: StreamHandlerImpl

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        setupMethodChannel(flutterEngine.dartExecutor.binaryMessenger)
        setupEventChannels(context, flutterEngine.dartExecutor.binaryMessenger)
    }

    private fun setupMethodChannel(messenger: BinaryMessenger) {
        methodChannel = MethodChannel(messenger, METHOD_CHANNEL_NAME)
        methodChannel.setMethodCallHandler { call, result ->
            val streamHandler = when (call.method) {
                "setGyroscopeSamplingPeriod" -> gyroscopeStreamHandler
                else -> null
            }
            streamHandler?.samplingPeriod = call.arguments as Int
            if (streamHandler != null) {
                result.success(null)
            } else {
                result.notImplemented()
            }
        }
    }

    private fun teardownMethodChannel() {
        methodChannel.setMethodCallHandler(null)
    }

    private fun setupEventChannels(context: Context, messenger: BinaryMessenger) {
        val sensorsManager = context.getSystemService(Context.SENSOR_SERVICE) as SensorManager

        gyroscopeChannel = EventChannel(messenger, GYROSCOPE_CHANNEL_NAME)
        gyroscopeStreamHandler = StreamHandlerImpl(
            sensorsManager,
            Sensor.TYPE_GYROSCOPE
        )
        gyroscopeChannel.setStreamHandler(gyroscopeStreamHandler)
    }


    private fun teardownEventChannels() {
        gyroscopeChannel.setStreamHandler(null)
        gyroscopeStreamHandler.onCancel(null)
    }

    override fun detachFromFlutterEngine() {
        super.detachFromFlutterEngine()
        teardownMethodChannel()
        teardownEventChannels()
    }

    companion object {
        private const val METHOD_CHANNEL_NAME =
            "method"
        private const val GYROSCOPE_CHANNEL_NAME =
            "gyroscope"
    }
}
