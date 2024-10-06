import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_products/core/routing/routes.dart';
import 'package:my_products/layout/character_detail/character_detail_screen.dart';
import 'package:my_products/layout/characters/characters_screen.dart';
import 'package:my_products/layout/settings/settings_screen.dart';
import 'package:my_products/layout/splash/splash_screen.dart';
import 'package:my_products/model/local/character_data.dart';

class RoutesActions{

  static Route<dynamic> allActions(RouteSettings settings){
    switch(settings.name){
      case Routes.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.characters:
        return MaterialPageRoute(builder: (_) => const CharactersScreen());
      case Routes.characterDetail:
        return MaterialPageRoute(builder: (_) => CharacterDetailScreen(character: settings.arguments as CharacterData));
      case Routes.settings:
        return MaterialPageRoute(builder: (_) => const SettingsScreen());
    }
    return MaterialPageRoute(builder: (_) => const SplashScreen());
  }
}

