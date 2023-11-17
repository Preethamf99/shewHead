// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:shewhead_shoes_app/model/const.dart';
import 'package:shewhead_shoes_app/pages/cart.dart';
import 'package:shewhead_shoes_app/pages/profile.dart';
import 'package:shewhead_shoes_app/pages/wishlist.dart';
import 'package:shewhead_shoes_app/providers/favourite+provider.dart';
import 'package:shewhead_shoes_app/providers/product_notifier.dart';
import 'package:shewhead_shoes_app/widgets/DiscovermoreScrection.dart';
import 'package:shewhead_shoes_app/widgets/ExpantionTail.dart';
import 'package:shewhead_shoes_app/widgets/SectionTab.dart';
import 'package:shewhead_shoes_app/widgets/TostUtils.dart';
import 'package:shewhead_shoes_app/widgets/images.dart';
import 'package:shewhead_shoes_app/widgets/productlistsItem.dart';
import 'package:shewhead_shoes_app/widgets/reusablebutton.dart';
import 'package:shewhead_shoes_app/widgets/textwidget.dart';

class productDetailsScreen extends StatefulWidget {
  final String category, id;
  const productDetailsScreen({
    super.key,
    required this.category,
    required this.id,
  });

  @override
  State<productDetailsScreen> createState() => _productDetailsScreenState();
}

class _productDetailsScreenState extends State<productDetailsScreen> {
  final size = ['item1', 'item2', 'item3', 'item4', 'item5', 'item6'];
  final color = {'Red', 'Black', 'Brown', 'Blue', 'Green', 'White'};
  String? dropdownSizevalue;
  String? dropdownColrvalue;
  final PageController pageController = PageController();
  final _favbox = Hive.box('fav_box');
  final _CartBox = Hive.box('cart_box');
  Future<void> _createFev(Map<String, dynamic> addFav) async {
    await _favbox.add(addFav);
    getFavourites();
  }

