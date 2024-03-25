import 'package:device/device.dart';

class GetGyroscopeDataUseCase {
  const GetGyroscopeDataUseCase(
    this._gyroscopeSensor,
  );

  final GyroscopeSensor _gyroscopeSensor;

  Stream<GyroscopeEvent> call(String? next) =>
      _gyroscopeSensor.gyroscopeEventStream();
}
