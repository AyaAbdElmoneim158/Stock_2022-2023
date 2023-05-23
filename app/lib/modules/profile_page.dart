import 'package:app/models/sales_data_model.dart';
import 'package:app/shared/components/components.dart';
import 'package:app/shared/components/constants.dart';

import 'package:flutter/material.dart';
// import 'package:app/models/salesData_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';
import 'package:app/shared/cubit/cubit.dart';
import 'package:app/shared/cubit/states.dart';
import 'package:carousel_slider/carousel_slider.dart';

Padding headChart(BuildContext context,
    {required String chartName, required String chartType}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(chartName, style: Theme.of(context).textTheme.headlineMedium),
        Text(chartType, style: Theme.of(context).textTheme.headlineMedium),
      ],
    ),
  );
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          final appCubit = AppCubit.get(context);
          // ..fetchChartApiData(context);
          // List<SalesData> salesData2 = [];
          // salesData2 = appCubit.salesData1.cast<SalesData>();
          return

//?incomeChart ✅ *********************************************************************************

              Scaffold(
            backgroundColor: Colors.white,
            floatingActionButton: FloatingActionButton(
                onPressed: () {
                  // appCubit.fetchChartApiData(context);
                },
                child: const Icon(Icons.search)),
            body: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    headChart(context,
                        chartName: 'بيان الدخل', chartType: 'سنوي'),
                    incomeChart(appCubit),
                    Divider(
                        color: Colors.grey[200], thickness: 1.5, height: 1.4),
                    /*headChart(context,
                        chartName: 'الميزانية العامه', chartType: 'سنوي'),
                    balanceSheetChart(appCubit),
                    Divider(
                        color: Colors.grey[200], thickness: 1.5, height: 1.4),
                    headChart(context,
                        chartName: 'التدفقات النقديه', chartType: 'سنوي'),
                    cashFlowChart(appCubit),
                    Divider(
                        color: Colors.grey[200], thickness: 1.5, height: 1.4),
                    headChart(context, chartName: 'العوائد', chartType: 'سنوي'),*/
                  ],
                ),
              ),
            ),
          );
        });
  }

  SizedBox cashFlowChart(AppCubit appCubit) {
    return SizedBox(
      width: 350,
      // height: 350,
      child: appCubit.groupSalesDataIncomeChart.isNotEmpty
          ? SfCartesianChart(
              legend: Legend(isVisible: true, position: LegendPosition.bottom),
              tooltipBehavior: TooltipBehavior(enable: true),
              series: <LineSeries>[
                for (var group in appCubit.groupSalesDataCashFlowChart)
                  LineSeries<SalesData, String>(
                      dataSource: group.data,
                      xValueMapper: (SalesData sales, _) => sales.month,
                      yValueMapper: (SalesData sales, _) => sales.sales,
                      name: group.name,
                      enableTooltip: true,
                      markerSettings: const MarkerSettings(isVisible: true)),
              ],
              primaryXAxis: CategoryAxis(),
              primaryYAxis: NumericAxis(
                  edgeLabelPlacement: EdgeLabelPlacement.shift,
                  numberFormat:
                      NumberFormat.simpleCurrency(decimalDigits: 1, name: 'B')),
            )
          : Container(
              color: Colors.white,
              child: Center(child: Image.asset('assets/ripple.gif'))),
    );
  }

  SizedBox balanceSheetChart(AppCubit appCubit) {
    return SizedBox(
      width: 350,
      // width: double.infinity,

      child: appCubit.groupSalesDataIncomeChart.isNotEmpty
          ? SfCartesianChart(
              legend: Legend(isVisible: true, position: LegendPosition.bottom),
              tooltipBehavior: TooltipBehavior(enable: true),
              series: <CartesianSeries>[
                for (var group in appCubit.groupSalesDataBalanceSheetChart)
                  ColumnSeries<SalesData, String>(
                    dataSource: group.data,
                    xValueMapper: (SalesData sales, _) => sales.month,
                    yValueMapper: (SalesData sales, _) => sales.sales,
                    borderRadius: BorderRadius.circular(8.0),
                    name: group.name,
                    enableTooltip: true,
                  ),
              ],
              primaryXAxis: CategoryAxis(),
              primaryYAxis: NumericAxis(
                  edgeLabelPlacement: EdgeLabelPlacement.shift,
                  numberFormat:
                      NumberFormat.simpleCurrency(decimalDigits: 1, name: 'B')),
            )
          : Container(
              color: Colors.white,
              child: Center(child: Image.asset('assets/ripple.gif'))),
    );
  }
}

