import 'package:flutter/services.dart' as the_bundle;
import 'package:shewhead_shoes_app/model/ShoesModel.dart';

class helper {
  Future<List<Shoes>> getMaleSneakers() async {
    final data =
        await the_bundle.rootBundle.loadString("assets/json/men_shoes.json");

    final malelist = ShoesFromJson(data);

    return malelist;
  }

// Female
  Future<List<Shoes>> getFemaleSneakers() async {
    final data =
        await the_bundle.rootBundle.loadString("assets/json/women_shoes.json");

    final femaleList = ShoesFromJson(data);

    return femaleList;
  }

// Kids
  Future<List<Shoes>> getKidsSneakers() async {
    final data =
        await the_bundle.rootBundle.loadString("assets/json/kids_shoes.json");

    final kidsList = ShoesFromJson(data);

    return kidsList;
  }

  Future<Shoes> getMaleSneakersById(String id) async {
    final data =
        await the_bundle.rootBundle.loadString("assets/json/men_shoes.json");

    final maleList = ShoesFromJson(data);

    final sneaker = maleList.firstWhere((sneaker) => sneaker.id == id);

    return sneaker;
  }

  // Single Male
  Future<Shoes> getFemaleSneakersById(String id) async {
    final data =
        await the_bundle.rootBundle.loadString("assets/json/women_shoes.json");

    final maleList = ShoesFromJson(data);

    final sneaker = maleList.firstWhere((sneaker) => sneaker.id == id);

    return sneaker;
  }

  // Single Kids
  Future<Shoes> getKidsSneakersById(String id) async {
    final data =
        await the_bundle.rootBundle.loadString("assets/json/kids_shoes.json");

    final maleList = ShoesFromJson(data);

    final sneaker = maleList.firstWhere((sneaker) => sneaker.id == id);

    return sneaker;
  }
}
