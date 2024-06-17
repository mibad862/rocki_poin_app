import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:rocki_poin_app/core/constants/app_assets.dart';
import 'package:rocki_poin_app/core/constants/app_colors.dart';
import 'package:rocki_poin_app/services/firebase_services.dart';
import 'package:rocki_poin_app/views/main_screen.dart';
import 'package:rocki_poin_app/views/user_details/model/provider/user_provider.dart';
import 'package:rocki_poin_app/views/user_details/model/user_model.dart';
import 'package:rocki_poin_app/views/welcome_bonus/welcome_bonus_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telegram_web_app/telegram_web_app.dart';

import '../core/constants/app_strings.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const routeName = "/";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool? isDefinedVersion;
  String? telegramUsername;

  final TelegramWebApp telegram = TelegramWebApp.instance;
  final FirebaseService _firebaseService = FirebaseService();

  void check() async {
    await Future.delayed(const Duration(seconds: 2));
    isDefinedVersion = await telegram.isVersionAtLeast('Bot API 6.1');
    telegram.ready();

    String userId = telegram.initData.user?.id.toString() ?? 'Unknown ID';
    String username = telegram.initDataUnsafe?.user?.first_name ?? 'User name';
    String userImageUrl = telegram.initDataUnsafe!.user?.photo_url ??
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRRKgUUpHpc-JwcJiRLScAepL-T3oeaxR8T5A&s';

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userId', userId);

    Provider.of<UserProvider>(context, listen: false).setUser(
      UserModel(id: userId, firstName: username, imageUrl: userImageUrl),
    );

    // Fetch rocks data
    await Provider.of<UserProvider>(context, listen: false)
        .fetchRocksData(userId);

    // Check if user exists and navigate accordingly
    if (await _firebaseService.userExists(userId)) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MainScreen(),
          ));
    } else {
      // Create new user document with initial values
      await _firebaseService.createNewUser(userId, username, userImageUrl);
      Navigator.pushReplacementNamed(context, WelcomeBonusScreen.routeName);
    }
  }

  @override
  void initState() {
    super.initState();
    TelegramWebApp.instance.ready();
    check();
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
