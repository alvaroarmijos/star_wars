import 'package:device/device.dart';
import 'package:flutter/material.dart';
import 'package:ui/src/gyroscope/gyroscope.dart';

class MotionStreamBuilder extends StatefulWidget {
  /// The controller that holds the widget's motion data.
  final GyroscopeController? controller;

  /// The target widget.
  final Widget child;

  /// Whether to apply a dynamic translation effect on the widget's X and Y positions.
  final TranslationConfiguration? translation;

  /// Whether to apply a dynamic shadow to the widget.
  final ShadowConfiguration? shadow;

  /// An optional border radius to apply to the widget.
  final BorderRadius? borderRadius;

  /// Creates a [Motion] widget with the given [child] and [controller], applying all of the effects.
  const MotionStreamBuilder({
    Key? key,
    this.controller,
    required this.child,
    this.borderRadius,
    required this.translation,
    required this.shadow,
  }) : super(key: key);

  @override
  State<MotionStreamBuilder> createState() => _MotionStreamBuilderState();
}

class _MotionStreamBuilderState extends State<MotionStreamBuilder> {
  /// The controller to use.
  GyroscopeController get controller =>
      widget.controller ?? GyroscopeController.defaultController;

  /// The shadow's offset on the horizontal axis.
  double get horizontalShadowOffset =>
      (controller.y / controller.maxAngle) * (widget.shadow?.maxOffset.dy ?? 0);

  /// The shadow's offset on the vertical axis.
  double get verticalShadowOffset =>
      (controller.x / controller.maxAngle) * (widget.shadow?.maxOffset.dx ?? 0);

  /// The device's orientation.
  Orientation? orientation;

  /// Computes the new rotation for each axis from the given [event], and updates the controller's value.
  Matrix4 computeTransformForEvent(GyroscopeEvent? event) {
    final matrix = Matrix4.identity()..setEntry(3, 2, 0.0015);

    if (event != null) {
      // Apply the event's rotation based on the device orientation.
      controller.x +=
          (orientation == Orientation.landscape ? -event.y : event.x) * 0.01;
      controller.y -=
          (orientation == Orientation.landscape ? event.x : event.y) * 0.01;

      // Normalize the values.
      controller.normalize();

      // Apply the damping factor — which may equal 1 and have no effect, if damping is null.
      controller.x *= controller.dampingFactor;
      controller.y *= controller.dampingFactor;

      // Rotate the matrix by the resulting x and y values.
      matrix.rotateX(controller.x);
      matrix.rotateY(controller.y);

      matrix.translate(
        controller.y * -((widget.translation?.maxOffset.dy ?? 0) * 2.0),
        controller.x * (widget.translation?.maxOffset.dx ?? 0),
      );
    }

    return matrix;
  }

  @override
  void didChangeDependencies() {
    orientation = MediaQuery.of(context).orientation;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) => StreamBuilder<GyroscopeEvent>(
        stream: GyroscopeProvider.of(context)?.stream ??
            const Stream<GyroscopeEvent>.empty(),
        builder: (ctx, snapshot) => Stack(
          clipBehavior: Clip.none,
          children: [
            // The widget's drop shadow
            if (widget.shadow != null && widget.shadow!.isVisible)
              Positioned(
                left: horizontalShadowOffset,
                right: -horizontalShadowOffset,
                top: -verticalShadowOffset + widget.shadow!.topOffset,
                bottom: verticalShadowOffset - widget.shadow!.topOffset,
                child: IgnorePointer(
                  child: Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      borderRadius: widget.borderRadius,
                      boxShadow: [
                        BoxShadow(
                            blurRadius: widget.shadow!.blurRadius,
                            color: widget.shadow!.color
                                .withOpacity(widget.shadow!.opacity))
                      ],
                    ),
                  ),
                ),
              ),

            // The transformation widgets
            Transform(
                transform: computeTransformForEvent(snapshot.data),
                alignment: FractionalOffset.center,
                child: widget.child),
          ],
        ),
      );
}
