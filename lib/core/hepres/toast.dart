import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast(String msg, Color backgroundColor) {
  Fluttertoast.showToast(
      msg: msg, backgroundColor: backgroundColor, textColor: Colors.white);
}
