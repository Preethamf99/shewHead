// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shewhead_shoes_app/pages/SignUpScren.dart';
import 'package:shewhead_shoes_app/widgets/TostUtils.dart';
import 'package:shewhead_shoes_app/widgets/bottomnavigationbar.dart';
import 'package:shewhead_shoes_app/widgets/reusablebutton.dart';
import 'package:shewhead_shoes_app/widgets/reusabletextField.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: emailcontroller,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5)),
                        hintText: 'Email',
                        prefixIcon: Icon(Icons.email),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter Email';
                        } else
                          return null;
                      },
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
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Forgot Password ',
                  style: GoogleFonts.montserrat(
                      fontSize: 14,
                      color: Colors.black87,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            ReusableBTN(
              loading: loading,
              Title: 'Login',
              onTap: () {
                setState(() {
                  loading = true;
                });
                if (_formKey.currentState!.validate()) {
                  _auth
                      .signInWithEmailAndPassword(
                          email: emailcontroller.text,
                          password: Passwordcontroller.text)
                      .then((value) {
                    setState(() {
                      loading = false;
                      utils().tostmessage(value.user!.email.toString());
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return Rootpage();
                        },
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
                  'Dont have an account ',
                  style: GoogleFonts.montserrat(
                      fontSize: 16,
                      color: Colors.black87,
                      fontWeight: FontWeight.w400),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return SignUpScreen();
                      },
                    ));
                  },
                  child: Text(
                    'Sign up',
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
