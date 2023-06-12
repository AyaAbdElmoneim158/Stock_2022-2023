import 'package:app/models/sales_data_model.dart';
import 'package:app/shared/cubit/cubit.dart';
import 'package:app/shared/cubit/states.dart';
import 'package:app/shared/styles/colors.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

class SalesDataMonth {
  final DateTime month;
  final double sales;
  SalesDataMonth(this.month, this.sales);
}

class SalesDataYear {
  SalesDataYear(this.year, this.sales);
  final DateTime year;
  final double sales;
}

class MyChart extends StatelessWidget {
  const MyChart({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      // ..fetchPridictionData(),
      //..fetchStockTimeline(),
      child: BlocConsumer<AppCubit, AppStates>(
          listener: (context, state) {},
          builder: (context, state) {
            final appCubit = AppCubit.get(context);
            final List<SalesData> chartData2 = AppCubit.get(context).chartData2;
            final size = MediaQuery.of(context).size;
            // final List<SalesDataYear> chartData = [
            //   SalesDataYear(DateTime.parse("2023-05-11"), 35),
            //   SalesDataYear(DateTime.parse("2023-05-12"), 28),
            //   SalesDataYear(DateTime.parse("2023-05-13"), 34),
            //   SalesDataYear(DateTime.parse("2023-05-14"), 32),
            //   SalesDataYear(DateTime.parse("2023-05-15"), 40)
            // ];

            return Scaffold(
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  print("Search");
                  // appCubit.fetchPridictionData();
                  // appCubit.f
                  // getModelData
                },
                child: const Icon(Icons.search),
              ),
              body: ConditionalBuilder(
                condition: state is! FetchStockTimelineLoadingState,
                builder: (context) => Center(
                  child: SizedBox(
                    height: 250,
                    child: SfCartesianChart(
                        backgroundColor: Colors.amber,
                        tooltipBehavior: TooltipBehavior(
                          enable: true,
                          builder:
                              (data, point, series, pointIndex, seriesIndex) {
                            return SizedBox(
                              width: 150,
                              height: 30,
                              child: Center(
                                  child: Text(
                                "${DateFormat('MM/dd/yyyy').format(data.year)} : ${data.sales} ",
                                style: const TextStyle(color: Colors.white),
                              )),
                            );
                          },
                        ),
                        plotAreaBorderWidth: 0,
                        borderColor: Colors.transparent,
                        enableSideBySideSeriesPlacement: false,
                        primaryXAxis: DateTimeAxis(isVisible: false),
                        primaryYAxis: DateTimeAxis(isVisible: false),
                        series: <ChartSeries>[
                          LineSeries<SalesData, String>(
                              dataSource: chartData2,
                              xValueMapper: (SalesData sales, _) => sales.month,
                              yValueMapper: (SalesData sales, _) => sales.sales,
                              pointColorMapper: (SalesData sales, _) =>
                                  firstColor)
                        ]),
                  ),
                ),
                fallback: (context) => Container(
                    color: Colors.white,
                    child: Center(
                        child: Image.network(
                            "https://cdn.dribbble.com/users/2973561/screenshots/5757826/loading__.gif"
                            // "https://www.thisiscolossal.com/wp-content/uploads/2014/03/120430.gif"
                            ))),
              ),
            );
          }),
    );
  }
}
