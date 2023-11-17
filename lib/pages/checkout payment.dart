// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shewhead_shoes_app/widgets/SHOPINGMETHOD.dart';
import 'package:shewhead_shoes_app/widgets/reusablebutton.dart';
import 'package:shewhead_shoes_app/widgets/textwidget.dart';

class checkoutpayment extends StatelessWidget {
  const checkoutpayment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 24.w),
            child: SvgPicture.asset(
              'assets/svgimages/notification.svg',
              width: 30,
              height: 30,
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
                text: 'Checkout',
                color: Colors.black,
                fontSize: 32.sp,
                fontFamily: GoogleFonts.montserrat,
              ),
            ),
            SizedBox(
              height: 52.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 24.w, right: 24.w),
              child: TextWidget(
                text: 'Payment method',
                color: Colors.black,
                fontSize: 20.sp,
                fontFamily: GoogleFonts.montserrat,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 24.w, right: 24.w),
              child: TextWidget(
                text:
                    'Lorem ipsum dolor sit amet consectetur. Sed blandit vel tempor nascetur id eget.',
                color: Colors.black,
                fontSize: 12.sp,
                fontFamily: GoogleFonts.montserrat,
              ),
            ),
            SizedBox(
              height: 24.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 24.w,
              ),
              child: shopingMethod(Balance: '', title: 'Debit card'),
            ),
            SizedBox(
              height: 12.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 24.w,
              ),
              child: shopingMethod(Balance: '', title: 'Credit card'),
            ),
            SizedBox(
              height: 12.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 24.w,
              ),
              child: shopingMethod(Balance: '', title: 'Crypto wallet'),
            ),
            SizedBox(
              height: 12.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 24.w,
              ),
              child: shopingMethod(Balance: 'Free', title: 'ShewHead Delivery'),
            ),
            SizedBox(
              height: 137.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 24.w, right: 24.w),
              child: ReusableBTN(
                Title: 'Continue',
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
