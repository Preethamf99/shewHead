// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shewhead_shoes_app/auth/authservices.dart';

class SplashScreenOpen extends StatefulWidget {
  const SplashScreenOpen({super.key});

  @override
  State<SplashScreenOpen> createState() => _SplashScreenOpenState();
}

class _SplashScreenOpenState extends State<SplashScreenOpen> {
  SplashServices splashservices = new SplashServices();
  @override
  void initState() {
    // TODO: implement initStat
    super.initState();
    splashservices.islogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: SvgPicture.asset('assets/svgimages/Logo.svg')),
    );
  }
}
