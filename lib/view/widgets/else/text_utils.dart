import 'package:flutter/material.dart';

class TextUtils extends StatelessWidget {
  const TextUtils(
      {Key? key,
        required this.text,
        required this.fontSize,
        required this.fontWeight,
        required this.color})
      : super(key: key);

  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textDirection: TextDirection.rtl,
      style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,
      ),
    );
  }
}
