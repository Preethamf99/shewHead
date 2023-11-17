// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBoardButton extends StatelessWidget {
  final Image? image;
  bool needtext;
  String? btntext;

  OnBoardButton({
    super.key,
    required this.needtext,
    this.btntext,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.w,
      height: 80.h,
      decoration: BoxDecoration(
        color: Color(0xff000000),
        shape: BoxShape.circle,
      ),
      child: needtext == true
          ? Center(
              child: Text(
                btntext!,
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600),
              ),
            )
          : Center(child: image),
    );
  }
}
