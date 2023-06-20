import 'dart:convert';

import 'package:app/models/sales_data_model.dart';
import 'package:app/models/stock_chart_model.dart';
import 'package:app/shared/components/constants.dart';
import 'package:app/shared/cubit/cubit.dart';
import 'package:app/shared/cubit/states.dart';
import 'package:app/shared/network/remote/dio_helper.dart';
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
                floatingActionButton: FloatingActionButton(
                  onPressed: () {
                    print("Search");
                    DioHelper.getData(path: '/', queryParameters: {
                      "stock": "ABUK-1"
                      // "$ramz-1"
                    }).then((value) {
                      debugPrint(value.runtimeType.toString());
                      // debugPrint(value.data.runtimeType.toString());
                      // var allData =
                      // StockChartModel.fromJson(jsonDecode(value.data));

                      //  'Total revenue', 'Gross profit','Operating income', 'Pretax income', 'Net income'
                      /* debugPrint(
                          "${allData.incomeStatement!.totalRevenue.runtimeType}");
                      debugPrint(
                          "${allData.incomeStatement!.grossProfit.runtimeType}");
                      debugPrint(
                          "${allData.incomeStatement!.operatingIncome.runtimeType}");
                      debugPrint(
                          "${allData.incomeStatement!.pretaxIncome.runtimeType}");*/
                      /*  debugPrint(
                          "netIncome before :: ${allData.incomeStatement!.netIncome.runtimeType}");

                      List<double> categories =
                          (allData.incomeStatement!.netIncome as List)
                              .map((item) => item as double)
                              .toList();
                      debugPrint(
                          "netIncome After :: ${categories.runtimeType}");*/
                      /*debugPrint(allData.revenue?.reportedR.toString());
                      debugPrint(allData.revenue?.headerR.toString());

                      debugPrint(allData.earning?.reportedE.toString());
                      debugPrint(allData.earning?.headerE.toString());

                      // debugPrint(allData
                      //     .incomeStatement?.totalRevenue.runtimeType
                      //     .toString());

                      List<String> categoriesE =
                          (allData.earning!.reportedE as List)
                              .map((item) => item as String)
                              .toList();

                      debugPrint(
                          "categories:: ${categoriesE.runtimeType.toString()}");
                      debugPrint("1");
                      List<double> listDoubleE = editList(categoriesE);
                      debugPrint("2");

                      debugPrint("listDouble:: ${listDoubleE.toString()}");
                      debugPrint("3");
                      debugPrint(
                          "**********************************************************");

// **********************************************************
                      List<String> categoriesR =
                          (allData.revenue?.reportedR as List)
                              .map((item) => item as String)
                              .toList();

                      debugPrint(
                          "categories:: ${categoriesR.runtimeType.toString()}");
                      debugPrint("1");
                      List<double> listDoubleR = editList(categoriesR);
                      debugPrint("2");

                      debugPrint("listDouble:: ${listDoubleR.toString()}");
                      debugPrint("3");*/
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
