import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shewhead_shoes_app/providers/product_notifier.dart';
import 'package:shewhead_shoes_app/widgets/images.dart';
import 'package:shewhead_shoes_app/widgets/StagaredGrid.dart';
import 'package:shewhead_shoes_app/widgets/productlistsItem.dart';
import 'package:shewhead_shoes_app/widgets/textwidget.dart';

class CategoryMore extends StatefulWidget {
  const CategoryMore({super.key});

  @override
  State<CategoryMore> createState() => _CategoryMoreState();
}

class _CategoryMoreState extends State<CategoryMore> {
  bool showAllItems = false;
  @override
  Widget build(BuildContext context) {
    var productNotifier = Provider.of<ProductsNotifier>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.only(left: 8.h, right: 24.h, top: 12.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(
                  'assets/svgimages/search-normal.svg',
                  width: 30,
                  height: 30,
                ),
                SizedBox(
                  width: 32.w,
                ),
                SvgPicture.asset(
                  'assets/svgimages/notification.svg',
                  width: 30,
                  height: 30,
                ),
              ],
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 24.w),
              child: TextWidget(
                text: 'Category',
                color: Colors.black,
                fontSize: 32.sp,
                fontFamily: GoogleFonts.montserrat,
              ),
            ),
            SizedBox(
              height: 24.h,
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: SizedBox(
                  child: StaggeredGrid.count(
                    axisDirection: AxisDirection.down,
                    crossAxisCount: 2,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 16,
                    children: List.generate(CategoryImages.length, (index) {
                      return StagaredGrid(
                          hight: index,
                          catimage:
                              CategoryImages[index]['ShoesImage'].toString(),
                          cattext:
                              CategoryImages[index]['ShoesName'].toString());
                    }),
                  ),
                )),
            SizedBox(
              height: 44.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Recommendations',
                    style: GoogleFonts.montserrat(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            ProductListWidget(productList: productNotifier.kids),
            SizedBox(
              height: 75.h,
            ),
          ],
        ),
      ),
    );
  }
}
