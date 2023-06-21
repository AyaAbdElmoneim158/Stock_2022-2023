import 'package:app/shared/components/constants.dart';
import 'package:app/shared/styles/colors.dart';
import 'package:app/shared/styles/style.dart';
import 'package:flutter/material.dart';
import 'package:app/shared/styles/size_config.dart';
import 'package:skeletons/skeletons.dart';

class NoInternetPage extends StatelessWidget {
  const NoInternetPage({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Image.asset(
            'assets/no1.png',
            height: SizeConfig.screenHeight! * 0.3, //30%
            width: double.infinity,
          )),
          Text(
            Constants.noInternet,
            style:
                AppTextStyles.kBodyText2.copyWith(color: AppColors.kTextColor),
          ),
        ],
      )),
    );
  }
}
