import 'package:app/layout/bottom_navbar.dart';
import 'package:app/modules/forgetpasssword/with_email.dart';
import 'package:app/modules/landing_page.dart';
import 'package:app/modules/login_page.dart';
// import 'package:app/modules/onboarding_page.dart';
import 'package:app/modules/register_page.dart';
import 'package:app/shared/router/routes.dart';
import 'package:flutter/cupertino.dart';

Route<dynamic> onGenerate(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.navbarRoute:
      return CupertinoPageRoute(
          builder: (_) => const BottomNavBar(), settings: settings);
    case AppRoutes.resetPasswordRoute:
      return CupertinoPageRoute(
          builder: (_) => const ForgetPasswordWithEmail(), settings: settings);
    case AppRoutes.loginRoute:
      return CupertinoPageRoute(
          builder: (_) => LoginPage(), settings: settings);
    case AppRoutes.registerRoute:
      return CupertinoPageRoute(
          builder: (_) => RegisterPage(), settings: settings);
    case AppRoutes.landingRoute:
    default:
      return CupertinoPageRoute(
          builder: (_) => const LandingPage(), settings: settings);
  }
}
