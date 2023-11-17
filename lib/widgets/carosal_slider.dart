import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarosoulSlide extends StatefulWidget {
  const CarosoulSlide({super.key});

  @override
  State<CarosoulSlide> createState() => _CarosoulSlideState();
}

class _CarosoulSlideState extends State<CarosoulSlide> {
  CarouselController carouselController = CarouselController();
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 132,
        child: Stack(children: [
          CarouselSlider(
            carouselController: carouselController,

            items: [
              //1st Image of Slider

              Image.asset(
                  width: double.infinity,
                  fit: BoxFit.fill,
                  'assets/images/slider 1.png'),
              Image.asset(
                  width: double.infinity,
                  fit: BoxFit.fill,
                  'assets/images/slider 2.png'),

              Image.asset(
                  width: double.infinity,
                  fit: BoxFit.fill,
                  'assets/images/slider 3.png')
            ],

            //Slider Container properties
            options: CarouselOptions(
                height: 180.0,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                viewportFraction: 0.85,
                onPageChanged: (index, reson) {
                  setState(() {
                    _currentIndex = index;
                  });
                }),
          ),
          Padding(
            padding: EdgeInsets.only(right: 24.w),
            child: Align(
              alignment: Alignment.centerRight,
              child: CircleAvatar(
                radius: 20,
                backgroundColor: Colors.black,
                child: IconButton(
                  onPressed: () {
                    // Use the controller to change the current page
                    carouselController.nextPage();
                  },
                  icon: Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 24.w),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: List.generate(3, (index) {
                  return Container(
                    width: _currentIndex == index
                        ? 24.0
                        : 20, // Current index dot is larger
                    height: _currentIndex == index ? 4.0 : 3.0,
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: _currentIndex == index
                          ? Color(0xff575757) // Selected dot color
                          : Color(0xffD9D9D9), // Other dots color
                    ),
                  );
                }),
              ),
            ),
          ),
        ]));
  }
}
