import 'package:utility/utility.dart';

class GyroscopeEvent extends Equatable {
// Rotation on the axis from the back to the front side of the phone
  final double x;
// Rotation on the axis from the left to the right side of the phone
  final double y;
// Rotation on the axis from the bottom to the top of the phone
  final double z;
  const GyroscopeEvent({
    required this.x,
    required this.y,
    required this.z,
  });

  @override
  List<Object> get props => [x, y, z];
}
