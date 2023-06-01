import 'package:app/shared/cubit/cubit.dart';
import 'package:app/shared/cubit/states.dart';
import 'package:app/shared/styles/colors.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

class MyChart extends StatelessWidget {
  const MyChart({super.key, required this.ramz});
  final String ramz;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..fetchStockTimeline(), //ramz: ramz
      child: BlocConsumer<AppCubit, AppStates>(
          listener: (context, state) {},
          builder: (context, state) {
            final appCubit = AppCubit.get(context);
            final List<SalesDataYear> chartData =
                AppCubit.get(context).chartData;
            final size = MediaQuery.of(context).size;
            // final List<SalesDataYear> chartData = [
            //   SalesDataYear(DateTime.parse("2023-05-11"), 35),
            //   SalesDataYear(DateTime.parse("2023-05-12"), 28),
            //   SalesDataYear(DateTime.parse("2023-05-13"), 34),
            //   SalesDataYear(DateTime.parse("2023-05-14"), 32),
            //   SalesDataYear(DateTime.parse("2023-05-15"), 40)
            // ];

            return ConditionalBuilder(
              condition: state is! FetchStockTimelineLoadingState,
              builder: (context) => SizedBox(
                height: 300,
                child: SfCartesianChart(
                    tooltipBehavior: TooltipBehavior(
                      enable: true,
                      builder: (data, point, series, pointIndex, seriesIndex) {
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
                      LineSeries<SalesDataYear, DateTime>(
                          dataSource: chartData,
                          xValueMapper: (SalesDataYear sales, _) => sales.year,
                          yValueMapper: (SalesDataYear sales, _) => sales.sales,
                          pointColorMapper: (SalesDataYear sales, _) =>
                              kPrimaryColor)
                    ]),
              ),
              fallback: (context) => Container(
                  color: Colors.white,
                  child: Center(
                      child: Image.network(
                          "https://www.thisiscolossal.com/wp-content/uploads/2014/03/120430.gif"))),
            );
          }),
    );
  }
}
