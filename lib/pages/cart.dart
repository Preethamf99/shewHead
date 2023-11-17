// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shewhead_shoes_app/pages/SearchResult.dart';
import 'package:shewhead_shoes_app/providers/CartProvider.dart';
import 'package:shewhead_shoes_app/providers/product_notifier.dart';
import 'package:shewhead_shoes_app/widgets/cartwidget.dart';
import 'package:shewhead_shoes_app/widgets/productlistsItem.dart';
import 'package:shewhead_shoes_app/widgets/reusablebutton.dart';
import 'package:shewhead_shoes_app/widgets/textwidget.dart';

class cartScreeen extends StatefulWidget {
  const cartScreeen({super.key});

  @override
  State<cartScreeen> createState() => _cartScreeenState();
}

class _cartScreeenState extends State<cartScreeen> {
  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<CartProvider>(context, listen: true);
    var productNotifier = Provider.of<ProductsNotifier>(context, listen: true);
    cartProvider.getCart();
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.only(left: 8.h, right: 24.h, top: 12.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SearchResult()));
                  },
                  child: SvgPicture.asset(
                    'assets/svgimages/search-normal.svg',
                    width: 30,
                    height: 30,
                  ),
                ),
                SizedBox(
                  width: 32.w,
                ),
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
                text: 'Cart',
                color: Colors.black,
                fontSize: 32.sp,
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
                child: SizedBox(
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: cartProvider.cart.length,
                    itemBuilder: (context, index) {
                      final data = cartProvider.cart[index];
                      return Padding(
                        padding: EdgeInsets.only(bottom: 12.h),
                        child: CartWidget(
                          image: data['imageUrl'],
                          category: data['category'],
                          name: data['name'],
                          color: 'black',
                          price: data['price'],
                          size: 40,
                          data: data,
                          index: index,
                        ),
                      );
                    },
                  ),
                )),
            Padding(
              padding: EdgeInsets.only(left: 24.w),
              child: TextWidget(
                text: 'Promo code',
                color: Colors.black,
                fontSize: 18.sp,
                fontFamily: GoogleFonts.montserrat,
              ),
            ),
            SizedBox(
              height: 12.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter promo code',
                    focusedBorder: OutlineInputBorder(),
                    hintStyle: TextStyle(fontFamily: 'montserrat'),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 12.h, horizontal: 24.w),
                    suffixIcon: Padding(
                      padding:
                          EdgeInsets.only(right: 24.w, top: 8.h, bottom: 8.h),
                      child: CircleAvatar(
                        radius: 24.r,
                        backgroundColor: Colors.black,
                        child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            )),
                      ),
                    )),
              ),
            ),
            SizedBox(
              height: 28.h,
            ),
            SizedBox(
              width: double.infinity,
              height: 232.h,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      text: 'Order summary',
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontFamily: GoogleFonts.montserrat,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextWidget(
                          text: 'Subtotal',
                          color: Colors.black,
                          fontSize: 14.sp,
                          fontFamily: GoogleFonts.montserrat,
                        ),
                        TextWidget(
                          text: 'N156,000.00',
                          color: Colors.black,
                          fontSize: 16.sp,
                          fontFamily: GoogleFonts.montserrat,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextWidget(
                          text: 'Discount',
                          color: Colors.black,
                          fontSize: 14.sp,
                          fontFamily: GoogleFonts.montserrat,
                        ),
                        TextWidget(
                          text: '',
                          color: Colors.black,
                          fontSize: 16.sp,
                          fontFamily: GoogleFonts.montserrat,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextWidget(
                          text: 'Shipping fee',
                          color: Colors.black,
                          fontSize: 14.sp,
                          fontFamily: GoogleFonts.montserrat,
                        ),
                        TextWidget(
                          text: 'N5,000.00',
                          color: Colors.black,
                          fontSize: 16.sp,
                          fontFamily: GoogleFonts.montserrat,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextWidget(
                          text: 'Total',
                          needBold: true,
                          color: Colors.black,
                          fontSize: 14.sp,
                          fontFamily: GoogleFonts.montserrat,
                        ),
                        TextWidget(
                          text: 'N161,000.00',
                          color: Colors.black,
                          fontSize: 20.sp,
                          fontFamily: GoogleFonts.montserrat,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Recently viewed',
                    style: GoogleFonts.montserrat(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            ProductListWidget(productList: productNotifier.male),
            SizedBox(
              height: 40.h,
            ),
            ReusableBTN(
              Title: 'To checkout',
              onTap: () {},
            ),
            SizedBox(
              height: 35.h,
            ),
          ],
        ),
      ),
    );
  }
}
