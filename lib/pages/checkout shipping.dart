import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shewhead_shoes_app/widgets/SHOPINGMETHOD.dart';
import 'package:shewhead_shoes_app/widgets/reusablebutton.dart';
import 'package:shewhead_shoes_app/widgets/textwidget.dart';

class checkoutshipping extends StatelessWidget {
  const checkoutshipping({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 24.w),
            child: SvgPicture.asset(
              'assets/images/svgimages/notification.svg',
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
                needBold: true,
                text: 'Shipping address',
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
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.black54)),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                        needBold: true,
                        text: 'Shipping address',
                        color: Colors.black54,
                        fontSize: 12.sp,
                        fontFamily: GoogleFonts.montserrat,
                      ),
                      TextWidget(
                        needBold: true,
                        text: '4517 Washington Ave. Manchester, Kentucky 39495',
                        color: Colors.black87,
                        fontSize: 14.sp,
                        fontFamily: GoogleFonts.montserrat,
                      ),
                    ]),
              ),
            ),
            SizedBox(
              height: 12.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 24.w,
              ),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 18.h),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.black54)),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                        text: 'Shipping address',
                        color: Colors.black54,
                        fontSize: 12.sp,
                        fontFamily: GoogleFonts.montserrat,
                      ),
                      TextWidget(
                        needBold: true,
                        text: '4517 Washington Ave. Manchester, Kentucky 39495',
                        color: Colors.black87,
                        fontSize: 14.sp,
                        fontFamily: GoogleFonts.montserrat,
                      ),
                    ]),
              ),
            ),
            SizedBox(
              height: 12.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 24.w,
              ),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 18.h),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.black54)),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                        text: 'Add new address',
                        color: Colors.black54,
                        fontSize: 12.sp,
                        fontFamily: GoogleFonts.montserrat,
                      ),
                    ]),
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Row(
                children: [
                  TextWidget(
                    needBold: true,
                    text: 'Shipping Method',
                    color: Colors.black54,
                    fontSize: 20.sp,
                    fontFamily: GoogleFonts.montserrat,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 24.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 24.w,
              ),
              child: shopingMethod(Balance: 'Free', title: 'ShewHead Delivery'),
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
              height: 12.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 24.w,
              ),
              child: shopingMethod(Balance: 'Free', title: 'ShewHead Delivery'),
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
              height: 58.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 24.w, right: 24.w),
              child: InkWell(
                  onTap: () {},
                  child: ReusableBTN(
                    Title: 'Continue',
                    onTap: () {},
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
