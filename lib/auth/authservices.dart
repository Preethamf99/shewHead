// ignore_for_file: prefer_const_constructors,, non_constant_identifier_names

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shewhead_shoes_app/pages/Home_Page.dart';
import 'package:shewhead_shoes_app/pages/LoginScreen.dart';
import 'package:shewhead_shoes_app/widgets/bottomnavigationbar.dart';

class SplashServices {
  void islogin(BuildContext context) {
    final auth = FirebaseAuth.instance;
    final User = auth.currentUser;
    if (User != null) {
      Timer(
          Duration(seconds: 3),
          () => Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Rootpage();
              })));
    } else {
      Timer(
          Duration(seconds: 3),
          () => Navigator.push(context, MaterialPageRoute(builder: (context) {
                return LoginScreen();
              })));
    }
  }
  // Timer.periodic(Duration(seconds: 3), (timer) {
  //   Navigator.push(context, MaterialPageRoute(
  //     builder: (context) {
  //       return LoginScreen();
  //     },
}
