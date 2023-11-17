// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shewhead_shoes_app/model/ShoesModel.dart';
import 'package:shewhead_shoes_app/pages/ProductDetail.dart';
import 'package:shewhead_shoes_app/widgets/productCart.dart';
// Import your product card widget

class ProductListWidget extends StatelessWidget {
  final Future<List<Shoes>> productList;

  ProductListWidget({
    required this.productList,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 212,
      child: FutureBuilder<List<Shoes>>(
        future: productList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          } else {
            final ondiscov = snapshot.data;
            return ListView.builder(
              itemCount: ondiscov!.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final shoe = snapshot.data![index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return productDetailsScreen(
                          category: shoe.category, id: shoe.id);
                    }));
                  },
                  child: ProductCard(
                      oldPrice: shoe.oldPrice,
                      price: '\$${shoe.price}',
                      category: shoe.category,
                      name: shoe.name,
                      id: shoe.id,
                      image: shoe.imageUrl[1]),
                );
              },
            );
          }
        },
      ),
    );
  }
}

class ViewMoreGrid extends StatelessWidget {
  final Future<List<Shoes>> productList;
  const ViewMoreGrid({super.key, required this.productList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<List<Shoes>>(
            future: productList,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              } else {
                final ondiscov = snapshot.data;
                return GridView.builder(
                  itemCount: ondiscov!.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    final shoe = snapshot.data![index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return productDetailsScreen(
                              category: shoe.category, id: shoe.id);
                        }));
                      },
                      child: FittedBox(
                        child: ProductCard(
                            oldPrice: shoe.oldPrice,
                            price: '\$${shoe.price}',
                            category: shoe.category,
                            name: shoe.name,
                            id: shoe.id,
                            image: shoe.imageUrl[1]),
                      ),
                    );
                  },
                );
              }
            }));
  }
}
