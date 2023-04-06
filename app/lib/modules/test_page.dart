import 'package:app/shared/styles/style.dart';
import 'package:flutter/material.dart';

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Text(
        "TestPage 🙈",
        style: titleStyle(context),
      ),
    ));
  }
}
