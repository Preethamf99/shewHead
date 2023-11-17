import 'package:flutter/material.dart';
import 'package:shewhead_shoes_app/model/ShoesModel.dart';
import 'package:shewhead_shoes_app/model/helper.dart';

class ProductsNotifier with ChangeNotifier {
  int _activepage = 0;

  int get activePage => _activepage;
  set activePage(int newIndex) {
    _activepage = newIndex;
  }

  List<dynamic> _shoeSizes = [];
  List<String> _sizes = [];
  List<dynamic> get shoeSizes => _shoeSizes;

  set shoesSizes(List<dynamic> newSizes) {
    _shoeSizes = newSizes;
    notifyListeners();
  }

  void toggleCheck(int index) {
    for (int i = 0; i < _shoeSizes.length; i++) {
      if (i == index) {
        _shoeSizes[i]['isSelected'] = !_shoeSizes[i]['isSelected'];
      }
    }
    notifyListeners();
  }

  List<String> get sizes => _sizes;

  set sizes(List<String> newSizes) {
    _sizes = newSizes;
    notifyListeners();
  }

  late Future<List<Shoes>> male;
  late Future<List<Shoes>> female;
  late Future<List<Shoes>> kids;
  late Future<Shoes> sneaker;
  getMale() {
    male = helper().getMaleSneakers();
  }

  void getfemale() {
    female = helper().getFemaleSneakers();
  }

  void getKids() {
    kids = helper().getKidsSneakers();
  }

  void getShoes(String category, id) {
    if (category == "Men's Running") {
      sneaker = helper().getMaleSneakersById(id);
    } else if (category == "Women's Running") {
      sneaker = helper().getFemaleSneakersById(id);
    } else {
      sneaker = helper().getKidsSneakersById(id);
    }
  }
}
