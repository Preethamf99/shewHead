// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:shewhead_shoes_app/model/const.dart';
import 'package:shewhead_shoes_app/providers/product_notifier.dart';
import 'package:shewhead_shoes_app/widgets/Catagory%20tab.dart';
import 'package:shewhead_shoes_app/widgets/TostUtils.dart';
import 'package:shewhead_shoes_app/widgets/productlistsItem.dart';
import 'package:shewhead_shoes_app/widgets/textwidget.dart';

class wishlistScreen extends StatefulWidget {
  const wishlistScreen({super.key});

  @override
  State<wishlistScreen> createState() => _wishlistScreenState();
}

List<String> CatagaoryScroll = [
  'All',
  'Sneakers',
  'Track shoes',
  'Boots',
  'Crocs',
  '20% off'
];

class _wishlistScreenState extends State<wishlistScreen> {
  bool All = false;
  bool Sneakers = true;
  bool Trackshoes = false;
  bool Boots = false;
  bool Crocs = false;

  final _favbox = Hive.box('fav_box');

  _deteeteFav(int key, String name) async {
    await _favbox.delete(key).then((value) {
      utils().tostmessage('" ${name} " Removed');
    });
  }

  @override
  Widget build(BuildContext context) {
    var productNotifier = Provider.of<ProductsNotifier>(context, listen: true);
    List<dynamic> fav = [];
    final favdata = _favbox.keys.map((key) {
      final item = _favbox.get(key);
      return {
        'key': key,
        'id': item['id'],
        'category': item['category'],
        'name': item['name'],
        'price': item['price'],
        'imageUrl': item['imageUrl'],
        'oldPrice': item['oldPrice']
      };
    }).toList();
    fav = favdata.reversed.toList();
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
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 24.w, right: 24.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(
                    text: 'Wishlist',
                    color: Colors.black,
                    fontSize: 32.sp,
                    fontFamily: GoogleFonts.montserrat,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/images/svgimages/iconholder.svg',
                        width: 30,
                        height: 30,
                      ),
                      SizedBox(
                        width: 12.w,
                      ),
                      SvgPicture.asset(
                        'assets/images/svgimages/trash.svg',
                        width: 30,
                        height: 30,
                      ),
                    ],
                  ),
                ],
              ),
            ),
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
                              All = true;
                              Sneakers = false;
                              Trackshoes = false;
                              Boots = false;
                              Crocs = false;
                            });
                          },
                          child: CatagaoryScrollTab(
                            isSelected: All,
                            btntitle: 'All',
                          ),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              All = false;
                              Sneakers = true;
                              Trackshoes = false;
                              Boots = false;
                              Crocs = false;
                            });
                          },
                          child: CatagaoryScrollTab(
                            btntitle: 'Sneakers',
                            isSelected: Sneakers,
                          ),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              All = false;
                              Sneakers = false;
                              Trackshoes = true;
                              Boots = false;
                              Crocs = false;
                            });
                          },
                          child: CatagaoryScrollTab(
                            isSelected: Trackshoes,
                            btntitle: 'Track shoes',
                          ),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              All = false;
                              Sneakers = false;
                              Trackshoes = false;
                              Boots = true;
                              Crocs = false;
                            });
                          },
                          child: CatagaoryScrollTab(
                            btntitle: 'Boots',
                            isSelected: Boots,
                          ),
                        ),
                        SizedBox(
                          width: 16.h,
                        ),
                        InkWell(
                            onTap: () {
                              setState(() {
                                All = false;
                                Sneakers = false;
                                Trackshoes = false;
                                Boots = false;
                                Crocs = true;
                              });
                            },
                            child: Padding(
                              padding: EdgeInsets.only(right: 24.w),
                              child: CatagaoryScrollTab(
                                  isSelected: Crocs, btntitle: 'Crocs'),
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
            Padding(
              padding: EdgeInsets.only(right: 24.w, left: 24.w),
              child: SizedBox(
                child: GridView.builder(
                    itemCount: fav.length,
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      final shoe = fav[index];
                      return FittedBox(
                        fit: BoxFit.fill,
                        child: SizedBox(
                          height: 200.h,
                          width: 170.w,
                          child: Row(
                            children: [
                              SizedBox(
                                height: 200.h,
                                width: 170.w,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Stack(
                                      children: [
                                        CachedNetworkImage(
                                            fit: BoxFit.fitWidth,
                                            width: 150,
                                            height: 120,
                                            imageUrl: shoe['imageUrl']),
                                        Align(
                                          alignment: Alignment.topRight,
                                          child: IconButton(
                                            onPressed: () {
                                              print('object');
                                              _deteeteFav(
                                                  shoe['key'], shoe['name']);
                                              setState(() {
                                                ids.removeWhere((element) =>
                                                    element == shoe['id']);
                                              });

                                              // Navigator.push(
                                              //     context,
                                              //     MaterialPageRoute(
                                              //         builder: (context) =>
                                              //             Rootpage()));
                                            },
                                            icon: Icon(
                                              AntDesign.heart,
                                              color: Colors.black87
                                                  .withOpacity(0.7),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.only(left: 8.w, top: 8.h),
                                      child: TextWidget(
                                          fontFamily: GoogleFonts.montserrat,
                                          text: shoe['category'],
                                          color: Colors.black87,
                                          fontSize: 10.sp),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: 8.w, top: 4.h),
                                        child: Text(
                                          shoe['name'],
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.montserrat(
                                            color: Colors.black87,
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: 8.w,
                                      ),
                                      child: Row(
                                        children: [
                                          TextWidget(
                                              fontFamily:
                                                  GoogleFonts.montserrat,
                                              needBold: true,
                                              text: shoe['price'],
                                              color: Colors.black87,
                                              fontSize: 12.sp),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ),
            SizedBox(
              height: 40.h,
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
              height: 36.h,
            ),
          ],
        ),
      ),
    );
  }
}
