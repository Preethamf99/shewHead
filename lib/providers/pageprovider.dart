import 'package:flutter/material.dart';

class OnBoardNotifier extends ChangeNotifier {
  bool isLastPage = false;

  bool get lastPage => isLastPage;

  set lastPage(bool newstate) {
    isLastPage = newstate;
    notifyListeners();
  }
}
