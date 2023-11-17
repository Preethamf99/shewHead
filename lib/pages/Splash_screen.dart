// ignore_for_file: prefer_const_constructors, prefer_final_fields

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shewhead_shoes_app/on%20boarding%20screens/on%20boarding%20Screen1.dart';
import 'package:shewhead_shoes_app/on%20boarding%20screens/on%20boarding%20Screen2.dart';
import 'package:shewhead_shoes_app/on%20boarding%20screens/on%20boarding%20Screen3.dart';
import 'package:shewhead_shoes_app/on%20boarding%20screens/on%20boarding%20Screen4.dart';
import 'package:shewhead_shoes_app/providers/pageprovider.dart';
import 'package:shewhead_shoes_app/widgets/bottomnavigationbar.dart';
import 'package:shewhead_shoes_app/widgets/onboardbtn.dart';
import 'package:shewhead_shoes_app/widgets/reusablebutton.dart';
import 'package:shewhead_shoes_app/widgets/utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int pageIndex = 0;
  PageController _pageController = PageController(
    initialPage: 0,
    // Show only one page at a time
  );
  bool loading = false;

  final List<Widget> _pages = [
    OnBoardScreen1(),
    OnBoardScreen2(),
    OnBoardScreen3(),
    OnBoardScreen4(),
  ];

  int currentPage = 0;
  // bool firestpage = false;
  FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        currentPage = _pageController.page?.round() ?? 0;
      });
    });
  }

  _storonboarding() async {
    int isviewed = 0;
    SharedPreferences prfs = await SharedPreferences.getInstance();
    await prfs.setInt('SplashScreen', isviewed);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<OnBoardNotifier>(
        builder: (context, OnBoardNotifier, child) => Scaffold(
              body: Stack(
                children: [
                  PageView.builder(
                    physics: OnBoardNotifier.isLastPage
                        ? NeverScrollableScrollPhysics()
                        : AlwaysScrollableScrollPhysics(),

                    controller: _pageController,
                    itemCount: _pages.length,

                    onPageChanged: (value) {
                      setState(() {
                        pageIndex = value;
                        OnBoardNotifier.isLastPage = value == 3;
                      });
                    }, // Set the total number of pages
                    itemBuilder: (context, int index) => _pages[index],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                            padding: EdgeInsets.only(top: 620.h),
                            child: currentPage == 3
                                ? Row()
                                : Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: List.generate(
                                        4,
                                        (dotindicator) => Container(
                                              width: dotindicator == pageIndex
                                                  ? 50
                                                  : 25,
                                              height: 5,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  color: dotindicator ==
                                                          pageIndex
                                                      ? Color(0xFF000000)
                                                      : Color(0xFF4C4C4C)
                                                          .withOpacity(0.6)),
                                            )),
                                  )

                            //  Container(
                            //   margin: EdgeInsets.only(bottom: 50.h),
                            //   child: SmoothPageIndicator(
                            //     effect: ExpandingDotsEffect(
                            //       dotWidth: 25.w,
                            //       dotHeight: 4.h,
                            //       dotColor: Color(0xFF4C4C4C),
                            //       activeDotColor: Color(0xFF000000),
                            //     ),
                            //     controller: _pageController,
                            //     count: _pages.length,
                            //   ),
                            // ),
                            ),
                        SizedBox(
                          height: 30,
                        ),
                        currentPage == 3
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ReusableBTN(
                                    loading: loading,
                                    Title: 'Get Strated',
                                    onTap: () {
                                      setState(() {
                                        loading = true;
                                      });
                                      _storonboarding();
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => Rootpage(),
                                          )).then((value) {
                                        setState(() {
                                          loading = false;
                                          utils().tostmessage(
                                              "${_auth.currentUser} Welcome");
                                        });
                                      });
                                    },
                                  )
                                ],
                              )
                            : Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  currentPage == 0
                                      ? SizedBox()
                                      : InkWell(
                                          onTap: () {
                                            if (currentPage > 0) {
                                              _pageController.previousPage(
                                                duration:
                                                    Duration(milliseconds: 500),
                                                curve: Curves.easeIn,
                                              );
                                            }
                                          },
                                          child: OnBoardButton(
                                            needtext: true,
                                            btntext: 'Previous',
                                          ),
                                        ),
                                  // currentPage < _pages.length - 1
                                  // ?
                                  InkWell(
                                    onTap: () {
                                      _pageController.nextPage(
                                        duration: Duration(milliseconds: 500),
                                        curve: Curves.easeIn,
                                      );
                                    },
                                    child: OnBoardButton(
                                      image: Image.asset(
                                          'assets/images/arrow.png'),
                                      needtext: false,
                                    ),
                                  )
                                  // : InkWell(
                                  //     onTap: () {
                                  //       Navigator.pushReplacement(
                                  //         context,
                                  //         MaterialPageRoute(
                                  //           builder: (context) =>
                                  //               HoemPage(),
                                  //         ),
                                  //       );
                                  //     },
                                  //     child: OnBoardButton(
                                  //       btntext: 'Next',
                                  //       needtext: true,
                                  //     )),
                                ],
                              ),
                      ],
                    ),
                  ),
                ],
              ),
            ));
  }
}
