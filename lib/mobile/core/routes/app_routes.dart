import 'package:flutter/material.dart';
import '../../views/achivements_screen/achivements_screen.dart';
import '../../views/home/home_screen.dart';
import '../../views/mining_dashboard/mining_dashboard.dart';
import '../../views/profile_screen/profile_screen.dart';
import '../../views/splash_screen.dart';
import '../../views/team_screen/team_screen.dart';
import '../../views/user_details/user_detail_screen.dart';
import '../../views/welcome_bonus/welcome_bonus_screen.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      SplashScreen.routeName: (context) => const SplashScreen(),
      WelcomeBonusScreen.routeName: (context) => const WelcomeBonusScreen(),
      HomeScreen.routeName: (context) => const HomeScreen(),
      AchievementScreen.routeName: (context) => const AchievementScreen(),
      TeamScreen.routeName: (context) => const TeamScreen(),
      ProfileScreen.routeName: (context) => const ProfileScreen(),
      MiningDashboard.routeName: (context) => const MiningDashboard(),
      UserDetailsScreen.routeName: (context) => const UserDetailsScreen(),
    };
  }
}
