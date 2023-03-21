import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

LinearGradient LGradient() {
  return LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: <Color>[
      Color(0xff007bff),
      Color(0xff17a2b8),
      Color(0xff20c997),
    ], // Gradient from https://learnui.design/tools/gradient-generator.html
    tileMode: TileMode.mirror,
  );
}
