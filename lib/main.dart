import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:tenantmodule/screens/upload_photo_screen.dart';
import 'services/invoices_service.dart';
import 'services/payments_service.dart';
import 'services/feedback_service.dart';

import 'services/property_units_service.dart';
import 'routes/app_routes.dart';

import 'screens/onboarding/onboarding_home_screen.dart';
import 'constants/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => PropertyUnitsProvider()),
          ChangeNotifierProvider(create: (_) => InvoicesProvider()),
          ChangeNotifierProvider(create: (_) => FeedbackProvider()),
          ChangeNotifierProvider(create: (_) => PaymentsProvider())
        ],
        child: MaterialApp(
          title: 'Smart Real Estate',
          debugShowCheckedModeBanner: false,
          theme: appTheme,
          home: AnimatedSplashScreen(
            splash: const FlutterLogo(
              size: 60,
            ),
            splashTransition: SplashTransition.fadeTransition,
            pageTransitionType: PageTransitionType.fade,
            animationDuration: const Duration(seconds: 2),
            nextScreen: const UploadPhotoScreen(),
          ),
          routes: appRoutes,
        ),
      );
}

// class _MyAppState extends State<MyApp> {

//     @override
//     Widget build(BuildContext context) {
//         Future<User?> getUserData() => UserPreferences().getUser();

//         return MultiProvider(
//             providers: [
//                 ChangeNotifierProvider(create: (_) => AuthProvider()),
//                 ChangeNotifierProvider(create: (_) => UserProvider()),
//             ],
//             child: MaterialApp(
//                 title: 'Smart Real Estate',
//                 debugShowCheckedModeBanner: false,
//                 theme: appTheme,
//                 home: AnimatedSplashScreen(
//                     splash: const FlutterLogo(size: 60,),
//                     splashTransition: SplashTransition.fadeTransition,
//                     pageTransitionType: PageTransitionType.fade,
//                     animationDuration: const Duration(seconds: 2),
//                     nextScreen: FutureBuilder(
//                         future: getUserData(),
//                         builder: (context, snapshot) {
//                             switch (snapshot.connectionState) {
//                                 case ConnectionState.none:
//                                 case ConnectionState.waiting:
//                                     return const CircularProgressIndicator();
//                                 default:
//                                     if (snapshot.hasError)
//                                     {
//                                         return Text('Error: ${snapshot.error}');
//                                     }
//                                     else if (snapshot.data == null)
//                                     {
//                                         return const OnboardingHomeScreen();
//                                     }
//                                     else
//                                     {
//                                         //To make sure data persists on restarting
//                                         UserProvider().setUser(snapshot.data as User);
//                                         return const HomeScreen();
//                                     }
//                             }
//                         }
//                     ),
//                 ),
//                 routes: appRoutes
//             ),
//         );
//     }
// }
