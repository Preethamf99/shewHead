// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shewhead_shoes_app/pages/Home_Page.dart';
import 'package:shewhead_shoes_app/pages/cart.dart';
import 'package:shewhead_shoes_app/pages/profile.dart';
import 'package:shewhead_shoes_app/pages/wishlist.dart';

class Rootpage extends StatefulWidget {
  const Rootpage({super.key});

  @override
  State<Rootpage> createState() => _RootpageState();
}

class _RootpageState extends State<Rootpage> {
  List pages = [HoemPage(), cartScreeen(), wishlistScreen(), ProfileScreen()];
  int currentpage = 0;
  void tapping(int index) {
    setState(() {
      currentpage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentpage],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white70,
          elevation: 0,
          selectedFontSize: 20,
          type: BottomNavigationBarType.fixed,
          onTap: tapping,
          currentIndex: currentpage,
          selectedItemColor: Color(0xFF000000),
          selectedLabelStyle: GoogleFonts.montserrat(
              fontSize: 14, color: Colors.black87, fontWeight: FontWeight.w600),
          unselectedItemColor: Colors.black45,
          items: [
            BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: currentpage == 0
                      ? SvgPicture.asset(
                          "assets/svgimages/home-tap.svg",
                        )
                      : SvgPicture.asset(
                          "assets/svgimages/home.svg",
                        ),
                ),
                label: "Home"),
            BottomNavigationBarItem(
                icon: currentpage == 1
                    ? SvgPicture.asset("assets/svgimages/shopping-bag-tap.svg")
                    : SvgPicture.asset("assets/svgimages/shopping-bag.svg"),
                label: "Cart"),
            BottomNavigationBarItem(
              icon: currentpage == 2
                  ? SvgPicture.asset("assets/svgimages/heart-tap.svg")
                  : SvgPicture.asset("assets/svgimages/heart.svg"),
              label: 'Wishlist',
            ),
            BottomNavigationBarItem(
                icon: currentpage == 3
                    ? SvgPicture.asset("assets/svgimages/profile-tap.svg")
                    : SvgPicture.asset("assets/svgimages/profile.svg"),
                label: "Profile"),
          ]),
    );
  }
}
