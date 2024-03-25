import 'package:flutter/widgets.dart' hide Shadow;
import 'package:ui/src/gyroscope/gyroscope.dart';

/// A fancy widget that adds a gyroscope-based motion effect to its [child].
///
/// Platform-specific operations are performed using the static [instance].
class ReactiveGyroscope extends StatefulWidget {
  /// The MotionPlatform instance to perform platform-specific operations.
  ///
  /// /// The controller that holds the widget's motion data.
  final GyroscopeController? controller;

  /// The target widget.
  final Widget child;

  /// Whether to apply a dynamic translation effect on the widget's X and Y positions.
  final TranslationConfiguration? translation;

  /// Whether to apply a dynamic shadow to the widget.
  final ShadowConfiguration? shadow;

  /// An optional border radius to apply to the widget.
  final BorderRadius? borderRadius;

  /// Creates a [Motion] widget with the given [child] and [controller], applying all of the default effects.
  ///
  /// The [controller] can be used to create a unique controller for each widget.
  ///
  /// When omitted, the default controller is used. It is a shared instance that will apply the same rotation
  /// to all widgets. If multiple [Motion] widgets are displayed at the same time, they should have unique controllers.
  ///
  /// You may provide a custom [glare], [shadow] and [translation] configuration to override the default effects.
  /// An optional [borderRadius] can be provided to apply a border radius to the widget.
  const ReactiveGyroscope({
    Key? key,
    this.controller,
    required this.child,
    this.translation = const TranslationConfiguration(),
    this.shadow = const ShadowConfiguration(),
    this.borderRadius,
  }) : super(key: key);

  @override
  State<ReactiveGyroscope> createState() => _ReactiveGyroscopeState();
}

class _ReactiveGyroscopeState extends State<ReactiveGyroscope> {
  @override
  Widget build(BuildContext context) => InputStream(
          child: MotionStreamBuilder(
        controller: widget.controller,
        shadow: widget.shadow,
        translation: widget.translation,
        borderRadius: widget.borderRadius,
        child: widget.child,
      ));
}
