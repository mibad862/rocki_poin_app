import 'package:flutter/material.dart';
import '../widgets/custom_bottom_navigation_bar.dart';
import 'home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;

  List<Widget> screens = [
    const HomeScreen(),
    Container(
      color: Colors.red,
    ),
    Container(
      color: Colors.green,
    ),
    Container(
      color: Colors.blue,
    ),
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
