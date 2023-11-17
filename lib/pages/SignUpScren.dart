// ignore_for_file: prefer_const_constructors, prefer_final_fields

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shewhead_shoes_app/pages/Home_Page.dart';
import 'package:shewhead_shoes_app/pages/LoginScreen.dart';
import 'package:shewhead_shoes_app/pages/Splash_screen.dart';
import 'package:shewhead_shoes_app/widgets/TostUtils.dart';
import 'package:shewhead_shoes_app/widgets/bottomnavigationbar.dart';
import 'package:shewhead_shoes_app/widgets/reusablebutton.dart';
import 'package:shewhead_shoes_app/widgets/reusabletextField.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool loading = false;
  final _formKey = GlobalKey<FormState>();
  final emailcontroller = TextEditingController();
  final Passwordcontroller = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailcontroller.dispose();
    Passwordcontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [SvgPicture.asset('assets/svgimages/Logo.svg')],
            ),
            SizedBox(
              height: 50.h,
            ),
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    ReuableTextFormField(
                      needcoustomIcon: false,
                      keyboardType: TextInputType.emailAddress,
                      icon: Icon(Icons.email),
                      controller: emailcontroller,
                      hintText: 'Email',
                      validationtext: 'Enter Email',
                      showSuffixIcon: false,
                      passwordField: false,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ReuableTextFormField(
                      needcoustomIcon: false,
                      keyboardType: TextInputType.text,
                      icon: Icon(Icons.lock),
                      controller: Passwordcontroller,
                      hintText: 'Password',
                      validationtext: 'Enter Password',
                      showSuffixIcon: true,
                      passwordField: true,
                    ),
                  ],
                )),
            SizedBox(
              height: 50,
            ),
            ReusableBTN(
              loading: loading,
              Title: 'Sign Up',
              onTap: () {
                setState(() {
                  loading = true;
                });
                if (_formKey.currentState!.validate()) {
                  _auth
                      .createUserWithEmailAndPassword(
                          email: emailcontroller.text.toString(),
                          password: Passwordcontroller.text.toString())
                      .then((value) {
                    setState(() {
                      loading = false;
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SplashScreen(),
                          ));
                    });
                  }).onError((error, stackTrace) {
                    utils().tostmessage(error.toString());
                    setState(() {
                      loading = false;
                    });
                  });
                }
              },
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account ',
                  style: GoogleFonts.montserrat(
                      fontSize: 16,
                      color: Colors.black87,
                      fontWeight: FontWeight.w400),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return LoginScreen();
                      },
                    ));
                  },
                  child: Text(
                    'Login',
                    style: GoogleFonts.montserrat(
                        fontSize: 18,
                        color: Colors.black87,
                        fontWeight: FontWeight.w600),
                  ),
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}
