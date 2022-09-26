import 'package:flutter/material.dart';

TextStyle textStyle(double fontSize, Color color) {
  return style.copyWith(fontSize: fontSize, color: color);
}

const TextStyle style =
    TextStyle(fontFamily: "Exo2", fontWeight: FontWeight.w500);
