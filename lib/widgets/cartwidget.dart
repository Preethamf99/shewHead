// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shewhead_shoes_app/providers/CartProvider.dart';
import 'package:shewhead_shoes_app/widgets/TostUtils.dart';
import 'package:shewhead_shoes_app/widgets/textwidget.dart';

class CartWidget extends StatelessWidget {
  final Map<String, dynamic> data;
  final String image, category, name, color, price;
  final int index;
  final int size;

  CartWidget({
    Key? key, // Add key parameter here
    required this.image,
    required this.category,
    required this.name,
    required this.color,
    required this.price,
    required this.size,
    required this.data,
    required this.index,
  }) : super(key: key); // Use the key parameter here

  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<CartProvider>(context, listen: true);

    return Container(
      width: 327.w,
      decoration: BoxDecoration(color: Color(0xffF6F6F6)),
      child: Padding(
        padding: EdgeInsets.only(top: 5.h, bottom: 5.h),
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CachedNetworkImage(width: 100, imageUrl: image),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      text: category,
                      color: Colors.black87,
                      fontSize: 10.sp,
                      fontFamily: GoogleFonts.montserrat,
                    ),
                    SizedBox(
                      width: 120,
                      child: TextWidget(
                        needBold: true,
                        text: name,
                        color: Colors.black54,
                        fontSize: 12.sp,
                        fontFamily: GoogleFonts.montserrat,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        TextWidget(
                          text: size.toString(),
                          color: Colors.black87,
                          fontSize: 10.sp,
                          fontFamily: GoogleFonts.montserrat,
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        TextWidget(
                          text: color,
                          color: Colors.black87,
                          fontSize: 10.sp,
                          fontFamily: GoogleFonts.montserrat,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 50.w),
                          child: TextWidget(
                            text: 'Edit',
                            color: Colors.black87,
                            fontSize: 12.sp,
                            fontFamily: GoogleFonts.montserrat,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                cartProvider.decrementCounter(index);
                              },
                              icon: Icon(
                                CupertinoIcons.minus,
                                size: 18.w,
                              ),
                            ),
                            Container(
                              width: 25.w,
                              height: 25.h,
                              decoration: BoxDecoration(color: Colors.black),
                              child: Center(
                                child: Text(
                                  data['counter'].toString(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                cartProvider.incrementCounter(index);
                              },
                              icon: Icon(
                                CupertinoIcons.plus,
                                size: 18.w,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 12.w,
                        ),
                        TextWidget(
                          text: '\$ ${data['price'].toString()}',
                          color: Colors.black87,
                          fontSize: 16.sp,
                          fontFamily: GoogleFonts.montserrat,
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
            Positioned(
              right: 10,
              top: 2,
              child: InkWell(
                onTap: () {
                  cartProvider
                      .deleteCartItem(data['key'] as dynamic)
                      .then((value) {
                    utils().tostmessage('${data['name']}is removed');
                  });
                },
                child: Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: 4, right: 4, bottom: 3, top: 3),
                    child: Icon(
                      AntDesign.delete,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
