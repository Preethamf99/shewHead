// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shewhead_shoes_app/widgets/textwidget.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 58.h),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(),
                  contentPadding: EdgeInsets.only(top: 16, bottom: 16),
                  filled: true,
                  fillColor: Color(0xffE6E6E6),
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(left: 12.w, right: 12),
                    child: SvgPicture.asset(
                      'assets/svgimages/search-normal.svg',
                      width: 24,
                      height: 24,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 24.h,
            ),
            TextWidget(
                text: 'Recent search',
                color: Colors.black,
                fontSize: 14,
                fontFamily: GoogleFonts.montserrat)
          ],
        ),
      ),
    );
  }
}