  Future<void> _createCart(Map<String, dynamic> NewCart) async {
    await _CartBox.add(NewCart);
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
        'imageUrl': item['imageUrl']
      };
    }).toList();
    favor = favdata.toList();
    ids = favdata.map((item) => item['id']).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var productNotifier = Provider.of<ProductsNotifier>(context, listen: true);

    productNotifier.getShoes(widget.category, widget.id);
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 24.w),
            child: CircleAvatar(
              backgroundColor: Color(0xffCFCFCF),
              radius: 24.r,
              child: SvgPicture.asset(
                'assets/svgimages/more.svg',
                width: 30,
                height: 30,
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
            future: productNotifier.sneaker,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text("Error ${snapshot.error}");
              } else {
                final sneaker = snapshot.data;
                return Column(
                  children: [
                    SizedBox(
                      height: 250,
                      child: PageView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: sneaker!.imageUrl.length,
                          controller: pageController,
                          onPageChanged: (page) {
                            productNotifier.activePage = page;
                          },
                          itemBuilder: (context, int index) {
                            return Stack(
                              children: [
                                Container(
                                  height: 250,
                                  width: double.infinity,
                                  color: Colors.grey.shade300,
                                  child: CachedNetworkImage(
                                    imageUrl: sneaker.imageUrl[index],
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                Positioned(
                                    bottom: 32,
                                    right: 32,
                                    child: IconButton(
                                      onPressed: () {
                                        print('object');
                                        setState(() {
                                          if (ids.contains(widget.id)) {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        wishlistScreen()));
                                          } else {
                                            _createFev({
                                              'id': sneaker.id,
                                              'name': sneaker.name,
                                              'category': sneaker.category,
                                              'price': sneaker.price,
                                              'imageUrl': sneaker.imageUrl[0],
                                            });
                                          }
                                        });
                                      },
                                      icon: ids.contains(widget.id)
                                          ? Icon(
                                              AntDesign.heart,
                                              color: Colors.black87
                                                  .withOpacity(0.7),
                                            )
                                          : Icon(
                                              AntDesign.hearto,
                                              color: Colors.black87
                                                  .withOpacity(0.7),
                                            ),
                                    )),
                                Positioned(
                                    bottom: 42,
                                    right: 0,
                                    left: 0,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: List<Widget>.generate(
                                          sneaker.imageUrl.length,
                                          (index) => Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 4),
                                                child: CircleAvatar(
                                                  radius: 5,
                                                  backgroundColor:
                                                      productNotifier
                                                                  .activePage !=
                                                              index
                                                          ? Colors.grey
                                                          : Colors.black,
                                                ),
                                              )),
                                    )),
                              ],
                            );
                          }),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 24.w),
                      child: Row(
                        children: [
                          TextWidget(
                            needBold: true,
                            text: sneaker.category,
                            color: Colors.black54,
                            fontSize: 14,
                            fontFamily: GoogleFonts.montserrat,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 24.w, right: 24.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextWidget(
                            text: sneaker.name,
                            needBold: true,
                            color: Colors.black,
                            fontSize: 20.sp,
                            fontFamily: GoogleFonts.montserrat,
                          ),
                          TextWidget(
                            text: sneaker.price,
                            needBold: true,
                            color: Colors.black,
                            fontSize: 20.sp,
                            fontFamily: GoogleFonts.montserrat,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 24.w,
                        right: 24.w,
                      ),
                      child: Row(
                        children: [
                          RatingBar.builder(
                            initialRating: 4,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemSize: 22,
                            itemPadding:
                                const EdgeInsets.symmetric(horizontal: 1),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              size: 18,
                              color: Colors.black,
                            ),
                            onRatingUpdate: (rating) {},
                          ),
                          TextWidget(
                              fontFamily: GoogleFonts.montserrat,
                              text: '4.8',
                              color: Colors.black87,
                              fontSize: 14.sp),
                          SizedBox(
                            width: 14.w,
                          ),
                          Text(
                            '120',
                            style: GoogleFonts.montserrat(
                                color: Colors.black87,
                                fontWeight: FontWeight.w400,
                                fontSize: 14.sp),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 24.w, right: 24.w),
                      child: Row(
                        children: [
                          TextWidget(
                              needBold: true,
                              text: 'Description',
                              color: Colors.black54,
                              fontSize: 16.sp,
                              fontFamily: GoogleFonts.montserrat),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 24.w, right: 24.w),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 327.w,
                            child: Text(
                              sneaker.description,
                              style: TextStyle(
                                color: Colors.black87,
                                fontFamily: 'montserrat',
                                wordSpacing: 6,
                                height: 1.3,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
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
                            'Size',
                            style: GoogleFonts.montserrat(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.black87),
                          ),
                          Text(
                            'Sizing help',
                            style: GoogleFonts.montserrat(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.black87),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
                      width: 327,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black)),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          icon: Icon(CupertinoIcons.arrowtriangle_down_fill),
                          hint: TextWidget(
                              text: 'Select size',
                              color: Colors.black87,
                              fontSize: 16.sp,
                              fontFamily: GoogleFonts.montserrat),
                          value: dropdownSizevalue,
                          isExpanded: true,
                          items:
                              size.map((item) => buildMenuItem(item)).toList(),
                          onChanged: (value) {
                            setState(() {
                              dropdownSizevalue = value;
                            });
                          },
                        ),
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
                            'Color',
                            style: GoogleFonts.montserrat(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.black87),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
                      width: 327,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black)),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          icon: Icon(CupertinoIcons.arrowtriangle_down_fill),
                          hint: TextWidget(
                            text: 'Select colour',
                            color: Colors.black87,
                            fontSize: 16.sp,
                            fontFamily: GoogleFonts.montserrat,
                          ),
                          value: dropdownColrvalue,
                          isExpanded: true,
                          items:
                              color.map((item) => buildMenuItem(item)).toList(),
                          onChanged: (value) {
                            setState(() {
                              dropdownColrvalue = value;
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    Container(
                        width: 327,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)),
                        child: ExpantionDetailTail(
                            titletext: 'Review',
                            discription: sneaker.description)),
                    SizedBox(
                      height: 12.h,
                    ),
                    Container(
                        width: 327,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)),
                        child: ExpantionDetailTail(
                            titletext: 'Brand',
                            discription: sneaker.description)),
                    SizedBox(
                      height: 12.h,
                    ),
                    Container(
                        width: 327,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)),
                        child: ExpantionDetailTail(
                            titletext: 'Product details',
                            discription: sneaker.description)),
                    SizedBox(
                      height: 12.h,
                    ),
                    Container(
                        width: 327,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)),
                        child: ExpantionDetailTail(
                            titletext: 'Customer care',
                            discription: sneaker.description)),
                    SizedBox(
                      height: 44.h,
                    ),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.w),
                        child: CustomSectionWidget(
                            sectionTitle: 'Male-Section',
                            onMorePressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProfileScreen()));
                            })),
                    SizedBox(
                      height: 16.h,
                    ),
                    ProductListWidget(productList: productNotifier.male),
                    SizedBox(
                      height: 29.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20.w),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => cartScreeen()));
                            },
                            child: SizedBox(
                              child: Padding(
                                padding: EdgeInsets.all(24.r),
                                child: SvgPicture.asset(
                                    'assets/svgimages/shopping-bag.svg'),
                              ),
                            ),
                          ),
                          ReusableBTN(
                            Title: 'Buy now',
                            onTap: () {
                              _createCart({
                                "id": sneaker.id,
                                "name": sneaker.name,
                                "category": sneaker.category,
                                "imageUrl": sneaker.imageUrl[0],
                                "price": sneaker.price,
                                "qty": 1
                              }).then((value) {
                                utils()
                                    .tostmessage('" ${sneaker.name} " added');
                              });
                              print(sneaker.name);
                            },
                          )
                        ],
                      ),
                    )
                  ],
                );
              }
            }),
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(
    String item,
  ) =>
      DropdownMenuItem(
        value: item,
        child: Text(item),
      );
}
