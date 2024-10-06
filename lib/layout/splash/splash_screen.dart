import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_products/core/constraint/asset_path.dart';
import 'package:my_products/core/extention/extention.dart';
import 'package:my_products/layout/splash/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: Image.asset("${AssetPath.image}harry_potter.webp",
                  width: context.getWidth() * 0.5),
            ),
          ),
          Positioned(
            bottom: -150,
            right: -20,
            child: Image.asset("${AssetPath.image}hagrid.webp",
                height: context.getHeight() * 0.68),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset("${AssetPath.image}friends.webp",
                height: context.getHeight() * 0.35),
          ),
          Positioned(
            top: 100,
            left: 0,
            right: 0,
            child: Image.asset("${AssetPath.image}owl_2.webp",
                height: context.getHeight() * 0.35),
          ),
        ],
      ),
    );
  }
}
