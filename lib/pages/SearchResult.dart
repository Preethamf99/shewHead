// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shewhead_shoes_app/providers/product_notifier.dart';
import 'package:shewhead_shoes_app/widgets/SearchFilterTabs.dart';
import 'package:shewhead_shoes_app/widgets/productlistsItem.dart';
import 'package:shewhead_shoes_app/widgets/textwidget.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({super.key});

  @override
  Widget build(BuildContext context) {
    var productNotifier = Provider.of<ProductsNotifier>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.only(left: 8.h, right: 24.h, top: 12.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(
                  'assets/svgimages/notification.svg',
                  width: 30,
                  height: 30,
                ),
              ],
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 24.w),
              child: TextWidget(
                text: 'Search results',
                color: Colors.black,
                fontSize: 32.sp,
                fontFamily: GoogleFonts.montserrat,
              ),
            ),
            SizedBox(
              height: 24.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 24.w),
              child: Row(
                children: [
                  SearchFilterTabs(
                    image: 'assets/svgimages/filter.svg',
                    text: 'Filters',
                  ),
                  SizedBox(
                    width: 14,
                  ),
                  SearchFilterTabs(
                    image: 'assets/svgimages/sort.svg',
                    text: 'Sort',
                  )
                ],
              ),
            ),
            SizedBox(
              height: 24.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 24.w),
              child: SizedBox(
                width: 300,
                child: TextWidget(
                    text: 'Showing search 250 results for “Unisex sneakers”',
                    color: Colors.black54,
                    fontSize: 14,
                    fontFamily: GoogleFonts.montserrat),
              ),
            ),
            SizedBox(
              height: 24.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 24.w, right: 24),
              child: SizedBox(
                  height: 500,
                  child: ViewMoreGrid(
                    productList: productNotifier.female,
                  )),
            ),
            SizedBox(
              height: 16.h,
            ),
          ],
        ),
      ),
    );
  }

  void POPUpBottomNavigationBar(context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Column();
        });
  }
}
