// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shewhead_shoes_app/model/ShoesModel.dart';
import 'package:shewhead_shoes_app/pages/SearchScreen.dart';
import 'package:shewhead_shoes_app/widgets/productlistsItem.dart';
import 'package:shewhead_shoes_app/widgets/textwidget.dart';

import '../providers/product_notifier.dart';

class ViewMore extends StatelessWidget {
  final String SectionName;
  final Future<List<Shoes>> productlist;
  const ViewMore(
      {super.key, required this.SectionName, required this.productlist});

  @override
  Widget build(BuildContext context) {
    final productNotifier =
        Provider.of<ProductsNotifier>(context, listen: true);
    productNotifier.getfemale();
    productNotifier.getMale();
    productNotifier.getKids();

    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.only(left: 8.h, right: 24.h, top: 12.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return SearchScreen();
                    }));
                  },
                  child: SvgPicture.asset(
                    'assets/svgimages/notification.svg',
                    width: 30,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 24.w),
            child: TextWidget(
              text: SectionName,
              color: Colors.black,
              fontSize: 32.sp,
              fontFamily: GoogleFonts.montserrat,
            ),
          ),
          SizedBox(
            height: 24.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.w, right: 10),
            child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.8,
                child: ViewMoreGrid(
                  productList: productlist,
                )),
          )
        ],
      ),
    );
  }
}
