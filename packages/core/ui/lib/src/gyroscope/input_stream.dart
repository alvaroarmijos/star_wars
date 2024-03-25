import 'dart:async';

import 'package:device/device.dart';
import 'package:flutter/widgets.dart';
import 'package:ui/src/gyroscope/gyroscope.dart';

bool isListening = false;

class InputStream extends StatefulWidget {
  final Widget child;

  const InputStream({Key? key, required this.child}) : super(key: key);

  @override
  State<StatefulWidget> createState() => InputStreamState();
}

class InputStreamState extends State<InputStream> {
  late Stream<GyroscopeEvent> inputStream;

  DateTime? lastPointerEventTime;

  @override
  void initState() {
    super.initState();
    inputStream = GyroscopeSensorImpl().gyroscopeEventStream();
  }

  @override
  Widget build(BuildContext context) =>
      GyroscopeProvider(stream: inputStream, child: widget.child);
}
