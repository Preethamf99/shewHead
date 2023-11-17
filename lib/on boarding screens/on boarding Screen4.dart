import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shewhead_shoes_app/auth/authservices.dart';

class OnBoardScreen4 extends StatefulWidget {
  const OnBoardScreen4({super.key});

  @override
  State<OnBoardScreen4> createState() => _OnBoardScreen4State();
}

class _OnBoardScreen4State extends State<OnBoardScreen4> {
  @override
  Widget build(BuildContext context) {
    SplashServices splashScreen = SplashServices();
    @override
    void initState() {
      // TODO: implement initState
      super.initState();
      splashScreen.islogin(context);
    }

    return Container(
      color: Color(0xffD6D6D6),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/onboard_Gear _4.png'),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Customized',
                    style: GoogleFonts.montserrat(
                        fontSize: 32.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  Text(
                    'The ability to personalise the app to fit the your preferences.',
                    style: GoogleFonts.montserrat(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
