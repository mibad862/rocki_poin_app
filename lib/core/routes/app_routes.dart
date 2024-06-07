import 'package:flutter/material.dart';
import 'package:rocki_poin_app/views/achivements_screen/achivements_screen.dart';
import 'package:rocki_poin_app/views/home_screen.dart';
import 'package:rocki_poin_app/views/team_screen/team_screen.dart';
import 'package:rocki_poin_app/views/welcome_bonus/welcome_bonus_screen.dart';

import '../../../views/splash_screen.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      SplashScreen.routeName: (context) => const SplashScreen(),
      WelcomeBonusScreen.routeName: (context) => const WelcomeBonusScreen(),
      HomeScreen.routeName: (context) => const HomeScreen(),
      AchievementScreen.routeName: (context) => const AchievementScreen(),
      TeamScreen.routeName: (context) => const TeamScreen(),
    };
  }
}
