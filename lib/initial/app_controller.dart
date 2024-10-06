import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_products/core/base/base_controller.dart';

import '../core/constraint/sp_keys.dart';
import '../core/memory/shared/share_preference.dart';
import '../core/themes/app_theme.dart';

class AppController extends BaseController{
  Rx<ThemeData?> themeData = appLightTheme().obs;

  void setThemeData(ThemeData? val) {
    themeData(val);
    sharedPre.writeStorage(SpKeys.isLightTheme, appLightTheme() == val);
  }


  void setInitialState() {
    bool themeState = sharedPre.readStorage(SpKeys.isLightTheme) ?? true;
    setThemeData(themeState ? appLightTheme() : appDarkTheme());
    setLang(sharedPre.readStorage(SpKeys.locale) ?? "en");
  }

  final lang = "en".obs;

  void setLang(String value) {
    lang(value);
    Get.updateLocale(Locale(value));
    sharedPre.writeStorage(SpKeys.locale, value);
  }
}