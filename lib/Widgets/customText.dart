import 'package:flutter/material.dart';

Widget customText(String text, Color colors, double size, bold) {
  return Text(
    text,
    style: TextStyle(
      color: colors,
      fontSize: size,
      fontWeight: bold,
    ),
  );
}
