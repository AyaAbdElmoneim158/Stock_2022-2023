import 'package:app/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

//!~> Style Text................................................................

const kHeadline = TextStyle(
  color: secondColor,
  fontSize: 34,
  fontWeight: FontWeight.bold,
);

const kBodyText =
    TextStyle(color: kTextColor, fontSize: 15, fontWeight: FontWeight.w600);

const kButtonText = TextStyle(
  color: kTextColor,
  fontSize: 16,
  fontWeight: FontWeight.bold,
);

const kBodyText2 =
    TextStyle(fontSize: 22, fontWeight: FontWeight.w500, color: kTextColor);

TextStyle btnTextStyle(BuildContext context, Color textColor) =>
    GoogleFonts.amiri(
        textStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: textColor, fontWeight: FontWeight.w600, fontSize: 20));
TextStyle onboardingStyle(BuildContext context, Color textColor) =>
    GoogleFonts.amiri(
        textStyle: Theme.of(context)
            .textTheme
            .headlineLarge!
            .copyWith(color: textColor, fontWeight: FontWeight.w600));
TextStyle titleStyle(BuildContext context) => GoogleFonts.amiri(
    textStyle: Theme.of(context)
        .textTheme
        .headlineMedium!
        .copyWith(color: secondColor));
TextStyle bodyStyle(BuildContext context) => GoogleFonts.amiri(
    textStyle: Theme.of(context)
        .textTheme
        .bodySmall!
        .copyWith(color: firstColor, fontWeight: FontWeight.w600));
