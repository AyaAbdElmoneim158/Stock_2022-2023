import 'package:app/shared/components/components.dart';
import 'package:app/shared/components/constants.dart';
import 'package:app/shared/router/routes.dart';
import 'package:app/shared/styles/colors.dart';
import 'package:app/shared/styles/style.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Center(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: ZoomIn(
                          duration: const Duration(milliseconds: 1000),
                          child: const Image(
                              image: AssetImage('assets/stock_logo.png')
                              // NetworkImage('https://cdni.iconscout.com/illustration/premium/thumb/stock-market-38-985590.png')
                              ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    ZoomIn(
                      duration: const Duration(milliseconds: 1500),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Text(
                          Constants.onboardingText1,
                          style: kBodyText2,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  ],
                ),
                ZoomIn(
                  duration: const Duration(milliseconds: 2000),
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: firstColor, //Colors.grey[850],
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: CustomeTextButton(
                            bgColor: Colors.white,
                            buttonName: 'Register',
                            onTap: () {
                              navigatorTo(
                                  context: context,
                                  routeName: AppRoutes.registerRoute);
                            },
                            textColor: Colors.black87,
                          ),
                        ),
                        Expanded(
                          child: CustomeTextButton(
                            bgColor: firstColor,
                            buttonName: 'Sign In',
                            onTap: () {
                              navigatorTo(
                                  context: context,
                                  routeName: AppRoutes.loginRoute);
                            },
                            textColor: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    /*Row(
                      children: [
                        Expanded(
                          child: defaultButton(
                            context: context,
                            color: Colors.white,
                            text: 'Register',
                            onPressed: () {
                              navigatorTo(
                                  context: context,
                                  routeName: AppRoutes.registerRoute);
                            },
                            textColor: Colors.black87,
                          ),
                        ),
                        Expanded(
                          child: defaultButton(
                            context: context,
                            color: Colors.transparent,
                            text: 'Sign In',
                            onPressed: () {
                              navigatorTo(
                                  context: context,
                                  routeName: AppRoutes.loginRoute);
                            },
                            textColor: Colors.white,
                          ),
                        ),
                      ],
                    ),*/
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
