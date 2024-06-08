import 'package:flutter/material.dart';
import 'package:rocki_poin_app/views/achivements_screen/achivements_screen.dart';
import 'package:rocki_poin_app/views/team_screen/team_screen.dart';
import '../widgets/custom_bottom_navigation_bar.dart';
import 'home/home_screen.dart';

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
    Container(
      color: Colors.green,
    ),
    const AchievementScreen(),
    Container(
      color: Colors.yellow,
    ),
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