SizedBox incomeChart(AppCubit appCubit) {
  return SizedBox(
    height: 350,
    // width: double.infinity,
    child: appCubit.groupSalesDataIncomeChart.isNotEmpty
        ? SfCartesianChart(
            plotAreaBorderWidth: 0,
            //!~> Text under chart....
            legend: Legend(
              isVisible: true,
              position: LegendPosition.bottom,
            ),
            //!~> Behavior of chart....
            tooltipBehavior: TooltipBehavior(enable: true),
            //!~> series ....
            series: <CartesianSeries>[
              //!~> Each colum....
              for (var group in appCubit.groupSalesDataIncomeChart)
                ColumnSeries<SalesData, String>(
                    dataSource: group.data,
                    xValueMapper: (SalesData sales, _) => sales.month,
                    yValueMapper: (SalesData sales, _) => sales.sales,
                    borderRadius: BorderRadius.circular(2.0),
                    name: group.name,
                    enableTooltip: true,
                    spacing: 0.2,
                    color: group == appCubit.groupSalesDataIncomeChart[0]
                        ? const Color(0xff00bcd4)
                        : group == appCubit.groupSalesDataIncomeChart[1]
                            ? const Color(0xff5b9cf6)
                            : group == appCubit.groupSalesDataIncomeChart[2]
                                ? const Color(0xfff57f17)
                                : group == appCubit.groupSalesDataIncomeChart[3]
                                    ? const Color(0xffb388ff)
                                    : const Color(0xfffbc02d)),
            ],
            //!~> format X,Y Axis....
            primaryXAxis: CategoryAxis(isVisible: false),
            primaryYAxis: NumericAxis(
                labelAlignment: LabelAlignment.start,
                edgeLabelPlacement: EdgeLabelPlacement.shift,
                numberFormat:
                    NumberFormat.simpleCurrency(decimalDigits: 2, name: 'B')),
          )
        : Container(
            color: Colors.white,
            child: Center(child: Image.asset('assets/ripple.gif'))),
  );
}



//?StockInnerSector ✅ *********************************************************************************
/*
final appCubit = AppCubit.get(context);
          // ..getIncomeChartApiData(context);
          // List<SalesData> salesData2 = [];
          // salesData2 = appCubit.salesData1.cast<SalesData>();
....................................
Scaffold(
            backgroundColor: Colors.white,
            floatingActionButton: FloatingActionButton(
                onPressed: () {
                  // appCubit.fetchStockInnerSector();
                },
                child: const Icon(Icons.search)),
            body: Column(
              children: [
                // ListView.builder(itemBuilder: ,itemCount: ,)
                SizedBox(
                  height: 200,
                  child: CarouselSlider.builder(
                    options: CarouselOptions(
                      height: 150.0,
                      aspectRatio: 16 / 9,
                      viewportFraction: 0.8,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 3),
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.3,
                      // onPageChanged: callbackFunction,
                      scrollDirection: Axis.horizontal,
                    ),
                    itemCount: sectorsData.length,
                    itemBuilder: (BuildContext context, int itemIndex,
                            int pageViewIndex) =>
                        defaultSector(context, sectorsData[itemIndex],
                            index: itemIndex),
                  ),
                ),
              ],
            ),
          );
 */
