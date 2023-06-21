import 'package:app/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//ToDo: AppColors-class.........................................................
class AppTextStyles {
  ///~> kHeadline---------------------------------------------------------------
  static TextStyle kHeadline = TextStyle(
    color: AppColors.secondColor,
    fontSize: 34,
    fontWeight: FontWeight.bold,
  );

  ///~> kBodyText---------------------------------------------------------------
  static TextStyle kBodyText = TextStyle(
    color: AppColors.kTextColor,
    fontSize: 15,
    fontWeight: FontWeight.w600,
  );

  ///~> kBodyColorText----------------------------------------------------------
  static TextStyle kBodyColorText = TextStyle(
    color: AppColors.kPrimaryColor,
    fontSize: 17,
    fontWeight: FontWeight.w600,
  );

  ///~> kButtonText-------------------------------------------------------------
  static TextStyle kButtonText = TextStyle(
    color: AppColors.kTextColor,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  ///~> kBodyText2--------------------------------------------------------------
  static TextStyle kBodyText2 = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    color: AppColors.firstColor,
  );

  ///~> btnTextStyle------------------------------------------------------------
  static TextStyle btnTextStyle(BuildContext context, Color textColor) =>
      GoogleFonts.amiri(
          textStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: textColor,
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ));

  ///~> onboardingStyle---------------------------------------------------------
  static TextStyle onboardingStyle(BuildContext context, Color textColor) =>
      GoogleFonts.amiri(
          textStyle: Theme.of(context).textTheme.headlineLarge!.copyWith(
                color: textColor,
                fontWeight: FontWeight.w600,
              ));

  ///~> titleStyle--------------------------------------------------------------
  static TextStyle titleStyle(BuildContext context) => GoogleFonts.amiri(
        textStyle: Theme.of(context)
            .textTheme
            .headlineMedium!
            .copyWith(color: AppColors.secondColor),
      );

  ///~> bodyStyle---------------------------------------------------------------
  static TextStyle bodyStyle(BuildContext context) => GoogleFonts.amiri(
      textStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
            color: AppColors.firstColor,
            fontWeight: FontWeight.w600,
          ));
}
