import 'package:app/shared/components/components.dart';
import 'package:app/shared/router/routes.dart';
import 'package:app/shared/styles/colors.dart';
import 'package:app/shared/styles/size_config.dart';

import 'package:flutter/material.dart';

class SuccessfulLogin extends StatelessWidget {
  const SuccessfulLogin({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Column(
        children: [
          SizedBox(height: SizeConfig.screenHeight! * 0.04),
          /* Image.asset(
            "assets/success.png",
            height: SizeConfig.screenHeight! * 0.4, //40%
          ),*/
          Image.network(
            'https://img.freepik.com/free-vector/privacy-policy-concept-illustration_114360-7853.jpg',
            height: SizeConfig.screenHeight! * 0.4, //40%
            width: double.infinity,
          ),
          SizedBox(height: SizeConfig.screenHeight! * 0.08),
          const Text(
            "Login Success",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: kPrimaryColor,
            ),
          ),
          const Spacer(),
          SizedBox(
            width: SizeConfig.screenWidth! * 0.6,
            child: CustomeTextButton(
              bgColor: firstColor,
              buttonName: 'Back to home',
              onTap: () => Navigator.pushNamed(context, AppRoutes.navbarRoute),
              textColor: Colors.white,
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
