import 'package:app/layout/bottom_navbar.dart';
import 'package:app/models/sector_model.dart';
import 'package:app/modules/details_page.dart';
import 'package:app/modules/forgetpasssword/with_email.dart';
import 'package:app/modules/landing_page.dart';
import 'package:app/modules/more_charts.dart';
import 'package:app/modules/news_url.dart';
import 'package:app/modules/stocks_inner_sector.dart';

import 'package:app/modules/login_page.dart';
// import 'package:app/modules/onboarding_page.dart';
import 'package:app/modules/register_page.dart';
import 'package:app/shared/router/routes.dart';
import 'package:flutter/cupertino.dart';

Route<dynamic> onGenerate(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.moreChatsRoute:
      // final url = settings.arguments as String;

      return CupertinoPageRoute(
          builder: (_) => const DashBoardScreen(), settings: settings);
    case AppRoutes.newsUrlRoute:
      final url = settings.arguments as String;

      return CupertinoPageRoute(
          builder: (_) => NewsUrl(url: url), settings: settings);
    case AppRoutes.stocksSectorRoute:
      // final args = settings.arguments as Map<String, dynamic>;
      // final sector = args["sector"] as SectorModle;
      // final index = args["index"] as int;
      final args = settings.arguments as String;

      return CupertinoPageRoute(
          builder: (_) => StocksInnerSectot(sectorName: args),
          settings: settings);

    case AppRoutes.detailsStockRoute:
      final ramz = settings.arguments as String;
      return CupertinoPageRoute(
          builder: (_) => DetailsStock(ramz: ramz), settings: settings);
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
