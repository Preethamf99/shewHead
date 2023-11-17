import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileTabs extends StatelessWidget {
  ProfileTabs({required this.Title, super.key});
  String Title;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black87,
            ),
            borderRadius: BorderRadius.circular(5)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 28.h),
          child: Text(
            Title,
            style: GoogleFonts.montserrat(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ));
  }
}
