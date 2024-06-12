import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:rocki_poin_app/core/routes/app_routes.dart';
import 'package:rocki_poin_app/firebase_options.dart';

import 'core/theme/app_text_themes.dart';
import 'views/mining_dashboard/provider/tap_counter.dart';
import 'views/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TapCounter()),
      ],
      child: const MyApp(),
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
