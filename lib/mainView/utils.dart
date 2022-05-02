import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

DateTime? backbuttonpressedTime;

Future<bool> onWillPop() async {
  DateTime currentTime = DateTime.now();

  //Statement 1 Or statement2
  bool backButton = backbuttonpressedTime == null ||
      currentTime.difference(backbuttonpressedTime!) > Duration(seconds: 3);

  if (backButton) {
    backbuttonpressedTime = currentTime;
    Fluttertoast.showToast(
        msg: "뒤로가기를 한 번 더 누르면 앱이 종료됩니다.",
        backgroundColor: Colors.black,
        textColor: Colors.white);
    return false;
  }
  SystemNavigator.pop();
  return true;
}