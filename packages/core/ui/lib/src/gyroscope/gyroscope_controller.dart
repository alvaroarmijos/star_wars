import 'dart:math';

import 'package:ui/src/gyroscope/gyroscope.dart';

class GyroscopeController {
  /// The speed at which the widget returns to its initial position.
  ///
  double? damping;

  /// The actual damping factor used by the widget.
  ///
  /// Computed from the [damping] value which lerps from 0 to 1 between [minDampingFactor] and [maxDampingFactor].
  double get dampingFactor => damping != null
      ? 1 -
          (minDampingFactor +
              (damping! * (maxDampingFactor - minDampingFactor)))
      : 1;

  /// The maximum angle at which the widget will be allowed to turn in every axis, in radians.
  double maxAngle;

  /// The current tilt state for each axises.
  ///
  /// Updated each time the client widget is rebuilt by the [StreamBuilder], itself triggered by events sent by the
  /// [gyroscopeEvents] stream.
  double x = 0, y = 0;

  /// A controller that holds the [Motion] widget's X and Y angles.
  GyroscopeController(
      {this.damping = defaultDampingFactor, this.maxAngle = defaultMaxAngle});

  /// A default controller for initializing the widgets with the default [damping] and [maxAngle] values.
  ///
  static final defaultController = GyroscopeController();

  /// Clamps the values to the maximum angle allowed.
  void normalize() {
    x = min(maxAngle / 2, max(-maxAngle / 2, x));
    y = min(maxAngle / 2, max(-maxAngle / 2, y));
  }
}
