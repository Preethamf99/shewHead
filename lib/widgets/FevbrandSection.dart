// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shewhead_shoes_app/widgets/textwidget.dart';

class FevBrand extends StatelessWidget {
  final String image, text;
  final Color color;
  const FevBrand(
      {super.key,
      required this.image,
      required this.text,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.black26.withOpacity(0.3),
          image: DecorationImage(
              fit: BoxFit.cover, image: AssetImage(image), opacity: 0.8),
          borderRadius: BorderRadius.circular(5)),
      width: double.infinity,
      height: 80.h,
      child: Padding(
        padding: EdgeInsets.only(
          left: 34.h,
        ),
        child: Row(
          children: [
            Text(text,
                style: TextStyle(
                  color: color,
                  shadows: [
                    Shadow(
                      blurRadius: 3.0,
                      color: Colors.black54.withOpacity(0.6),
                      offset: Offset(-4.0, 1.0),
                    ),
                  ],
                  fontSize: 24.sp,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w900,
                )),
          ],
        ),
      ),
    );
  }
}
