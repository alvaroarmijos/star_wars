import 'package:device/device.dart';
import 'package:flutter/material.dart';

class GyroscopeProvider extends InheritedWidget {
  /// The motion events stream, either gyroscope or pointer, depending on the platform.
  final Stream<GyroscopeEvent>? stream;

  bool get hasMotion => stream != null;

  const GyroscopeProvider(
      {Key? key, required Widget child, required this.stream})
      : super(key: key, child: child);

  static GyroscopeProvider? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<GyroscopeProvider>();

  @override
  bool updateShouldNotify(GyroscopeProvider oldWidget) {
    return oldWidget.stream != stream;
  }
}
