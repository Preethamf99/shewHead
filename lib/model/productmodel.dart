// 1. Product Model
import 'package:flutter/cupertino.dart';

class Product {
  String? name;
  String? brandname;
  String? Description;
  String? price;
  String? BrandDescription;
  String? ProductDetail;
  String? reviewNo;
  String? review;
  String? customerCare;
  String? Shoesimage1, Shoesimage2, Shoesimage3;

  Product({
    this.name,
    this.price,
    this.BrandDescription,
    this.Description,
    this.ProductDetail,
    this.Shoesimage1,
    this.Shoesimage2,
    this.Shoesimage3,
    this.customerCare,
    this.review,
    this.reviewNo,
    this.brandname,
  });
}

// 2. Product State Management Class
class ProductProvider with ChangeNotifier {
  List<Product> _products = [];

  List<Product> get products => _products;

  void addProduct(Product product) {
    _products.add(product);
    notifyListeners();
  }
}
