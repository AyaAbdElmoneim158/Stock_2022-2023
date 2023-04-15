//!~> defaultButton >===========================<
import 'package:app/shared/styles/colors.dart';
import 'package:flutter/material.dart';

Widget defaultButton(
        {required String text,
        required void Function()? onPressed,
        required BuildContext context,
        Color color = secondColor,
        Color textColor = whiteColor}) =>
    SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: color,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
          onPressed: onPressed,
          child: Text(text, style: TextStyle(color: textColor, fontSize: 20)
              //  btnTextStyle(context, textColor),
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
          style: const TextStyle(color: whiteColor, fontSize: 16),
        ),
      ),
    );

//!~> defaultField >===========================<
Widget defaultField({
  final TextEditingController? controller,
  required void Function(String) onChanged,
  String? Function(String?)? validator,
  String? hintText = '',
  String? labelText = '',
  final TextInputType keyboardType = TextInputType.text,
}) =>
    TextFormField(
      onChanged: onChanged,
      controller: controller,
      validator: validator,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        labelText: labelText,
        floatingLabelStyle:
            const TextStyle(color: secondColor, fontWeight: FontWeight.w600),
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey, width: 1.5),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: secondColor, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.redAccent, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        // bord
        // border: OutlineInputBorder(
        //   borderSide: BorderSide(color: Colors.deepPurple.shade200, width: 2),
        //   borderRadius: BorderRadius.circular(10),
        // )
      ),
    );
Widget defaultField0({
  final TextEditingController? controller,
  required void Function(String) onChanged,
  String? Function(String?)? validator,
  String? hintText = '',
  String? labelText = '',
  final TextInputType keyboardType = TextInputType.text,
  // required Widget widget,
}) =>
    TextFormField(
      onChanged: onChanged,
      controller: controller,
      validator: validator,
      //(val) => val!.isEmpty ? "please enter your email" : null,
      //?  focusNode *** *** *** *** *** *** *** *** ***
      // focusNode: _emailFocusNode,
      // onEditingComplete: () => FocusScope.of(context)
      //     .requestFocus(_passwordFocusNode),
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
      ),
    );

Widget defaultField1({
  final TextEditingController? controller,
  required void Function(String) onChanged,
  String? Function(String?)? validator,
  final String hintText = '',
  final TextInputType keyboardType = TextInputType.text,
  // required Widget widget,
}) =>
    TextFormField(
      validator: validator,
      onChanged: onChanged,
      keyboardType: keyboardType,
      controller: controller,
      decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: const Icon(Icons.search),
          contentPadding: const EdgeInsets.all(15),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
      /* decoration: InputDecoration(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20.0),
    ),
    filled: true,
    
    // border: InputBorder.none,
    hintText: hintText,
      ),*/
    );
