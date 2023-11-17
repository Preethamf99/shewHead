import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class utils {
  void tostmessage(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.deepPurple,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
