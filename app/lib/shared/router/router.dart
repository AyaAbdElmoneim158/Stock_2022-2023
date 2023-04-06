import 'package:app/modules/test_page.dart';
import 'package:app/shared/router/routes.dart';
import 'package:flutter/cupertino.dart';

Route<dynamic> onGenerate(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.testRoute:
    default:
      return CupertinoPageRoute(
          builder: (_) => const TestPage(), settings: settings);
  }
}
