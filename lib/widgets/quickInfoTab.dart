import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shewhead_shoes_app/widgets/textwidget.dart';

class QuickInfo extends StatelessWidget {
  final String title, subsitle;
  const QuickInfo({super.key, required this.title, required this.subsitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.5.w, vertical: 12.h),
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey.shade600,
          ),
          borderRadius: BorderRadius.circular(5)),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Colors.black,
            radius: 22,
            child: Center(
              child: TextWidget(
                needBold: true,
                text: title,
                color: Colors.white,
                fontSize: 16.sp,
                fontFamily: GoogleFonts.montserrat,
              ),
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          TextWidget(
            text: subsitle,
            color: Colors.black,
            fontSize: 12.sp,
            fontFamily: GoogleFonts.montserrat,
          ),
        ],
      ),
    );
  }
}
