import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';

import 'routes/app_routes.dart';
// import 'screens/log_in_screen.dart';
import 'screens/onboarding/onborading_home_screen.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Real Estate',
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: AnimatedSplashScreen(
            duration: 3000,
            splash: const FlutterLogo(size: 60,),
            nextScreen: const OnboardingHomeScreen(),
            splashTransition: SplashTransition.slideTransition,
      ),
      routes: appRoutes
    );
  }
}