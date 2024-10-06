import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppRouting{
  AppRouting._private();

  static final AppRouting _instance = AppRouting._private();

  factory AppRouting() {
    return _instance;
  }
  static final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  /// Go to next route screen
  Future<dynamic> move(String routeName, {dynamic argument}) {
    return navigator!.pushNamed(routeName, arguments: argument);
  }

  /// Go to named route screen and delete all routes
  Future<dynamic> moveReplacement(String routeName, {dynamic argument}) {
    return navigator!.pushReplacementNamed(routeName, arguments: argument);
  }

  /// Go to next route screen and remove previous (latest) route
  Future<dynamic> moveAndPop(String routeName, {dynamic argument}) {
    return navigator!.popAndPushNamed(routeName, arguments: argument);
  }

  /// Go to named route screen and delete all route until "removeUntil"
  Future<dynamic> moveAndRemoveUntil(String routeName, String removeUntil, {dynamic argument}) {
    return navigator!.pushNamedAndRemoveUntil(routeName, ModalRoute.withName(removeUntil), arguments: argument);
  }

  /// Go to previous route screen or close pop dialog or overlays widget / delete current route
  void moveBack() {
    return navigator!.pop();
  }

  /// Show showSnackBar
  void showSnackBar({required GetSnackBar snackBar}) {
    Get.showSnackbar(snackBar);
  }

  /// Remove showSnackBar
  void removeSnackBar() {
    Get.closeCurrentSnackbar();
  }
}