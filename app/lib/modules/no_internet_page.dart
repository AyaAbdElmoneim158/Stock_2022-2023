import 'package:flutter/material.dart';
import 'package:app/shared/styles/size_config.dart';

class NoInternetPage extends StatelessWidget {
  const NoInternetPage({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      body: Center(
          child: Column(
        children: [
          const Text("No Connection..!"),
          Image.network(
            'https://img.freepik.com/premium-vector/lost-wireless-connection-disconnected-cable-no-wifi-signal-internet-page-found-display-smartphone-screen-background-vector-illustration_2175-1157.jpg?size=626&ext=jpg',
            height: SizeConfig.screenHeight! * 0.3, //30%
            width: double.infinity,
          ),
        ],
      )),
    );
  }
}
