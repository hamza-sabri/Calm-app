import 'dart:ui';

import 'package:flutter/material.dart';

class TextStyles {
  final context;
  static double width;
  TextStyles({this.context});

  _findWidth() {
    width = MediaQuery.of(context).size.width;
  }

  TextStyle appBarStyle() {
    if (width == null) _findWidth();
    return TextStyle(
      fontSize: (width / 100) + 20,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    );
  }

  TextStyle smallTitle() {
    if (width == null) _findWidth();
    return TextStyle(
      fontSize: (width / 100) + 22,
      color: Colors.grey,
      fontStyle: FontStyle.normal,
    );
  }

  TextStyle boldWordStyle() {
    return TextStyle(
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle readyText() {
    if (width == null) _findWidth();
    return TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: (width / 100) + 12,
    );
  }

  TextStyle viewer() {
    if (width == null) _findWidth();
    return TextStyle(
      color: Colors.grey,
      fontSize: (width / 100) + 11,
    );
  }

  TextStyle meditaion() {
    if (width == null) _findWidth();
    return TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: (width / 100) + 18,
    );
  }

  TextStyle question() {
    return TextStyle(
        color: Colors.grey, fontWeight: FontWeight.normal, fontSize: 18);
  }

  TextStyle oneWord() {
    return TextStyle(
      color: Colors.grey,
      fontWeight: FontWeight.normal,
      fontSize: 14,
    );
  }

  TextStyle normalStyle() {
    if (width == null) _findWidth();
    return TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: (width / 100) + 25,
      color: Colors.black,
    );
  }

  TextStyle startStyle() {
    if (width == null) _findWidth();
    return TextStyle(
      color: Colors.white,
      fontSize: (width / 100) + 16,
    );
  }

  TextStyle meditaionStyle() {
    if (width == null) _findWidth();
    return TextStyle(
      color: Colors.grey,
      fontSize: (width / 100) + 12,
    );
  }

  TextStyle mindTraining(){
    if (width == null) _findWidth();
    return TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: (width / 100) + 22,
    );
  }

    TextStyle stephanHawking(){
    if (width == null) _findWidth();
    return TextStyle(
      color: Colors.lightBlueAccent,
      fontSize: (width / 100) + 18,
    );
  }
}
