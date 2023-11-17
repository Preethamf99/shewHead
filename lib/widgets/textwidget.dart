import 'package:flutter/material.dart';

typedef FontFamilyFunction = TextStyle Function({
  Color? color,
  FontWeight? fontWeight,
  double? fontSize,
  FontStyle? fontStyle,
  TextDecoration? decoration,
});

// ignore: must_be_immutable
class TextWidget extends StatelessWidget {
  final String text;
  final Color color;

  final double fontSize;
  final FontFamilyFunction fontFamily;

  bool needBold;
  TextWidget({
    super.key,
    required this.text,
    this.needBold = false,
    required this.color,
    required this.fontSize,
    required this.fontFamily,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: fontFamily(
        color: color,
        fontWeight: needBold ? FontWeight.bold : FontWeight.w400,
        fontSize: fontSize,
      ),
    );
  }
}
