import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
// Import the profile screen file

class CustomSectionWidget extends StatelessWidget {
  final String sectionTitle;
  final VoidCallback onMorePressed;

  CustomSectionWidget({
    required this.sectionTitle,
    required this.onMorePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          sectionTitle,
          style: GoogleFonts.montserrat(
            fontSize: 20.sp,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        InkWell(
          onTap: onMorePressed,
          child: Text(
            'More',
            style: GoogleFonts.montserrat(
              decoration: TextDecoration.underline,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: Colors.black87,
            ),
          ),
        ),
      ],
    );
  }
}
