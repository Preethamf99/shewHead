import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class ReusableBTN extends StatelessWidget {
  final String Title;
  bool loading;
  final VoidCallback onTap;
  ReusableBTN(
      {super.key,
      this.loading = false,
      required this.Title,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 72.h,
        decoration: BoxDecoration(
            color: Colors.black87, borderRadius: BorderRadius.circular(5)),
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 96.w),
            child: Center(
              child: loading
                  ? CircularProgressIndicator(
                      color: Colors.white,
                    )
                  : Text(
                      Title,
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w500,
                          fontSize: 20.sp,
                          color: Colors.white),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
