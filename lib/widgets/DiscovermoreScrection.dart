import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shewhead_shoes_app/widgets/images.dart';
import 'package:shewhead_shoes_app/widgets/textwidget.dart';

class DisCoveMoreScreen extends StatelessWidget {
  final String ShoesImage, name, salePrice, MRPProce, rating, numberReview;

  DisCoveMoreScreen(
      {super.key,
      required this.ShoesImage,
      required this.name,
      required this.salePrice,
      required this.MRPProce,
      required this.rating,
      required this.numberReview});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.w, right: 16.w),
      child: SizedBox(
        height: 215.h,
        width: 170.w,
        child: Row(
          children: [
            SizedBox(
              height: 215.h,
              width: 170.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Image.asset(
                        fit: BoxFit.cover,
                        width: 180,
                        height: 120,
                        ShoesImage,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 12.h, right: 12.w),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: CircleAvatar(
                            radius: 16.r,
                            child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.favorite,
                                  size: 16.w,
                                  color: Colors.red,
                                )),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 8.w, top: 8.h),
                    child: TextWidget(
                        fontFamily: GoogleFonts.montserrat,
                        text: 'Category',
                        color: Colors.black87,
                        fontSize: 8.sp),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 8.w, top: 8.h),
                    child: TextWidget(
                        fontFamily: GoogleFonts.montserrat,
                        needBold: true,
                        text: name,
                        color: Colors.black87,
                        fontSize: 12.sp),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 8.w,
                    ),
                    child: Row(
                      children: [
                        TextWidget(
                            fontFamily: GoogleFonts.montserrat,
                            needBold: true,
                            text: salePrice,
                            color: Colors.black87,
                            fontSize: 10.sp),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          MRPProce,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.montserrat(
                              decoration: TextDecoration.lineThrough,
                              color: Colors.black87,
                              fontWeight: FontWeight.w400,
                              fontSize: 8),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 8.w, top: 8.h, bottom: 8),
                    child: Row(
                      children: [
                        Icon(
                          Icons.star,
                          size: 15,
                        ),
                        TextWidget(
                            fontFamily: GoogleFonts.montserrat,
                            needBold: true,
                            text: rating,
                            color: Colors.black87,
                            fontSize: 10.sp),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          numberReview,
                          style: GoogleFonts.montserrat(
                              decoration: TextDecoration.lineThrough,
                              color: Colors.black87,
                              fontWeight: FontWeight.w400,
                              fontSize: 8),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
