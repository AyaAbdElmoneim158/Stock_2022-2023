import 'package:app/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle titleStyle(BuildContext context) => GoogleFonts.amiri(
    textStyle: Theme.of(context)
        .textTheme
        .headlineMedium
        !.copyWith(color:secondColor));
TextStyle bodyStyle(BuildContext context) => GoogleFonts.amiri(
    textStyle: Theme.of(context)
        .textTheme
        .headlineSmall
        !.copyWith(color:textColor));
