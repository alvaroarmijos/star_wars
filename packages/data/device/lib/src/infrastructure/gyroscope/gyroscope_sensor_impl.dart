import 'dart:async';

import 'package:device/src/domain/gyroscope/gyroscope_event.dart';
import 'package:flutter/services.dart';

import '../../domain/gyroscope/gyroscope_sensor.dart';

class GyroscopeSensorImpl implements GyroscopeSensor {
  static const MethodChannel _methodChannel = MethodChannel('method');
  final _eventChannel = const EventChannel('gyroscope');
  Stream<GyroscopeEvent>? _gyroscopeEvents;

  @override
  Stream<GyroscopeEvent> gyroscopeEventStream() {
    _methodChannel.invokeMethod('setGyroscopeSamplingPeriod',
        const Duration(milliseconds: 20).inMicroseconds);
    _gyroscopeEvents ??=
        _eventChannel.receiveBroadcastStream().map((dynamic event) {
      final list = event.cast<double>();
      return GyroscopeEvent(x: list[0]!, y: list[1]!, z: list[2]!);
    });
    return _gyroscopeEvents!;
  }
}
