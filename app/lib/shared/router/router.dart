import 'package:app/layout/bottom_navbar_new.dart';
import 'package:app/modules/Auth_pages/successful_page.dart';
import 'package:app/modules/Navbar_pages/details_new_page.dart';
import 'package:app/modules/Navbar_pages/new_dash.dart';
import 'package:app/modules/Navbar_pages/stocks_inner_sector_new.dart';
import 'package:app/modules/Auth_pages/forgetpasssword/with_email.dart';
import 'package:app/modules/chatApp/chat_screen.dart';
import 'package:app/modules/landing_page.dart';
import 'package:app/modules/news_url.dart';
import 'package:app/modules/Auth_pages/login_page.dart';
import 'package:app/modules/Auth_pages/register_page.dart';
import 'package:app/modules/no_internet_page.dart';
import 'package:app/shared/router/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

//ToDo: onGenerate-router.......................................................
Route<dynamic> onGenerate(RouteSettings settings) {
  switch (settings.name) {
    ///~> ChatScreen---------------------------------------------------------------
    case AppRoutes.chatRoute:
      return CupertinoPageRoute(
          builder: (_) => StreamBuilder<ConnectivityResult>(
              stream: Connectivity().onConnectivityChanged,
              builder: (context, snapshot) {
                return snapshot.data == ConnectivityResult.none
                    ? const NoInternetPage()
                    : const ChatScreen();
              }),
          settings: settings);

    ///~> NewsUrl---------------------------------------------------------------
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

    ///~> StockAtSectorNew------------------------------------------------------
    case AppRoutes.stocksAtSectorRoute:
      final args = settings.arguments as Map<String, dynamic>;
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
          settings: settings);

    ///~> DetailNewsScreen------------------------------------------------------
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
          settings: settings);

    ///~> NewDash---------------------------------------------------------------
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
          settings: settings);

    ///~> BottomNavbarNew-------------------------------------------------------
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

    ///~> SuccessfulLogin-------------------------------------------------------
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

    ///~> ForgetPasswordWithEmail-----------------------------------------------
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

    ///~> LoginPage-------------------------------------------------------------
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

    ///~> RegisterPage----------------------------------------------------------
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

    ///~> LandingPage-----------------------------------------------------------
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
