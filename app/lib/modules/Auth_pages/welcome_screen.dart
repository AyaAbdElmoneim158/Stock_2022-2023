/*import 'package:app/shared/components/components.dart';
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
                              // image: AssetImage('assets/stock_logo.png')
                              image: NetworkImage(
                            'https://cdn-icons-png.flaticon.com/128/7738/7738099.png',
                            // 'https://cdn-icons-png.flaticon.com/128/4258/4258289.png',
                            // 'https://cdn-icons-png.flaticon.com/128/7738/7738973.png',
                          )),
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
}*/

import 'package:app/shared/components/components.dart';
import 'package:app/shared/components/constants.dart';
import 'package:app/shared/styles/colors.dart';
import 'package:app/shared/styles/size_config.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    CarouselController? carouselController = CarouselController();
    // final controller = PageController(viewportFraction: 0.8, keepPage: true);
    // int current = 0;

    return Scaffold(
      backgroundColor: AppColors.kBackgroundColor,
      body: Center(
        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.screenWidth! * Constants.padding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //! CarouselSlider .............................................
                  Column(
                    children: [
                      CarouselSlider.builder(
                        carouselController: carouselController,
                        options: carouselOptions(
                          height: 450,
                          onPageChanged: (index, reason) {
                            // setState(() {current = index;});
                          },
                        ),
                        itemCount: Constants.carouselData.length,
                        itemBuilder: (BuildContext context, int itemIndex,
                                int pageViewIndex) =>
                            carouselSildeWelcome(context, itemIndex),
                      ),
                      //ToDo:: SmoothPageIndicator................................
                      // SmoothPageIndicator(
                      //     controller: PageController(initialPage: _current),
                      //     count: Constants.carouselData.length,
                      //     effect: const JumpingDotEffect(
                      //         activeDotColor: AppColors.ksecondColor)),
                    ],
                  ),
                  //! WelcomeBtns ................................................
                  welcomeBtns(context)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
