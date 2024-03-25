import 'package:device/device.dart';

abstract class GyroscopeSensor {
  // /// Subscribes to the native gyroscope sensor updates.

  Stream<GyroscopeEvent> gyroscopeEventStream();
}
