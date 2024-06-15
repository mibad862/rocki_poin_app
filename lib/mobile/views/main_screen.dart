import 'package:flutter/material.dart';
import '../widgets/custom_bottom_navigation_bar.dart';
import 'achivements_screen/achivements_screen.dart';
import 'home/home_screen.dart';
import 'mining_dashboard/mining_dashboard.dart';
import 'profile_screen/profile_screen.dart';
import 'team_screen/team_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;

  List<Widget> screens = [
    const HomeScreen(),
    const TeamScreen(),
    const MiningDashboard(),
    const AchievementScreen(),
    const ProfileScreen()
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: CommonBottomNavBar(
          selectedIndex: selectedIndex,
          onItemTapped: onItemTapped,
        ),
        body: screens[selectedIndex],
      ),
    );
  }
}
