import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFF2C9F67);
const kPrimaryColorDark = Color(0xFF006F3C);
const kPrimaryColorLight = Color(0xFF64D195);
const kBodyColor = Color(0xFFFAFAFA);
const kSecondaryColor = Color(0xFF006168);
const kSecondaryColorDark = Color(0xFF00373E);
const kSecondaryColorLight = Color(0xFF438F96);
const kAccentColor = Color(0xFFED2A36);

var appTheme = ThemeData(
  fontFamily: 'Poppins',
  appBarTheme: const AppBarTheme(
    centerTitle: true,
    elevation: 0,
  ),
  primaryColor: kPrimaryColor,
  primaryColorLight: kPrimaryColorLight,
  primaryColorDark: kPrimaryColorDark,
  inputDecorationTheme: const InputDecorationTheme(
    contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    border: OutlineInputBorder(
      borderSide: BorderSide(
        width: 4.0,
      ),
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    filled: true,
    fillColor: Colors.white,
    errorStyle: TextStyle(
      color: kAccentColor,
    ),
  ),
  scaffoldBackgroundColor: kBodyColor,
  colorScheme: const ColorScheme.light().copyWith(
    primary: kPrimaryColor,
    secondary: kSecondaryColor,
  ),
  visualDensity: VisualDensity.adaptivePlatformDensity,
  pageTransitionsTheme: const PageTransitionsTheme(builders: {
    TargetPlatform.android: CupertinoPageTransitionsBuilder(),
    TargetPlatform.linux: CupertinoPageTransitionsBuilder(),
    TargetPlatform.windows: CupertinoPageTransitionsBuilder()
  }),
  splashColor: kSecondaryColorLight.withOpacity(.3),
  hoverColor: kSecondaryColorLight.withOpacity(.2),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      padding:
          MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 12)),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
    ),
  ),
);
