// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, avoid_types_as_parameter_names

import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:shewhead_shoes_app/model/const.dart';
import 'package:shewhead_shoes_app/pages/wishlist.dart';
import 'package:shewhead_shoes_app/widgets/TostUtils.dart';
import 'package:shewhead_shoes_app/widgets/textwidget.dart';

class ProductCard extends StatefulWidget {
  final String price, category, name, id, image, oldPrice;

  ProductCard({
    super.key,
    required this.name,
    required this.price,
    required this.category,
    required this.id,
    required this.image,
    required this.oldPrice,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  final _favbox = Hive.box('fav_box');
  Future<void> _createFev(Map<String, dynamic> addFav) async {
    await _favbox.add(addFav);
    getFavourites();
  }

  getFavourites() {
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
    favor = favdata.toList();
    ids = favdata.map((item) => item['id']).toList();
    setState(() {});
  }

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
                      FancyShimmerImage(
                        imageUrl: widget.image,
                        boxFit: BoxFit.contain,
                        width: 180,
                        height: 120,
                      ),
                      Padding(
                          padding: EdgeInsets.only(top: 4.h, right: 4.w),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: IconButton(
                              onPressed: () {
                                print('object');
                                if (ids.contains(widget.id)) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              wishlistScreen()));
                                } else {
                                  setState(() {
                                    _createFev({
                                      'id': widget.id,
                                      'name': widget.name,
                                      'category': widget.category,
                                      'price': widget.price,
                                      'imageUrl': widget.image
                                    }).then((value) {
                                      utils().tostmessage(
                                          '${widget.name} Add to WishList');
                                    });
                                  });
                                }
                              },
                              icon: ids.contains(widget.id)
                                  ? Icon(
                                      AntDesign.heart,
                                      color: Colors.black87.withOpacity(0.7),
                                    )
                                  : Icon(
                                      AntDesign.hearto,
                                      color: Colors.black87.withOpacity(0.7),
                                    ),
                            ),
                          )),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 8.w, top: 8.h),
                    child: TextWidget(
                        fontFamily: GoogleFonts.montserrat,
                        text: widget.category,
                        color: Colors.black87,
                        fontSize: 10.sp),
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 8.w, top: 8.h),
                      child: Text(
                        widget.name,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.montserrat(
                          color: Colors.black87,
                          fontSize: 12.sp,
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
                            fontFamily: GoogleFonts.montserrat,
                            needBold: true,
                            text: widget.price,
                            color: Colors.black87,
                            fontSize: 10.sp),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          widget.oldPrice,
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
                    padding: EdgeInsets.only(left: 8.w, top: 4.h, bottom: 8),
                    child: Row(
                      children: [
                        Icon(
                          Icons.star,
                          size: 15,
                        ),
                        TextWidget(
                            fontFamily: GoogleFonts.montserrat,
                            needBold: true,
                            text: '4.5',
                            color: Colors.black87,
                            fontSize: 10.sp),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          "120 Review",
                          style: GoogleFonts.montserrat(
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
