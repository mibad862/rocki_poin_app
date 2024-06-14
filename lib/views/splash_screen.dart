import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rocki_poin_app/core/constants/app_assets.dart';
import 'package:rocki_poin_app/core/constants/app_colors.dart';
import 'package:rocki_poin_app/views/user_details/user_detail_screen.dart';
import 'package:rocki_poin_app/views/welcome_bonus/welcome_bonus_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/constants/app_strings.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const routeName = "/";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkUserEmailExistence();
  }

  void _checkUserEmailExistence() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userEmail = prefs.getString('user_email');

    // Check if user_email exists
    if (userEmail != null && userEmail.isNotEmpty) {
      // If exists, navigate to the Welcome Bonus Screen
      Navigator.pushReplacementNamed(context, WelcomeBonusScreen.routeName);
    } else {
      // If doesn't exist, navigate to the User Details Screen
      Navigator.pushReplacementNamed(context, UserDetailsScreen.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blue1,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              AppAssets.splImgOne,
              height: 150.h,
              width: 150.w,
            ),
            SizedBox(height: 40.h),
            Text(
              AppStrings.appNameOne,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontSize: 20.sp, fontWeight: FontWeight.w900),
            ),
            Text(
              AppStrings.appNameTwo,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontSize: 18.sp),
            ),
          ],
        ),
      ),
    );
  }
}
