import 'dart:math';

import 'package:flutter/widgets.dart';

/// Constants used to define the [ReactiveGyroscope] widget's behavior.

/// Color constants
const defaultGlareColor = Color(0xffffffff),
    defaultShadowColor = Color(0xff000000);

/// Numeric constants
const double maxElevation = 100,

    /// Defaults
    defaultMaxAngle = pi / 10,

    /// Damping constants
    maxDampingFactor = 0.05,
    minDampingFactor = 0.01,
    defaultDampingFactor = 0.2,

    /// Shadow-specific values
    minShadowOffset = 0,
    maxShadowOffset = 40,
    minShadowTopOffset = 5,
    maxShadowTopOffset = 45,
    minBlurRadius = 10,
    maxBlurRadius = 30,
    minShadowOpacity = 0.3,
    maxShadowOpacity = 0.2,

    /// Translation-specific values
    maxDistance = 75.0;
