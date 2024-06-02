import 'package:flutter/material.dart';

class WelcomeBonusScreen extends StatelessWidget {
  const WelcomeBonusScreen({super.key});

  static const routeName = "/welcome-bonus";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome Bonus Screen"),
      ),
    );
  }
}
