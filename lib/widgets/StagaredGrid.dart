import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shewhead_shoes_app/widgets/RoundArrowbtn.dart';
import 'package:shewhead_shoes_app/widgets/textwidget.dart';

class StagaredGrid extends StatelessWidget {
  Widget? grid;
  int? hight;
  String cattext, catimage;

  StagaredGrid({
    this.grid,
    this.hight,
    required this.catimage,
    required this.cattext,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 156.w,
      height: hight!.isEven ? 230.h : 210,
      decoration: BoxDecoration(
        color: Color(0xffECEEF0),
        borderRadius: BorderRadius.circular(8.r),
        image: DecorationImage(
          fit: BoxFit.fitWidth,
          image: Image.asset(catimage).image,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 16.h, left: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget(
              fontFamily: GoogleFonts.montserrat,
              needBold: true,
              text: cattext,
              color: Colors.black87,
              fontSize: 16.sp,
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 115.h,
                left: 90.w,
                bottom: 8.h,
              ),
              child: Row(
                children: [
                  RoundArrowbtn(fun: () {}),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
