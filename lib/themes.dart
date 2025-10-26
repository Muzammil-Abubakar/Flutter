import 'package:flutter/material.dart';

class AppColor{
  static const Color primaryColor = Color.fromRGBO(162, 29, 19, 1); // Deep tavern red (main brand)
  static const Color primaryAccent = Color.fromRGBO(120,14,14, 1); // Warm ale amber
  static const Color secondaryColor = Color.fromRGBO(65,65,65,1); // Dark wood brown
  static const Color secondaryAccent = Color.fromRGBO(35,35,35,1); // Aged leather tone
  static const Color titleColor = Color.fromRGBO(200, 200, 200, 1); // Parchment white
  static const Color textColor = Color.fromRGBO(150,150,150,1); // Aged parchment beige
  static const Color successColor = Color.fromRGBO(89, 125, 60, 1); // Herbal green
  static const Color highlightColor = Color.fromRGBO(212, 172, 13, 1); // Candlelight gold
}

ThemeData primaryTheme = ThemeData(

  //Seed Color
  colorScheme: ColorScheme.fromSeed(seedColor: AppColor.primaryColor),

  //Scaffold Theme
  scaffoldBackgroundColor: AppColor.secondaryAccent,

  //AppBar Theme
  appBarTheme: AppBarTheme(
    backgroundColor: AppColor.secondaryColor,
    foregroundColor: AppColor.textColor,
    centerTitle: true,
    surfaceTintColor: Colors.transparent,
  ),

  textTheme: TextTheme(
    bodyMedium: TextStyle(
      color: AppColor.textColor,
      fontSize: 16,
      letterSpacing: 1,
    ),
    headlineMedium: TextStyle(
      color: AppColor.titleColor,
      fontSize: 18,
      fontWeight: FontWeight.bold,
      letterSpacing: 1,
    ),
    titleMedium: TextStyle(
      color: AppColor.titleColor,
      fontSize: 16,
      fontWeight: FontWeight.bold,
      letterSpacing: 1,
    ),

  ),
);