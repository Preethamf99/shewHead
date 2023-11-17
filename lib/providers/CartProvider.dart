import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

class CartProvider with ChangeNotifier {
  final _cartBox = Hive.box('cart_box');
  List<Map<String, dynamic>> _cart = [];
  List<Map<String, dynamic>> get cart => _cart;
  set cart(List<Map<String, dynamic>> newCard) {
    _cart = newCard;
    notifyListeners();
  }

  getCart() {
    final cartData = _cartBox.keys.map((key) {
      final item = _cartBox.get(key);
      return {
        "key": key,
        "id": item['id'],
        "category": item['category'],
        "name": item['name'],
        "imageUrl": item['imageUrl'],
        "price": item['price'],
        "qty": item['qty'],
        "counter": item['counter'] ?? 0, // Initialize the counter field
      };
    }).toList();

    _cart = cartData.reversed.toList();
  }

  Future<void> deleteCartItem(dynamic key) async {
    await _cartBox.delete(key);
    notifyListeners();
  }

  void incrementCounter(int index) {
    _cart[index]['counter']++;
    notifyListeners();
  }

  void decrementCounter(int index) {
    if (_cart[index]['counter'] >= 1) {
      _cart[index]['counter']--;
      notifyListeners();
    }
  }
}
