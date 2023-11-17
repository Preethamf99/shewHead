// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shewhead_shoes_app/widgets/textwidget.dart';

class shopingMethod extends StatelessWidget {
  final String title, Balance;
  const shopingMethod({super.key, required this.title, required this.Balance});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.black54)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.red,
          ),
          TextWidget(
            text: title,
            color: Colors.black54,
            fontSize: 14.sp,
            fontFamily: GoogleFonts.montserrat,
          ),
          TextWidget(
            text: Balance,
            color: Colors.black54,
            fontSize: 14.sp,
            fontFamily: GoogleFonts.montserrat,
          )
        ],
      ),
    );
  }
}
