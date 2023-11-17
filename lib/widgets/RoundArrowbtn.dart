// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class RoundArrowbtn extends StatelessWidget {
  final Function fun;
  const RoundArrowbtn({super.key, required this.fun});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: fun(),
      child: CircleAvatar(
          backgroundColor: Colors.black87.withOpacity(0.7),
          radius: 23.r,
          child: Icon(
            Icons.arrow_forward_rounded,
            color: Colors.white.withOpacity(0.9),
            size: 50,
          )),
    );
  }
}
