import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rocki_poin_app/core/routes/app_routes.dart';

import 'core/theme/app_text_themes.dart';
import 'views/splash_screen.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MyApp(), // Wrap your app
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (context, child) => MaterialApp(
        initialRoute: SplashScreen.routeName,
        routes: AppRoutes.getRoutes(),
        theme: ThemeData(
          textTheme: AppTextTheme.textTheme,
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1B47C3)),
          useMaterial3: true,
        ),
      ),
    );
  }
}
