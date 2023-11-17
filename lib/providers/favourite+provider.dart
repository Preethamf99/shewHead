// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';

// class FavouritesNotifier extends ChangeNotifier {
//   final _favBox = Hive.box('fav_box');
//   List<dynamic> _ids = [];
//   List<dynamic> _favorites = [];
//   List<dynamic> _fav = [];

//   List<dynamic> get ids => _ids;

//   set ids(List<dynamic> newIds) {
//     _ids = newIds;
//     notifyListeners();
//   }

//   List<dynamic> get favorites => _favorites;

//   set favorites(List<dynamic> newFav) {
//     favorites = newFav;
//     notifyListeners();
//   }

//   List<dynamic> get fav => _fav;

//   set fav(List<dynamic> newFav) {
//     _fav = newFav;
//     notifyListeners();
//   }

//   void getFavourites() {
//     final _favData = _favBox.keys.map((key) {
//       final item = _favBox.get(key);
//       return {
//         'key': key,
//         'id': item['id'], // Use actual id from the stored item
//       };
//     }).toList();
//     _favorites = _favData.toList(); // Update _favorites instead of favor
//     _ids = _favorites.map((item) => item['id']).toList();
//     notifyListeners(); // Notify listeners after updating the state
//   }

//   getallDate() {
//     final favData = _favBox.keys.map((key) {
//       final item = _favBox.get(key);
//       return {
//         'key': key,
//         'id': item['id'],
//         'category': item['category'],
//         'name': item['name'],
//         'price': item['price'],
//         'imageUrl': item['imageUrl']
//       };
//     }).toList();
//     _fav = favData.reversed.toList();
//   }

//   Future deleteFav(int key) async {
//     await _favBox.delete(key);
//   }

//   Future<void> createFav(Map<String, dynamic> addFav) async {
//     await _favBox.add(addFav);
//   }
// }
