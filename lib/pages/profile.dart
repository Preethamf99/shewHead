// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shewhead_shoes_app/pages/LoginScreen.dart';
import 'package:shewhead_shoes_app/pages/checkout%20payment.dart';
import 'package:shewhead_shoes_app/pages/checkout%20shipping.dart';
import 'package:shewhead_shoes_app/pages/personal%20information.dart';
import 'package:shewhead_shoes_app/widgets/Profile%20Tabs.dart';
import 'package:shewhead_shoes_app/widgets/TostUtils.dart';
import 'package:shewhead_shoes_app/widgets/quickInfoTab.dart';
import 'package:shewhead_shoes_app/widgets/reusablebutton.dart';
import 'package:shewhead_shoes_app/widgets/textwidget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    FirebaseAuth _auth = FirebaseAuth.instance;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.settings,
                size: 30,
              )),
          Padding(
              padding: EdgeInsets.only(right: 24.w),
              child: SvgPicture.asset(
                'assets/svgimages/notification.svg',
                width: 30,
                height: 30,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 24.w),
              child: TextWidget(
                text: 'Profile',
                color: Colors.black,
                fontSize: 32.sp,
                fontFamily: GoogleFonts.montserrat,
              ),
            ),
            SizedBox(
              height: 24.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 24.w, right: 24.w),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return checkoutshipping();
                      }));
                    },
                    child: QuickInfo(
                      title: '4',
                      subsitle: 'To be shipped',
                    ),
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  QuickInfo(
                    title: '4',
                    subsitle: '  Shipped    ',
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  QuickInfo(
                    title: '4',
                    subsitle: 'To be reviewed',
                  )
                ],
              ),
            ),
            SizedBox(
              height: 24.h,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PersonalInformationScreen()));
              },
              child: Padding(
                padding: EdgeInsets.only(left: 24.w, right: 24.w),
                child: ProfileTabs(
                  Title: 'Personal information',
                ),
              ),
            ),
            SizedBox(
              height: 12.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 24.w, right: 24.w),
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return checkoutpayment();
                  }));
                },
                child: ProfileTabs(
                  Title: 'Payment method',
                ),
              ),
            ),
            SizedBox(
              height: 12.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 24.w, right: 24.w),
              child: ProfileTabs(
                Title: 'Notification',
              ),
            ),
            SizedBox(
              height: 12.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 24.w, right: 24.w),
              child: ProfileTabs(
                Title: 'Language',
              ),
            ),
            SizedBox(
              height: 12.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 24.w, right: 24.w),
              child: ProfileTabs(
                Title: 'About us',
              ),
            ),
            SizedBox(
              height: 12.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 24.w, right: 24.w),
              child: ProfileTabs(
                Title: 'Customer care',
              ),
            ),
            SizedBox(
              height: 12.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 24.w, right: 24.w),
              child: ProfileTabs(
                Title: 'Version',
              ),
            ),
            SizedBox(
              height: 12.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 24.w, right: 24.w),
              child: ReusableBTN(
                loading: loading,
                Title: 'Log out',
                onTap: () {
                  setState(() {
                    loading = true;
                  });
                  _auth.signOut().then((value) {
                    setState(() {
                      loading = false;
                    });
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                    utils().tostmessage('Logout');
                  }).onError((error, stackTrace) {
                    setState(() {
                      loading = false;
                    });
                    utils().tostmessage(error.toString());
                  });
                },
              ),
            ),
            SizedBox(
              height: 39.h,
            ),
          ],
        ),
      ),
    );
  }
}
