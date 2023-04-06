//!~> defaultButton >===========================<

import 'dart:js';

import 'package:app/shared/styles/colors.dart';
import 'package:app/shared/styles/style.dart';
import 'package:flutter/material.dart';

Widget defaultButton(
        {required String text,
        required void Function()? onPressed,
        required BuildContext context,
        Color color = secondColor,
        Color textColor = containerColor}) =>
    SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: color,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
          onPressed: onPressed,
          child: Text(
            text,
            style: btnTextStyle(context,textColor),
          )),
    );

Widget defaultButton0({String text = '', final VoidCallback? onTap}) =>
    SizedBox(
      width: double.infinity,
      // height: 45,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: secondColor, //Colors.green.shade600,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(color: containerColor, fontSize: 16),
        ),
      ),
    );
