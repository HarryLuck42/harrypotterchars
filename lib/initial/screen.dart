import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_products/core/lifecycle/lifecycle_manager.dart';
import 'package:my_products/core/lifecycle/route_observer.dart';
import 'package:my_products/initial/locale/localizations.dart';
import 'package:my_products/initial/app_controller.dart';
import 'package:my_products/layout/splash/splash_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../core/routing/routes_actions.dart';

class MyAppLayout extends StatefulWidget {
  const MyAppLayout({Key? key}) : super(key: key);

  @override
  State<MyAppLayout> createState() => _MyAppLayoutState();
}

class _MyAppLayoutState extends State<MyAppLayout> {
  final ref = Get.put(AppController());

  @override
  void initState() {
    ref.setInitialState();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Obx((){
      return LifecycleManager(
          child: GetMaterialApp(
            title: "Harry Potter Characters",
            theme: ref.themeData.value,
            navigatorObservers: [
              CustomRouteObserver(),
              CustomRouteObserver.routeObserver
            ],
            supportedLocales: const [
              Locale("en"),
              Locale("id")
            ],
            locale: Locale(ref.lang.value),
            localizationsDelegates: const [
              AppLocale.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate
            ],
            home: const SplashScreen(),
            onGenerateRoute: RoutesActions.allActions,
            debugShowCheckedModeBanner: false,
          )
      );
    });
  }
}
