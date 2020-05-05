import 'package:flutter/material.dart';
import 'package:ui_challenge1/animations/breathing.dart';

class CustomFAB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double inner = (width / 100) * 15;
    double outer = (width / 100) * 16;
    print('inner = $inner');
    print('outter = $outer');
    return BreathingAnimation(
      innerDimentions: inner,
      outerDimentions: outer,
    );
  }
}
