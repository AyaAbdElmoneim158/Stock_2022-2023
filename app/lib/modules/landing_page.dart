import 'package:app/layout/bottom_navbar.dart';
// import 'package:app/modules/login_page.dart';
import 'package:app/modules/onboarding_page.dart';
import 'package:app/shared/network/remote/auth_helper.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = AuthHelper.instance;

    return StreamBuilder(
        //<User?>
        stream: auth.authStateChanes(),
        builder: (context, snapshot) {
          // if (snapshot.connectionState == ConnectionState.waiting) {
          //   return const CircularProgressIndicator();
          // } else
          if (snapshot.connectionState == ConnectionState.active) {
            //? get data

            final user = snapshot.data;
            if (user == null) {
              return const OnboardingPage(); //!~> onboardeing
            } else {
              return const BottomNavBar();
            }
          } else {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}
