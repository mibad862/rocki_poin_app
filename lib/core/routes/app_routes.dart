import 'package:flutter/material.dart';
import 'package:rocki_poin_app/views/welcome_bonus_screen.dart';
import '../../../views/splash_screen.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      SplashScreen.routeName: (context) => const SplashScreen(),
      WelcomeBonusScreen.routeName: (context) => const WelcomeBonusScreen(),
    };
  }
}
