import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CatagaoryScrollTab extends StatelessWidget {
  final bool isSelected;
  final String btntitle;
  const CatagaoryScrollTab(
      {super.key, required this.isSelected, required this.btntitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.h,
      decoration: BoxDecoration(
          border: Border.all(
              color: isSelected ? Colors.transparent : Colors.black54),
          color: isSelected ? Colors.black87 : Colors.white.withOpacity(0.3),
          borderRadius: BorderRadius.circular(5)),
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 23.w),
          child: Text(
            btntitle,
            style: GoogleFonts.montserrat(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: isSelected == false ? Colors.black87 : Colors.white),
          ),
        ),
      ),
    );
  }
}
