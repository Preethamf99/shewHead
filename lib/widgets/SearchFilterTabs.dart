import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shewhead_shoes_app/widgets/textwidget.dart';

class SearchFilterTabs extends StatelessWidget {
  final String image, text;
  const SearchFilterTabs({
    super.key,
    required this.image,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 156.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.black54)),
      child: Padding(
        padding: EdgeInsets.only(left: 20.w, bottom: 12.h, top: 12.h),
        child: Row(
          children: [
            SvgPicture.asset(image),
            SizedBox(
              width: 14.w,
            ),
            TextWidget(
                text: text,
                color: Colors.black54,
                fontSize: 16,
                fontFamily: GoogleFonts.montserrat),
          ],
        ),
      ),
    );
  }
}
