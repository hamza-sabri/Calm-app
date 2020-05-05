import 'package:flutter/material.dart';

class Dot extends StatelessWidget {
  final color;
  var dimensions;
  Dot({@required this.color, this.dimensions});
  @override
  Widget build(BuildContext context) {
    dimensions = (dimensions/100) + 5;
    return Container(
      width: dimensions,
      height: dimensions,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: this.color),
    );
  }
}
