import 'package:app/shared/components/components.dart';
import 'package:app/shared/components/constants.dart';
import 'package:app/shared/router/routes.dart';
import 'package:app/shared/styles/colors.dart';
import 'package:concentric_transition/page_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';

//O nboardingScreen---
class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  /*
  https://cdn3d.iconscout.com/3d/premium/thumb/stock-market-analysis-report-6456749-5348957.png
  https://cdn3d.iconscout.com/3d/premium/thumb/stock-with-a-pile-of-coins-4609540-3811546.png
  https://cdn3d.iconscout.com/3d/premium/thumb/profit-3597243-3010223.png
   */
  List<dynamic> pages = [
    {
      'image':
          // 'https://cdn3d.iconscout.com/3d/premium/thumb/stock-market-profit-8268826-6594786.png',
          'https://cdn3d.iconscout.com/3d/premium/thumb/stock-research-7252794-5914997.png', //'https://ouch-cdn2.icons8.com/yIxQmzj1OHH3S9AiIgelaTGdpj3wApWqSqFh80arSEA/rs:fit:784:828/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9wbmcvMTMx/L2NmOGIzZmY4LWRh/YjEtNDdiMS1hZGQ4/LWFkMTUwZTQwNzIx/NC5wbmc.png',
      'text': Constants.onboardingText1,
      'textColor': textColor,
      'btnColor': secondColor,
    },
    {
      'image':
          // 'https://cdn3d.iconscout.com/3d/premium/thumb/stock-market-growth-8268827-6594787.png',
          'https://cdn3d.iconscout.com/3d/premium/thumb/stock-exchange-6020107-4974984.png', //'https://ouch-cdn2.icons8.com/oEXWmNUZgj3vd_T5XSJe2dTB1GFWIBeJ1QEqRWw76O8/rs:fit:784:748/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9wbmcvMzM1/L2Q3MjMyYzJlLTk0/NTMtNDUzMC1iZTEx/LWQ2MDZiN2RjYmFm/Yy5wbmc.png',
      'text': Constants.onboardingText2,
      'textColor': whiteColor,
      'btnColor': whiteColor //,
    },
    {
      'image':
          // 'https://cdn3d.iconscout.com/3d/premium/thumb/trade-graph-6780336-5580788.png',
          'https://cdn3d.iconscout.com/3d/premium/thumb/stock-market-investment-5768786-4833583.png', //'https://ouch-cdn2.icons8.com/g8bZd-d4qiYuomOBWh3x61II6HlK8Ir2zp_a2cFTcCA/rs:fit:784:784/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9wbmcvNDI4/LzdjMjEyYjgzLTg0/NjQtNDQzMS04NzAz/LTNkNzk1YmUyMzli/MC5wbmc.png',
      'text': Constants.onboardingText3,
      'textColor': whiteColor,
      'btnColor': firstColor,
    }
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: whiteColor,
        body: ConcentricPageView(
          radius: 30,
          verticalPosition: 0.85,
          colors: const [Colors.white, firstColor, secondColor],
          itemBuilder: (index) {
            int pageIndex = (index % pages.length);
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FadeInUp(
                    duration: const Duration(milliseconds: 800),
                    child:
                        Image.network(pages[pageIndex]['image'], width: 300)),
                Padding(
                  padding: EdgeInsets.all(size.height * 0.03),
                  child: Column(children: [
                    FadeInUp(
                      duration: const Duration(milliseconds: 900),
                      child: Text(
                        pages[pageIndex]['text'],
                        textAlign: TextAlign.center,
                        style: GoogleFonts.amiri(
                            color: pages[pageIndex]['textColor'],
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    SizedBox(height: size.height * 0.03),
                    FadeInUp(
                        duration: const Duration(milliseconds: 1000),
                        child: defaultButton(
                            textColor: index % 3 == 0
                                ? Colors.white
                                : index % 3 == 1
                                    ? firstColor
                                    : pages[pageIndex]['textColor'],
                            text: "Get Started",
                            color: pages[pageIndex]['btnColor'],
                            context: context,
                            onPressed: () => Navigator.popAndPushNamed(
                                context, AppRoutes.loginRoute)))
                  ]),
                ),
              ],
            );
          },
        ));
  }
}
