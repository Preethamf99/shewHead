// ignore_for_file: prefer_const_constructors

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductImageCarosoul extends StatefulWidget {
  final String image1, image2, image3;
  const ProductImageCarosoul(
      {super.key,
      required this.image1,
      required this.image2,
      required this.image3});

  @override
  State<ProductImageCarosoul> createState() => _ProductImageCarosoulState();
}

class _ProductImageCarosoulState extends State<ProductImageCarosoul> {
  CarouselController carouselController = CarouselController();
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 250,
        child: Stack(children: [
          CarouselSlider(
            carouselController: carouselController,

            items: [
              //1st Image of Slider

              Image.asset(
                widget.image1,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Image.asset(
                width: double.infinity,
                fit: BoxFit.cover,
                widget.image2,
              ),

              Image.asset(
                width: double.infinity,
                fit: BoxFit.cover,
                widget.image3,
              )
            ],

            //Slider Container properties
            options: CarouselOptions(
                height: 230.0,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                viewportFraction: 0.95,
                onPageChanged: (index, reson) {
                  setState(() {
                    _currentIndex = index;
                  });
                }),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: 24.w, top: 190.h, bottom: 24.h, right: 24.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: List.generate(3, (index) {
                    return Container(
                      width: _currentIndex == index
                          ? 32.0.w
                          : 18.w, // Current index dot is larger
                      height: _currentIndex == index ? 4.0.h : 3.0.h,
                      margin:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        color: _currentIndex == index
                            ? Color(0xff575757) // Selected dot color
                            : Color(0xffD9D9D9), // Other dots color
                      ),
                    );
                  }),
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      CupertinoIcons.heart,
                    ))
              ],
            ),
          ),
        ]));
  }
}
