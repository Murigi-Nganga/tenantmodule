import 'package:flutter/material.dart';

const Map<String, Color> appColors = {
    'PrimaryColor': Color(0xFF2C9F67),
    'PrimaryColorDark': Color(0xFF006F3C),
    'PrimaryColorLight': Color(0xFF64D195),
    'ScaffoldBackgroundColor': Color(0xFFFAFAFA),
    'SecondaryColor': Color(0xFF006168),
    'SecondaryColorDark': Color(0xFF00373E),
    'SecondaryColorLight': Color(0xFF438F96),
    'AccentColor': Color(0xFFED2A36)
};

var appTheme = ThemeData(
    fontFamily: 'Quicksand',
    inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(),
    ),
    scaffoldBackgroundColor: appColors['ScaffoldBackgroundColor'],
    colorScheme: const ColorScheme.light().copyWith(
        primary: appColors['PrimaryColor'],
        secondary: appColors['SecondaryColor']),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    pageTransitionsTheme: const PageTransitionsTheme(
        builders: {TargetPlatform.android: CupertinoPageTransitionsBuilder()}),
    splashColor: Colors.greenAccent,
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
