import 'dart:convert';

import 'package:app/models/sales_data_model.dart';
import 'package:app/models/stock_chart_model.dart';
import 'package:app/shared/components/components.dart';
import 'package:app/shared/components/constants.dart';
import 'package:app/shared/cubit/cubit.dart';
import 'package:app/shared/cubit/states.dart';
import 'package:app/shared/network/remote/auth_helper.dart';
import 'package:app/shared/network/remote/dio_helper.dart';
import 'package:app/shared/router/routes.dart';
import 'package:app/shared/styles/colors.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

class TestChatsApi extends StatelessWidget {
  const TestChatsApi({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
          listener: (context, state) {},
          builder: (context, state) {
            final appCubit = AppCubit.get(context);
            final List<SalesData> chartData2 = AppCubit.get(context).chartData2;
            final size = MediaQuery.of(context).size;

            return Scaffold(
                appBar: AppBar(actions: [
                  IconButton(
                      onPressed: () {
                        // navigatorTo(context,);
                        navigatorTo(
                          context: context,
                          routeName: AppRoutes.chatRoute,
                        );
                      },
                      icon: Icon(
                        Icons.chat_rounded,
                        color: AppColors.firstColor,
                      )),
                  IconButton(
                      onPressed: () {
                        // navigatorTo(context,);
                        AuthHelper.instance.logout();
                      },
                      icon: Icon(
                        Icons.logout,
                        color: AppColors.firstColor,
                      ))
                ]),
                floatingActionButton: FloatingActionButton(
                  onPressed: () {
                    print("Search");
                    DioHelper.getData(path: '/', queryParameters: {
                      "stock": "ABUK-1"
                      // "$ramz-1"
                    }).then((value) {
                      debugPrint(value.runtimeType.toString());
                    }).catchError((err) {
                      debugPrint(err.toString());
                    });
                  },
                  child: const Icon(Icons.search),
                ),
                body: Center(
                    child: Text(
                  transs['ABOU KIR FERTILIZERS'].toString(),
                  // trans(
                  //   enWord: ,
                  // ),
                  style: Theme.of(context).textTheme.headlineSmall,
                )));
          }),
    );
  }
}
