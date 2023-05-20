import 'package:app/shared/components/components.dart';
import 'package:app/shared/router/routes.dart';
import 'package:app/shared/styles/size_config.dart';

import 'package:flutter/material.dart';

class SuccessfulLogin extends StatelessWidget {
  const SuccessfulLogin({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: SizeConfig.screenHeight! * 0.04),
          Image.asset(
            "assets/success.png",
            height: SizeConfig.screenHeight! * 0.4, //40%
          ),
          SizedBox(height: SizeConfig.screenHeight! * 0.08),
          const Text(
            "Login Success",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const Spacer(),
          SizedBox(
            width: SizeConfig.screenWidth! * 0.6,
            child: defaultButton(
              context: context,
              text: "Back to home",
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.navbarRoute);
              },
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
