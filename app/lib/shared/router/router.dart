import 'package:app/layout/bottom_navbar.dart';
import 'package:app/layout/bottom_navbar_new.dart';
import 'package:app/models/sector_model.dart';
import 'package:app/modules/Auth_pages/successful_page.dart';
import 'package:app/modules/Navbar_pages/details_new_page.dart';
import 'package:app/modules/Navbar_pages/new_dash.dart';
import 'package:app/modules/Navbar_pages/stocks_inner_sector_new.dart';
import 'package:app/modules/Navbar_pages/old_dash.dart';
import 'package:app/modules/Auth_pages/forgetpasssword/with_email.dart';
import 'package:app/modules/landing_page.dart';
// import 'package:app/modules/more_charts.dart';
import 'package:app/modules/news_url.dart';
// import 'package:app/modules/stocks_inner_sector.dart';

import 'package:app/modules/Auth_pages/login_page.dart';
// import 'package:app/modules/onboarding_page.dart';
import 'package:app/modules/Auth_pages/register_page.dart';
import 'package:app/modules/no_internet_page.dart';
import 'package:app/shared/router/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

Route<dynamic> onGenerate(RouteSettings settings) {
  switch (settings.name) {
    // case AppRoutes.moreChatsRoute:
    //   // final url = settings.arguments as String;

    //   return CupertinoPageRoute(
    //       builder: (_) => const DashBoardScreen(), settings: settings);
    case AppRoutes.newsUrlRoute:
      final url = settings.arguments as String;

      return CupertinoPageRoute(
          builder: (_) => StreamBuilder<ConnectivityResult>(
              stream: Connectivity().onConnectivityChanged,
              builder: (context, snapshot) {
                return snapshot.data == ConnectivityResult.none
                    ? const NoInternetPage()
                    : NewsUrl(url: url);
              }),
          settings: settings);
    case AppRoutes.stocksAtSectorRoute:
      final args = settings.arguments as Map<String, dynamic>;
      // final sector = args["sector"] as SectorModle;
      // final index = args["index"] as int;
      // final args = settings.arguments as String;

      return CupertinoPageRoute(
          builder: (_) => StreamBuilder<ConnectivityResult>(
              stream: Connectivity().onConnectivityChanged,
              builder: (context, snapshot) {
                return snapshot.data == ConnectivityResult.none
                    ? const NoInternetPage()
                    : StockAtSectorNew(
                        sectorNameAr: args["titleAr"],
                        sectorNameEn: args["titleEn"],
                        svgSrc: args["image"]);
              }), //
          // StocksInnerSectot(sectorName: args),
          settings: settings);

    case AppRoutes.detailsStockRoute:
      final ramz = settings.arguments as String;
      return CupertinoPageRoute(
          builder: (_) => StreamBuilder<ConnectivityResult>(
              stream: Connectivity().onConnectivityChanged,
              builder: (context, snapshot) {
                return snapshot.data == ConnectivityResult.none
                    ? const NoInternetPage()
                    : DetailNewsScreen(ramz: ramz);
              }),
          // DetailsStock(ramz: ramz),
          settings: settings);

// dashStockRoute

    case AppRoutes.dashStockRoute:
      final ramz = settings.arguments as String;
      return CupertinoPageRoute(
          builder: (_) => StreamBuilder<ConnectivityResult>(
              stream: Connectivity().onConnectivityChanged,
              builder: (context, snapshot) {
                return snapshot.data == ConnectivityResult.none
                    ? const NoInternetPage()
                    : NewDash(ramz: ramz);
              }),
          //  OldDash(ramz: ramz),
          // DetailsStock(ramz: ramz),
          settings: settings);

    case AppRoutes.navbarRoute:
      return CupertinoPageRoute(
          builder: (_) => StreamBuilder<ConnectivityResult>(
              stream: Connectivity().onConnectivityChanged,
              builder: (context, snapshot) {
                return snapshot.data == ConnectivityResult.none
                    ? const NoInternetPage()
                    : const BottomNavbarNew();
              }),
          settings: settings);
    case AppRoutes.successRoute:
      return CupertinoPageRoute(
          builder: (_) => StreamBuilder<ConnectivityResult>(
              stream: Connectivity().onConnectivityChanged,
              builder: (context, snapshot) {
                return snapshot.data == ConnectivityResult.none
                    ? const NoInternetPage()
                    : const SuccessfulLogin();
              }),
          settings: settings);
    case AppRoutes.resetPasswordRoute:
      return CupertinoPageRoute(
          builder: (_) => StreamBuilder<ConnectivityResult>(
              stream: Connectivity().onConnectivityChanged,
              builder: (context, snapshot) {
                return snapshot.data == ConnectivityResult.none
                    ? const NoInternetPage()
                    : ForgetPasswordWithEmail();
              }),
          settings: settings);
    case AppRoutes.loginRoute:
      return CupertinoPageRoute(
          builder: (_) => StreamBuilder<ConnectivityResult>(
              stream: Connectivity().onConnectivityChanged,
              builder: (context, snapshot) {
                return snapshot.data == ConnectivityResult.none
                    ? const NoInternetPage()
                    : LoginPage();
              }),
          settings: settings);
    case AppRoutes.registerRoute:
      return CupertinoPageRoute(
          builder: (_) => StreamBuilder<ConnectivityResult>(
              stream: Connectivity().onConnectivityChanged,
              builder: (context, snapshot) {
                return snapshot.data == ConnectivityResult.none
                    ? const NoInternetPage()
                    : RegisterPage();
              }),
          settings: settings);
    case AppRoutes.landingRoute:
    default:
      return CupertinoPageRoute(
          builder: (_) => StreamBuilder<ConnectivityResult>(
              stream: Connectivity().onConnectivityChanged,
              builder: (context, snapshot) {
                return snapshot.data == ConnectivityResult.none
                    ? const NoInternetPage()
                    : const LandingPage();
              }),
          settings: settings);
  }
}
