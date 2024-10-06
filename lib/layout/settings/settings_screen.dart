import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_products/core/constraint/spacer.dart';
import 'package:my_products/core/extention/extention.dart';
import 'package:my_products/initial/locale/localizations.dart';
import 'package:my_products/initial/app_controller.dart';
import 'package:my_products/widgets/custom_app_bar.dart';
import 'package:my_products/widgets/custom_gesture.dart';
import 'package:my_products/widgets/custom_text.dart';

import '../../core/themes/app_theme.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ref = Get.put(AppController());
    return Scaffold(
      appBar: CustomAppBar(context, lang(context).settings ?? "Settings"),
      body: SafeArea(
        child: Obx(() {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  child: Row(
                    children: [
                      Expanded(
                        child: CustomText(
                          textToDisplay: !(ref.themeData.value == appLightTheme())
                              ? (lang(context).dark ?? "Dark")
                              : (lang(context).light ?? "Light"),
                          textStyle: context.getTextTheme().titleSmall,
                          textAlign: TextAlign.start,
                        ),
                      ),
                      fourPx,
                      Switch(
                          value: ref.themeData.value == appLightTheme(),
                          onChanged: (state) {
                            if (state) {
                              ref.setThemeData(appLightTheme());
                            } else {
                              ref.setThemeData(appDarkTheme());
                            }
                          })
                    ],
                  ),
                ),
                Container(
                  height: 1,
                  width: double.infinity,
                  color: context.getColorScheme().onSecondary,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  child: Row(
                    children: [
                      Expanded(
                        child: CustomText(
                          textToDisplay: (lang(context).language ?? "Language"),
                          textStyle: context.getTextTheme().titleSmall,
                          textAlign: TextAlign.start,
                        ),
                      ),
                      fourPx,
                      _languageSelection(
                          context, "Bahasa Indonesia", ref.lang.value == "id", () {
                        ref.setLang("id");
                      }),
                      eightPx,
                      _languageSelection(context, "English", ref.lang.value == "en", () {
                        ref.setLang("en");
                      }),
                    ],
                  ),
                ),
                Container(
                  height: 1,
                  width: double.infinity,
                  color: context.getColorScheme().onSecondary,
                ),
              ],
            );
          }
        ),
      ),
    );
  }

  Widget _languageSelection(
      BuildContext context, String text, bool isSelected, Function() onTap) {
    return CustomGesture(
      onTap: onTap,
      height: 30,
      radius: 15,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            color: isSelected
                ? context.getColorScheme().onPrimaryFixed
                : context.getColorScheme().primaryFixed,
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.15),
                blurRadius: 2.6,
                spreadRadius: 0,
                offset: Offset(
                  1.95,
                  1.95,
                ),
              ),
            ]),
        child: CustomText(
          textToDisplay: text,
          textStyle: context.getTextTheme().bodySmall?.copyWith(
              color: isSelected
                  ? context.getColorScheme().primaryFixed
                  : context.getColorScheme().onPrimaryFixed),
        ),
      ),
    );
  }
}
