// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shewhead_shoes_app/pages/SearchScreen.dart';
import 'package:shewhead_shoes_app/pages/profile.dart';
import 'package:shewhead_shoes_app/providers/product_notifier.dart';
import 'package:shewhead_shoes_app/widgets/Catagory%20tab.dart';
import 'package:shewhead_shoes_app/widgets/FevbrandSection.dart';
import 'package:shewhead_shoes_app/widgets/SectionTab.dart';
import 'package:shewhead_shoes_app/widgets/carosal_slider.dart';
import 'package:shewhead_shoes_app/widgets/category_more.dart';
import 'package:shewhead_shoes_app/widgets/images.dart';
import 'package:shewhead_shoes_app/widgets/StagaredGrid.dart';
import 'package:shewhead_shoes_app/widgets/productlistsItem.dart';
import 'package:shewhead_shoes_app/widgets/viewmore.dart';

class HoemPage extends StatefulWidget {
  const HoemPage({super.key});

  @override
  State<HoemPage> createState() => _HoemPageState();
}

List<String> CatagaoryScroll = [
  'New in',
  'All',
  'Trending',
  'Sales',
  'Free delivery',
  '20% off'
];

class _HoemPageState extends State<HoemPage> {
  // Add this to your state class to track current page index
  bool Newin = false;
  bool All = true;
  bool Trending = false;
  bool Sales = false;
  bool Freedelivery = false;
  bool off = false;
  bool showAllItems = false;

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> displayedItems =
        showAllItems ? CategoryImages : CategoryImages.take(4).toList();

    var productNotifier = Provider.of<ProductsNotifier>(context, listen: true);
    productNotifier.getfemale();
    productNotifier.getMale();
    productNotifier.getKids();
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 80,
          titleSpacing: 10,
          title: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 24.w, top: 12),
                child: Container(
                  width: 211.w,
                  height: 48.h,
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(
                              5,
                            )),
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(left: 12.w, right: 12),
                          child: SvgPicture.asset(
                            'assets/svgimages/search-normal.svg',
                            width: 24,
                            height: 24,
                          ),
                        ),
                        filled: true,
                        fillColor: Color(0xffE6E6E6),
                        hintText: 'Search',
                        contentPadding:
                            EdgeInsets.only(top: 8, bottom: 10, left: 10),
                        labelStyle: GoogleFonts.montserrat(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        )),
                  ),
                ),
              ),
            ],
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(left: 8.h, right: 24.h, top: 12.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.filter_list_outlined,
                    size: 40,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return SearchScreen();
                      }));
                    },
                    child: Icon(
                      Icons.notifications,
                      size: 40,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 24.h,
              ),
              ListView(
                shrinkWrap: true,
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: EdgeInsets.only(left: 24.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                Newin = true;
                                All = false;
                                Trending = false;
                                Sales = false;
                                Freedelivery = false;
                                off = false;
                              });
                            },
                            child: CatagaoryScrollTab(
                              isSelected: Newin,
                              btntitle: 'New In',
                            ),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                Newin = false;
                                All = true;
                                Trending = false;
                                Sales = false;
                                Freedelivery = false;
                                off = false;
                              });
                            },
                            child: CatagaoryScrollTab(
                              btntitle: 'All',
                              isSelected: All,
                            ),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                Newin = false;
                                All = false;
                                Trending = true;
                                Sales = false;
                                Freedelivery = false;
                                off = false;
                              });
                            },
                            child: CatagaoryScrollTab(
                              isSelected: Trending,
                              btntitle: 'Trending',
                            ),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                Newin = false;
                                All = false;
                                Trending = false;
                                Sales = true;
                                Freedelivery = false;
                                off = false;
                              });
                            },
                            child: CatagaoryScrollTab(
                              btntitle: 'Sales',
                              isSelected: Sales,
                            ),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                Newin = false;
                                All = false;
                                Trending = false;
                                Sales = false;
                                Freedelivery = true;
                                off = false;
                              });
                            },
                            child: CatagaoryScrollTab(
                              btntitle: 'Free delivery',
                              isSelected: Freedelivery,
                            ),
                          ),
                          SizedBox(
                            width: 16.h,
                          ),
                          InkWell(
                              onTap: () {
                                setState(() {
                                  Newin = false;
                                  All = false;
                                  Trending = false;
                                  Sales = false;
                                  Freedelivery = false;
                                  off = true;
                                });
                              },
                              child: Padding(
                                padding: EdgeInsets.only(right: 24.w),
                                child: CatagaoryScrollTab(
                                    isSelected: off, btntitle: '20% off'),
                              ))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 24.h,
              ),
              CarosoulSlide(),
              SizedBox(
                height: 28.h,
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: CustomSectionWidget(
                      sectionTitle: 'Male-Section',
                      onMorePressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ViewMore(
                                      productlist: productNotifier.male,
                                      SectionName: 'Male-Section',
                                    )));
                      })),
              SizedBox(
                height: 16.h,
              ),
              ProductListWidget(productList: productNotifier.male),
              SizedBox(
                height: 24.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: CustomSectionWidget(
                    sectionTitle: 'Female',
                    onMorePressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ViewMore(
                                    productlist: productNotifier.female,
                                    SectionName: 'Female-Section',
                                  )));
                    }),
              ),
              SizedBox(
                height: 24.h,
              ),
              ProductListWidget(productList: productNotifier.female),
              SizedBox(
                height: 24.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: CustomSectionWidget(
                    sectionTitle: 'Categories',
                    onMorePressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CategoryMore()));
                    }),
              ),
              SizedBox(
                height: 24.h,
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: StaggeredGrid.count(
                    axisDirection: AxisDirection.down,
                    crossAxisCount: 2,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 16,
                    children: List.generate(displayedItems.length, (index) {
                      return StagaredGrid(
                          hight: index,
                          catimage:
                              displayedItems[index]['ShoesImage'].toString(),
                          cattext:
                              displayedItems[index]['ShoesName'].toString());
                    }),
                  )),
              SizedBox(
                height: 24.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: CustomSectionWidget(
                    sectionTitle: 'Favourite Brands',
                    onMorePressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfileScreen()));
                    }),
              ),
              SizedBox(
                height: 19.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: FevBrand(
                  image: 'assets/images/Fevbrandimg1.png',
                  text: 'New Balance',
                  color: Colors.black87,
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: FevBrand(
                  image: 'assets/images/Fevbrandimg2.png',
                  text: 'Adidas',
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: FevBrand(
                  image: 'assets/images/Fevbrandimg3.png',
                  text: 'Converse',
                  color: Colors.black87,
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: FevBrand(
                  image: 'assets/images/Fevbrandimg4.png',
                  text: 'Nike',
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 43.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
