import 'package:app/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//ToDo: lightTheme ============================================================<
ThemeData lightTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      color: Colors.transparent,
      elevation: 0,
      // brightness: Brightness.light,
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: whiteColor,
    /*  inputDecorationTheme: InputDecorationTheme(
      border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      // labelStyle: Theme.of(context).textTheme.subtitle1,
      labelStyle: const TextStyle(color: textColor),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: secondColor)),
      disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: secondColor)),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: secondColor)),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: Colors.red)),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: firstColor)),
    ),
*/
//!~> bodyText >================================================<
    textTheme: GoogleFonts.dmSansTextTheme().apply(displayColor: firstColor),
    // textTheme: const  TextTheme(
    //   titleSmall: TextStyle(fontWeight: FontWeight.w600, fontSize: 20, color:secondColor ),//Color(0xff11414b)Color(0xff44686f)
    //     bodySmall: TextStyle(fontWeight: FontWeight.w500, fontSize: 15, color:textColor ),
    //     headlineSmall: TextStyle(fontWeight: FontWeight.w500, fontSize: 40, color: Colors.black),

    //         ),
    dividerColor: firstColor,
    // scaffoldBackgroundColor: Colors.white,
//!~> AppBarTheme >================================================<
    // appBarTheme: const AppBarTheme(
    //     iconTheme: IconThemeData(color: secondColor),
    //     backgroundColor: Colors.white,
    //     elevation: 0,
    //     actionsIconTheme: IconThemeData(color: secondColor),
    //     titleTextStyle: TextStyle(
    //         color: secondColor, fontSize: 20, fontWeight: FontWeight.bold)
    //     // color: Colors.black
    //     ),
//!~> FloatingActionButtonThemeData >================================================<
    floatingActionButtonTheme:
        const FloatingActionButtonThemeData(backgroundColor: secondColor));

//ToDo: darkTheme ============================================================<
ThemeData darkTheme = ThemeData(
    textTheme: const TextTheme(
        bodyMedium: TextStyle(
            fontWeight: FontWeight.w600, fontSize: 18, color: Colors.white)),
    dividerColor: Colors.white,
    scaffoldBackgroundColor: secondColor,
    appBarTheme: const AppBarTheme(
        backgroundColor: secondColor,
        elevation: 0,
        actionsIconTheme: IconThemeData(color: secondColor),
        titleTextStyle: TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)
        // color: Colors.black
        ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.deepOrangeAccent));
