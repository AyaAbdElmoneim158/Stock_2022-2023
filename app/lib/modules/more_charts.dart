/*import 'package:flutter/material.dart';

class MoreChats extends StatelessWidget {
  const MoreChats({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: Text("more Chats"),
    ));
  }
}*/

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  late List<BarChart1> _BarChartData1;
  late List<BarChart1> _BarChartData2;
  late List<BarChart1> _BarChartData3;
  late List<BarChart1> _BarChartData4;
  late List<SalesData> _LineBarChartData1;
  late List<SalesData> _LineBarChartData2;
  late List<SalesData> _LineBarChartData3;
  late List<SalesData> _LineBarChartData4;
  late List<BarChart1> _LineChartData1;
  late List<BarChart1> _LineChartData2;
  late List<SalesData> _pioChartData;
  late List<SalesData> _ScatterChartData1;
  late List<SalesData> _ScatterChartData2;
  late List<SalesData> _ScatterChartData3;
  late List<SalesData> _ScatterChartData4;
  late List<SalesData> _ScatterChartData5;
  late List<SalesData> _ScatterChartData6;
  late List<SalesData> _ScatterChartData7;
  late List<SalesData> _ScatterChartData8;
  late TooltipBehavior _tooltipBehavior;
  late TooltipBehavior _tooltipBehavior2;
  late TooltipBehavior _tooltipBehavior3;
  late TooltipBehavior _tooltipBehavior4;
  late TooltipBehavior _tooltipBehavior5;
  late TooltipBehavior _tooltipBehavior6;
  bool barChart1 = false;
  bool barChart2 = false;
  bool LineChart1 = false;
  bool ScatterChart1 = false;
  bool ScatterChart2 = false;

  List<BarChart1> getBarChartData1() {
    List<SalesData> salesData1 = [
      SalesData("Q2'21", 35),
      SalesData("Q3'21", 28),
      SalesData("Q4'21", 34),
      SalesData("Q1'22", 28),
      SalesData("Q2'22", 34),
    ];

    List<SalesData> salesData2 = [
      SalesData("Q2'21", 20),
      SalesData("Q3'21", 32),
      SalesData("Q4'21", 25),
      SalesData("Q1'22", 28),
      SalesData("Q2'22", 34),
    ];

    List<BarChart1> groupSalesData = [
      BarChart1('الإيرادات', salesData1),
      BarChart1('صافي الربح', salesData2),
    ];
    // return chartData;

    return groupSalesData;
  }

  List<BarChart1> getBarChartData2() {
    List<SalesData> salesData1 = [
      SalesData("2017", 25),
      SalesData("2018", 38),
      SalesData("2019", 44),
      SalesData("2020", 38),
      SalesData("2021", 14),
    ];

    List<SalesData> salesData2 = [
      SalesData("2017", 30),
      SalesData("2018", 42),
      SalesData("2019", 35),
      SalesData("2020", 18),
      SalesData("2021", 24),
    ];

    List<BarChart1> groupSalesData = [
      BarChart1('الإيرادات', salesData1),
      BarChart1('صافي الربح', salesData2),
    ];
    // return chartData;

    return groupSalesData;
  }

  List<BarChart1> getBarChartData3() {
    List<SalesData> salesData1 = [
      SalesData("Q2'21", 45),
      SalesData("Q3'21", 28),
      SalesData("Q4'21", 24),
      SalesData("Q1'22", 48),
      SalesData("Q2'22", 24),
    ];

    List<SalesData> salesData2 = [
      SalesData("Q2'21", 30),
      SalesData("Q3'21", 42),
      SalesData("Q4'21", 35),
      SalesData("Q1'22", 18),
      SalesData("Q2'22", 24),
    ];

    List<BarChart1> groupSalesData = [
      BarChart1('إجمالي الأصول', salesData1),
      BarChart1('إجمالي المطلوب', salesData2),
    ];
    // return chartData;

    return groupSalesData;
  }

  List<BarChart1> getBarChartData4() {
    List<SalesData> salesData1 = [
      SalesData("2017", 25),
      SalesData("2018", 38),
      SalesData("2019", 44),
      SalesData("2020", 38),
      SalesData("2021", 14),
    ];

    List<SalesData> salesData2 = [
      SalesData("2017", 30),
      SalesData("2018", 42),
      SalesData("2019", 35),
      SalesData("2020", 18),
      SalesData("2021", 24),
    ];

    List<BarChart1> groupSalesData = [
      BarChart1('إجمالي الأصول', salesData1),
      BarChart1('إجمالي المطلوب', salesData2),
    ];
    // return chartData;

    return groupSalesData;
  }

  List<SalesData> getLineBarChartData1() {
    List<SalesData> salesData1 = [
      SalesData("Q2'21", 35),
      SalesData("Q3'21", 28),
      SalesData("Q4'21", 34),
      SalesData("Q1'22", 28),
      SalesData("Q2'22", 14),
    ];

    return salesData1;
  }

  List<SalesData> getLineBarChartData2() {
    List<SalesData> salesData1 = [
      SalesData("2017", 35),
      SalesData("2018", 28),
      SalesData("2019", 34),
      SalesData("2020", 28),
      SalesData("2021", 14),
    ];

    return salesData1;
  }

  List<SalesData> getLineBarChartData3() {
    List<SalesData> salesData1 = [
      SalesData("Q2'21", 35),
      SalesData("Q3'21", 28),
      SalesData("Q4'21", 34),
      SalesData("Q1'22", 28),
      SalesData("Q2'22", 14),
    ];

    return salesData1;
  }

  List<SalesData> getLineBarChartData4() {
    List<SalesData> salesData1 = [
      SalesData("2017", 35),
      SalesData("2018", 28),
      SalesData("2019", 34),
      SalesData("2020", 28),
      SalesData("2021", 14),
    ];

    return salesData1;
  }

  List<BarChart1> getLineChartData1() {
    List<SalesData> salesData1 = [
      SalesData("Q2'21", 35),
      SalesData("Q3'21", 28),
      SalesData("Q4'21", 34),
      SalesData("Q1'22", 28),
      SalesData("Q2'22", 34),
    ];

    List<SalesData> salesData2 = [
      SalesData("Q2'21", 20),
      SalesData("Q3'21", 32),
      SalesData("Q4'21", 25),
      SalesData("Q1'22", 28),
      SalesData("Q2'22", 34),
    ];
    List<SalesData> salesData3 = [
      SalesData("Q2'21", 10),
      SalesData("Q3'21", 22),
      SalesData("Q4'21", 35),
      SalesData("Q1'22", 48),
      SalesData("Q2'22", 44),
    ];

    List<BarChart1> groupSalesData = [
      BarChart1('التشغيل', salesData1),
      BarChart1('الاستثمار', salesData2),
      BarChart1('التمويل', salesData3),
    ];
    // return chartData;

    return groupSalesData;
  }

  List<BarChart1> getLineChartData2() {
    List<SalesData> salesData1 = [
      SalesData("2017", 25),
      SalesData("2018", 38),
      SalesData("2019", 44),
      SalesData("2020", 38),
      SalesData("2021", 14),
    ];

    List<SalesData> salesData2 = [
      SalesData("2017", 30),
      SalesData("2018", 42),
      SalesData("2019", 35),
      SalesData("2020", 18),
      SalesData("2021", 24),
    ];

    List<SalesData> salesData3 = [
      SalesData("2017", 20),
      SalesData("2018", 32),
      SalesData("2019", 45),
      SalesData("2020", 28),
      SalesData("2021", 20),
    ];

    List<BarChart1> groupSalesData = [
      BarChart1('التشغيل', salesData1),
      BarChart1('الاستثمار', salesData2),
      BarChart1('التمويل', salesData3),
    ];
    // return chartData;

    return groupSalesData;
  }

  List<SalesData> getpioChartData() {
    List<SalesData> salesData1 = [
      SalesData("الأرباح المحتجزه", 75),
      SalesData("نسبه الدفع", 25),
    ];
    return salesData1;
  }

  List<SalesData> getScatterChartData1() {
    List<SalesData> salesData1 = [
      SalesData("Q2'21", 35),
      SalesData("Q3'21", 28),
      SalesData("Q4'21", 34),
      SalesData("Q1'22", 28),
      SalesData("Q2'22", 14),
    ];

    return salesData1;
  }

  List<SalesData> getScatterChartData2() {
    List<SalesData> salesData1 = [
      SalesData("Q2'21", 45),
      SalesData("Q3'21", 38),
      SalesData("Q4'21", 24),
      SalesData("Q1'22", 18),
      SalesData("Q2'22", 34),
    ];

    return salesData1;
  }

  List<SalesData> getScatterChartData3() {
    List<SalesData> salesData1 = [
      SalesData("2017", 45),
      SalesData("2018", 38),
      SalesData("2019", 24),
      SalesData("2020", 18),
      SalesData("2021", 34),
    ];

    return salesData1;
  }

  List<SalesData> getScatterChartData4() {
    List<SalesData> salesData1 = [
      SalesData("2017", 35),
      SalesData("2018", 28),
      SalesData("2019", 34),
      SalesData("2020", 28),
      SalesData("2021", 14),
    ];

    return salesData1;
  }

  List<SalesData> getScatterChartData5() {
    List<SalesData> salesData1 = [
      SalesData("Q2'21", 35),
      SalesData("Q3'21", 28),
      SalesData("Q4'21", 34),
      SalesData("Q1'22", 28),
      SalesData("Q2'22", 14),
    ];

    return salesData1;
  }

  List<SalesData> getScatterChartData6() {
    List<SalesData> salesData1 = [
      SalesData("Q2'21", 45),
      SalesData("Q3'21", 38),
      SalesData("Q4'21", 24),
      SalesData("Q1'22", 18),
      SalesData("Q2'22", 34),
    ];

    return salesData1;
  }

  List<SalesData> getScatterChartData7() {
    List<SalesData> salesData1 = [
      SalesData("2017", 45),
      SalesData("2018", 38),
      SalesData("2019", 24),
      SalesData("2020", 18),
      SalesData("2021", 34),
    ];

    return salesData1;
  }

  List<SalesData> getScatterChartData8() {
    List<SalesData> salesData1 = [
      SalesData("2017", 35),
      SalesData("2018", 28),
      SalesData("2019", 34),
      SalesData("2020", 28),
      SalesData("2021", 14),
    ];

    return salesData1;
  }

  @override
  void initState() {
    // TODO: implement initState
    _BarChartData1 = getBarChartData1();
    _BarChartData2 = getBarChartData2();
    _BarChartData3 = getBarChartData3();
    _BarChartData4 = getBarChartData4();
    _LineBarChartData1 = getLineBarChartData1();
    _LineBarChartData2 = getLineBarChartData2();
    _LineBarChartData3 = getLineBarChartData3();
    _LineBarChartData4 = getLineBarChartData4();
    _LineChartData1 = getLineChartData1();
    _LineChartData2 = getLineChartData2();
    _ScatterChartData1 = getScatterChartData1();
    _ScatterChartData2 = getScatterChartData2();
    _ScatterChartData3 = getScatterChartData3();
    _ScatterChartData4 = getScatterChartData4();
    _ScatterChartData5 = getScatterChartData5();
    _ScatterChartData6 = getScatterChartData6();
    _ScatterChartData7 = getScatterChartData7();
    _ScatterChartData8 = getScatterChartData8();
    _pioChartData = getpioChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    _tooltipBehavior2 = TooltipBehavior(enable: true);
    _tooltipBehavior3 = TooltipBehavior(enable: true);
    _tooltipBehavior4 = TooltipBehavior(enable: true);
    _tooltipBehavior5 = TooltipBehavior(enable: true);
    _tooltipBehavior6 = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                children: [
                  TextButton(
                      onPressed: () {
                        setState(() {});
                        if (!barChart1) {
                          //Colors.white;
                          barChart1 = true;
                        } else {
                          //Colors.blue;
                          barChart1 = false;
                        }
                      },
                      child: Text(
                        'ربع ثانوي',
                        style: TextStyle(
                          color: !barChart1 ? Colors.blueAccent : Colors.black,
                          fontSize: 20,
                          // fontFamily: FontWeight.w600
                        ),
                      )),
                  TextButton(
                      onPressed: () {
                        setState(() {});
                        if (barChart1) {
                          //Colors.white;
                          barChart1 = false;
                        } else {
                          //Colors.blue;
                          barChart1 = true;
                        }
                      },
                      child: Text(
                        'سنوي',
                        style: TextStyle(
                          color: barChart1 ? Colors.blueAccent : Colors.black,
                          fontSize: 20,
                          // fontFamily: FontWeight.w600
                        ),
                      )),
                  const Spacer(),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        'بيان الدخل',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          // fontFamily: FontWeight.w600
                        ),
                      )),
                ],
              ),
              SizedBox(
                width: 350,
                height: 350,
                child: !barChart1
                    ? SfCartesianChart(
                        legend: Legend(
                            isVisible: true, position: LegendPosition.bottom),
                        tooltipBehavior: _tooltipBehavior,
                        series: <CartesianSeries>[
                          LineSeries<SalesData, String>(
                              dataSource: _LineBarChartData1,
                              xValueMapper: (SalesData sales, _) => sales.month,
                              yValueMapper: (SalesData sales, _) => sales.sales,
                              name: 'هامش الربح %',
                              color: const Color(0xFFF09F01),
                              enableTooltip: true,
                              markerSettings:
                                  const MarkerSettings(isVisible: true)),
                          for (var group in _BarChartData1)
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
                            numberFormat: NumberFormat.simpleCurrency(
                                decimalDigits: 1, name: 'B')),
                      )
                    : SfCartesianChart(
                        legend: Legend(
                            isVisible: true, position: LegendPosition.bottom),
                        tooltipBehavior: _tooltipBehavior,
                        series: <CartesianSeries>[
                          LineSeries<SalesData, String>(
                              dataSource: _LineBarChartData2,
                              xValueMapper: (SalesData sales, _) => sales.month,
                              yValueMapper: (SalesData sales, _) => sales.sales,
                              name: 'هامش الربح %',
                              color: const Color(0xFFF09F01),
                              enableTooltip: true,
                              markerSettings:
                                  const MarkerSettings(isVisible: true)),
                          for (var group in _BarChartData2)
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
                            numberFormat: NumberFormat.simpleCurrency(
                                decimalDigits: 0, name: 'B')),
                      ),
              ),
              const Divider(
                height: 20,
              ),
//!~> income_statement -------------------------------------------------------------------------------------
              Row(
                children: [
                  TextButton(
                      onPressed: () {
                        setState(() {});
                        if (!barChart2) {
                          //Colors.white;
                          barChart2 = true;
                        } else {
                          //Colors.blue;
                          barChart2 = false;
                        }
                      },
                      child: Text(
                        'ربع ثانوي',
                        style: TextStyle(
                          color: !barChart2 ? Colors.blueAccent : Colors.black,
                          fontSize: 20,
                          // fontFamily: FontWeight.w600
                        ),
                      )),
                  TextButton(
                      onPressed: () {
                        setState(() {});
                        if (barChart2) {
                          //Colors.white;
                          barChart2 = false;
                        } else {
                          //Colors.blue;
                          barChart2 = true;
                        }
                      },
                      child: Text(
                        'سنوي',
                        style: TextStyle(
                          color: barChart2 ? Colors.blueAccent : Colors.black,
                          fontSize: 20,
                          // fontFamily: FontWeight.w600
                        ),
                      )),
                  const Spacer(),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        'الميزانية العامه',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          // fontFamily: FontWeight.w600
                        ),
                      )),
                ],
              ),
              SizedBox(
                width: 350,
                height: 350,
                child: !barChart2
                    ? SfCartesianChart(
                        legend: Legend(
                            isVisible: true, position: LegendPosition.bottom),
                        tooltipBehavior: _tooltipBehavior2,
                        series: <CartesianSeries>[
                          LineSeries<SalesData, String>(
                              dataSource: _LineBarChartData3,
                              xValueMapper: (SalesData sales, _) => sales.month,
                              yValueMapper: (SalesData sales, _) => sales.sales,
                              name: 'هامش الربح %',
                              color: const Color(0xFFF09F01),
                              enableTooltip: true,
                              markerSettings:
                                  const MarkerSettings(isVisible: true)),
                          // <ColumnSeries>[
                          //   // BarSeries<BarChart,String>(
                          //   //
                          //   //   name:'GDP' ,
                          //   //     dataSource: _chartData,
                          //   //     xValueMapper: (BarChart barChart,__)=>barChart.place,
                          //   //     yValueMapper: (BarChart barChart,__)=>barChart.quantity,
                          //   //   enableTooltip: true,
                          //   //   dataLabelSettings: DataLabelSettings(isVisible: true)
                          //   //
                          //   // )
                          //   for (var group in _BarChartData1)
                          //     ColumnSeries<SalesData, String>(
                          //         dataSource: group.data,
                          //         xValueMapper: (SalesData sales, _) => sales.month,
                          //         yValueMapper: (SalesData sales, _) => sales.sales,
                          //         // borderColor: Colors.amberAccent,
                          //         //color: Colors.amberAccent,
                          //         borderRadius: BorderRadius.circular(8.0),
                          //         name: group.name,
                          //         enableTooltip: true,
                          //         dataLabelSettings: const DataLabelSettings(isVisible: true)
                          //     ),
                          //
                          // ],
                          for (var group in _BarChartData3)
                            ColumnSeries<SalesData, String>(
                              dataSource: group.data,
                              xValueMapper: (SalesData sales, _) => sales.month,
                              yValueMapper: (SalesData sales, _) => sales.sales,
                              // borderColor: Colors.amberAccent,
                              //color: Colors.amberAccent,
                              borderRadius: BorderRadius.circular(8.0),
                              name: group.name,
                              enableTooltip: true,
                              //dataLabelSettings: const DataLabelSettings(isVisible: true)
                            ),
                        ],

                        //   <ColumnSeries>[
                        //   // BarSeries<BarChart,String>(
                        //   //
                        //   //   name:'GDP' ,
                        //   //     dataSource: _chartData,
                        //   //     xValueMapper: (BarChart barChart,__)=>barChart.place,
                        //   //     yValueMapper: (BarChart barChart,__)=>barChart.quantity,
                        //   //   enableTooltip: true,
                        //   //   dataLabelSettings: DataLabelSettings(isVisible: true)
                        //   //
                        //   // )
                        //     for (var group in _BarChartData1)
                        //       ColumnSeries<SalesData, String>(
                        //           dataSource: group.data,
                        //           xValueMapper: (SalesData sales, _) => sales.month,
                        //           yValueMapper: (SalesData sales, _) => sales.sales,
                        //          // borderColor: Colors.amberAccent,
                        //           //color: Colors.amberAccent,
                        //           borderRadius: BorderRadius.circular(8.0),
                        //           name: group.name,
                        //           enableTooltip: true,
                        //           dataLabelSettings: const DataLabelSettings(isVisible: true)
                        //     ),
                        //
                        // ],
                        primaryXAxis: CategoryAxis(),
                        primaryYAxis: NumericAxis(
                            edgeLabelPlacement: EdgeLabelPlacement.shift,
                            numberFormat: NumberFormat.simpleCurrency(
                                decimalDigits: 1, name: 'B')
                            //NumberFormat.simpleCurrency(decimalDigits: 0,),
                            //title: AxisTitle(text: 'BarChart in billions of U.S. Dollars')
                            ),
                      )
                    : SfCartesianChart(
                        legend: Legend(
                            isVisible: true, position: LegendPosition.bottom),
                        tooltipBehavior: _tooltipBehavior2,
                        series: <CartesianSeries>[
                          LineSeries<SalesData, String>(
                              dataSource: _LineBarChartData4,
                              xValueMapper: (SalesData sales, _) => sales.month,
                              yValueMapper: (SalesData sales, _) => sales.sales,
                              name: 'هامش الربح %',
                              color: const Color(0xFFF09F01),
                              enableTooltip: true,
                              markerSettings:
                                  const MarkerSettings(isVisible: true)),
                          // <ColumnSeries>[
                          //   // BarSeries<BarChart,String>(
                          //   //
                          //   //   name:'GDP' ,
                          //   //     dataSource: _chartData,
                          //   //     xValueMapper: (BarChart barChart,__)=>barChart.place,
                          //   //     yValueMapper: (BarChart barChart,__)=>barChart.quantity,
                          //   //   enableTooltip: true,
                          //   //   dataLabelSettings: DataLabelSettings(isVisible: true)
                          //   //
                          //   // )
                          //   for (var group in _BarChartData1)
                          //     ColumnSeries<SalesData, String>(
                          //         dataSource: group.data,
                          //         xValueMapper: (SalesData sales, _) => sales.month,
                          //         yValueMapper: (SalesData sales, _) => sales.sales,
                          //         // borderColor: Colors.amberAccent,
                          //         //color: Colors.amberAccent,
                          //         borderRadius: BorderRadius.circular(8.0),
                          //         name: group.name,
                          //         enableTooltip: true,
                          //         dataLabelSettings: const DataLabelSettings(isVisible: true)
                          //     ),
                          //
                          // ],
                          for (var group in _BarChartData4)
                            ColumnSeries<SalesData, String>(
                              dataSource: group.data,
                              xValueMapper: (SalesData sales, _) => sales.month,
                              yValueMapper: (SalesData sales, _) => sales.sales,
                              // borderColor: Colors.amberAccent,
                              //color: Colors.amberAccent,
                              borderRadius: BorderRadius.circular(8.0),
                              name: group.name,
                              enableTooltip: true,
                              //dataLabelSettings: const DataLabelSettings(isVisible: true)
                            ),
                        ],

                        //   <ColumnSeries>[
                        //   // BarSeries<BarChart,String>(
                        //   //
                        //   //   name:'GDP' ,
                        //   //     dataSource: _chartData,
                        //   //     xValueMapper: (BarChart barChart,__)=>barChart.place,
                        //   //     yValueMapper: (BarChart barChart,__)=>barChart.quantity,
                        //   //   enableTooltip: true,
                        //   //   dataLabelSettings: DataLabelSettings(isVisible: true)
                        //   //
                        //   // )
                        //     for (var group in _BarChartData1)
                        //       ColumnSeries<SalesData, String>(
                        //           dataSource: group.data,
                        //           xValueMapper: (SalesData sales, _) => sales.month,
                        //           yValueMapper: (SalesData sales, _) => sales.sales,
                        //          // borderColor: Colors.amberAccent,
                        //           //color: Colors.amberAccent,
                        //           borderRadius: BorderRadius.circular(8.0),
                        //           name: group.name,
                        //           enableTooltip: true,
                        //           dataLabelSettings: const DataLabelSettings(isVisible: true)
                        //     ),
                        //
                        // ],
                        primaryXAxis: CategoryAxis(),
                        primaryYAxis: NumericAxis(
                            edgeLabelPlacement: EdgeLabelPlacement.shift,
                            numberFormat: NumberFormat.simpleCurrency(
                                decimalDigits: 0, name: 'B')
                            //NumberFormat.simpleCurrency(decimalDigits: 0,),
                            //title: AxisTitle(text: 'BarChart in billions of U.S. Dollars')
                            ),
                      ),
              ),
              const Divider(
                height: 20,
              ),
//!~> balance_sheet -------------------------------------------------------------------------------------
              Row(
                children: [
                  TextButton(
                      onPressed: () {
                        setState(() {});
                        if (!LineChart1) {
                          LineChart1 = true;
                        } else {
                          LineChart1 = false;
                        }
                      },
                      child: Text(
                        'ربع ثانوي',
                        style: TextStyle(
                          color: !LineChart1 ? Colors.blueAccent : Colors.black,
                          fontSize: 20,
                          // fontFamily: FontWeight.w600
                        ),
                      )),
                  TextButton(
                      onPressed: () {
                        setState(() {});
                        if (LineChart1) {
                          LineChart1 = false;
                        } else {
                          LineChart1 = true;
                        }
                      },
                      child: Text(
                        'سنوي',
                        style: TextStyle(
                          color: LineChart1 ? Colors.blueAccent : Colors.black,
                          fontSize: 20,
                          // fontFamily: FontWeight.w600
                        ),
                      )),
                  const Spacer(),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        'التدفقات النقديه',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          // fontFamily: FontWeight.w600
                        ),
                      )),
                ],
              ),
              SizedBox(
                width: 350,
                height: 350,
                child: !LineChart1
                    ? SfCartesianChart(
                        legend: Legend(
                            isVisible: true, position: LegendPosition.bottom),
                        tooltipBehavior: _tooltipBehavior3,
                        series: <LineSeries>[
                          for (var group in _LineChartData1)
                            LineSeries<SalesData, String>(
                                dataSource: group.data,
                                xValueMapper: (SalesData sales, _) =>
                                    sales.month,
                                yValueMapper: (SalesData sales, _) =>
                                    sales.sales,
                                name: group.name,
                                enableTooltip: true,
                                markerSettings:
                                    const MarkerSettings(isVisible: true)),
                        ],
                        primaryXAxis: CategoryAxis(),
                        primaryYAxis: NumericAxis(
                            edgeLabelPlacement: EdgeLabelPlacement.shift,
                            numberFormat: NumberFormat.simpleCurrency(
                                decimalDigits: 1, name: 'B')),
                      )
                    : SfCartesianChart(
                        legend: Legend(
                            isVisible: true, position: LegendPosition.bottom),
                        tooltipBehavior: _tooltipBehavior3,
                        series: <LineSeries>[
                          for (var group in _LineChartData2)
                            LineSeries<SalesData, String>(
                                dataSource: group.data,
                                xValueMapper: (SalesData sales, _) =>
                                    sales.month,
                                yValueMapper: (SalesData sales, _) =>
                                    sales.sales,
                                name: group.name,
                                enableTooltip: true,
                                markerSettings:
                                    const MarkerSettings(isVisible: true)),
                        ],
                        primaryXAxis: CategoryAxis(),
                        primaryYAxis: NumericAxis(
                            edgeLabelPlacement: EdgeLabelPlacement.shift,
                            numberFormat: NumberFormat.simpleCurrency(
                                decimalDigits: 0, name: 'B')),
                      ),
              ),
              const Divider(
                height: 20,
              ),
//!~> cash_flow-------------------------------------------------------------------------------------
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        'أرباح',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          // fontFamily: FontWeight.w600
                        ),
                      )),
                ],
              ),
              SizedBox(
                width: 250,
                height: 250,
                child: SfCircularChart(
                  legend: Legend(isVisible: true, position: LegendPosition.top),
                  tooltipBehavior: _tooltipBehavior4,
                  series: <CircularSeries>[
                    DoughnutSeries<SalesData, String>(
                        dataSource: _pioChartData,
                        xValueMapper: (SalesData sales, _) => sales.month,
                        yValueMapper: (SalesData sales, _) => sales.sales,
                        enableTooltip: true,
                        dataLabelSettings:
                            const DataLabelSettings(isVisible: true)),
                  ],
                ),
              ),
              Column(
                children: [
                  Row(
                    children: const [
                      Text('7.46%'),
                      SizedBox(
                        width: 50,
                      ),
                      Text('عائد توزيع الارباح TTM'),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: const [
                      Text('0.35'),
                      SizedBox(
                        width: 50,
                      ),
                      Text('الدفعه الاخيره'),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: const [
                      Text('19 ابريل 2021'),
                      SizedBox(
                        width: 50,
                      ),
                      Text('تاريخ اخر استحقاق'),
                    ],
                  ),
                ],
              ),
              const Divider(
                height: 20,
              ),
//!~> dividends-------------------------------------------------------------------------------------
              Row(
                children: [
                  TextButton(
                      onPressed: () {
                        setState(() {});
                        if (!ScatterChart1) {
                          ScatterChart1 = true;
                        } else {
                          ScatterChart1 = false;
                        }
                      },
                      child: Text(
                        'ربع ثانوي',
                        style: TextStyle(
                          color:
                              !ScatterChart1 ? Colors.blueAccent : Colors.black,
                          fontSize: 20,
                          // fontFamily: FontWeight.w600
                        ),
                      )),
                  TextButton(
                      onPressed: () {
                        setState(() {});
                        if (ScatterChart1) {
                          ScatterChart1 = false;
                        } else {
                          ScatterChart1 = true;
                        }
                      },
                      child: Text(
                        'سنوي',
                        style: TextStyle(
                          color:
                              ScatterChart1 ? Colors.blueAccent : Colors.black,
                          fontSize: 20,
                          // fontFamily: FontWeight.w600
                        ),
                      )),
                  const Spacer(),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        'العوائد',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      )),
                ],
              ),
              SizedBox(
                width: 350,
                height: 350,
                child: !ScatterChart1
                    ? SfCartesianChart(
                        legend: Legend(
                            isVisible: true, position: LegendPosition.bottom),
                        tooltipBehavior: _tooltipBehavior5,
                        series: <ScatterSeries>[
                          ScatterSeries<SalesData, String>(
                            dataSource: _ScatterChartData1,
                            xValueMapper: (SalesData sales, _) => sales.month,
                            yValueMapper: (SalesData sales, _) => sales.sales,
                            name: 'الحقيقي',
                            enableTooltip: true,
                          ),
                          ScatterSeries<SalesData, String>(
                            dataSource: _ScatterChartData2,
                            xValueMapper: (SalesData sales, _) => sales.month,
                            yValueMapper: (SalesData sales, _) => sales.sales,
                            name: 'المتوقع',
                            enableTooltip: true,
                          ),
                        ],
                        primaryXAxis: CategoryAxis(),
                        primaryYAxis: NumericAxis(
                            edgeLabelPlacement: EdgeLabelPlacement.shift,
                            numberFormat: NumberFormat.simpleCurrency(
                                decimalDigits: 1, name: '')),
                      )
                    : SfCartesianChart(
                        //title: ChartTitle(text: 'Continue with Gdp _ 2023'),
                        legend: Legend(
                            isVisible: true, position: LegendPosition.bottom),
                        tooltipBehavior: _tooltipBehavior5,
                        series: <ScatterSeries>[
                          ScatterSeries<SalesData, String>(
                            dataSource: _ScatterChartData3,
                            xValueMapper: (SalesData sales, _) => sales.month,
                            yValueMapper: (SalesData sales, _) => sales.sales,
                            // borderColor: Colors.amberAccent,
                            //color: Colors.amberAccent,
                            //borderRadius: BorderRadius.circular(8.0),
                            //color: Colors.grey,

                            name: 'الحقيقي',
                            enableTooltip: true,
                            //dataLabelSettings: const DataLabelSettings(isVisible: true)
                          ),
                          ScatterSeries<SalesData, String>(
                            dataSource: _ScatterChartData4,
                            xValueMapper: (SalesData sales, _) => sales.month,
                            yValueMapper: (SalesData sales, _) => sales.sales,
                            // borderColor: Colors.amberAccent,
                            //color: Colors.amberAccent,
                            //borderRadius: BorderRadius.circular(8.0),
                            // color: Colors.greenAccent,

                            name: 'المتوقع',
                            enableTooltip: true,
                            //dataLabelSettings: const DataLabelSettings(isVisible: true)
                          ),
                        ],
                        primaryXAxis: CategoryAxis(),
                        primaryYAxis: NumericAxis(
                            edgeLabelPlacement: EdgeLabelPlacement.shift,
                            numberFormat: NumberFormat.simpleCurrency(
                                decimalDigits: 1, name: '')),
                      ),
              ),
              const Divider(
                height: 20,
              ),
//!~> revenue-------------------------------------------------------------------------------------
              Row(
                children: [
                  TextButton(
                      onPressed: () {
                        setState(() {});
                        if (!ScatterChart2) {
                          ScatterChart2 = true;
                        } else {
                          ScatterChart2 = false;
                        }
                      },
                      child: Text(
                        'ربع ثانوي',
                        style: TextStyle(
                          color:
                              !ScatterChart2 ? Colors.blueAccent : Colors.black,
                          fontSize: 20,
                          // fontFamily: FontWeight.w600
                        ),
                      )),
                  TextButton(
                      onPressed: () {
                        setState(() {});
                        if (ScatterChart2) {
                          ScatterChart2 = false;
                        } else {
                          ScatterChart2 = true;
                        }
                      },
                      child: Text(
                        'سنوي',
                        style: TextStyle(
                          color:
                              ScatterChart2 ? Colors.blueAccent : Colors.black,
                          fontSize: 20,
                          // fontFamily: FontWeight.w600
                        ),
                      )),
                  const Spacer(),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        'الإيرادات',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      )),
                ],
              ),
              SizedBox(
                width: 350,
                height: 350,
                child: !ScatterChart2
                    ? SfCartesianChart(
                        legend: Legend(
                            isVisible: true, position: LegendPosition.bottom),
                        tooltipBehavior: _tooltipBehavior6,
                        series: <ScatterSeries>[
                          ScatterSeries<SalesData, String>(
                            dataSource: _ScatterChartData5,
                            xValueMapper: (SalesData sales, _) => sales.month,
                            yValueMapper: (SalesData sales, _) => sales.sales,
                            name: 'الحقيقي',
                            enableTooltip: true,
                          ),
                          ScatterSeries<SalesData, String>(
                            dataSource: _ScatterChartData6,
                            xValueMapper: (SalesData sales, _) => sales.month,
                            yValueMapper: (SalesData sales, _) => sales.sales,
                            name: 'المتوقع',
                            enableTooltip: true,
                          ),
                        ],
                        primaryXAxis: CategoryAxis(),
                        primaryYAxis: NumericAxis(
                            edgeLabelPlacement: EdgeLabelPlacement.shift,
                            numberFormat: NumberFormat.simpleCurrency(
                                decimalDigits: 0, name: 'B')),
                      )
                    : SfCartesianChart(
                        legend: Legend(
                            isVisible: true, position: LegendPosition.bottom),
                        tooltipBehavior: _tooltipBehavior6,
                        series: <ScatterSeries>[
                          ScatterSeries<SalesData, String>(
                            dataSource: _ScatterChartData7,
                            xValueMapper: (SalesData sales, _) => sales.month,
                            yValueMapper: (SalesData sales, _) => sales.sales,
                            name: 'الحقيقي',
                            enableTooltip: true,
                          ),
                          ScatterSeries<SalesData, String>(
                            dataSource: _ScatterChartData8,
                            xValueMapper: (SalesData sales, _) => sales.month,
                            yValueMapper: (SalesData sales, _) => sales.sales,
                            name: 'المتوقع',
                            enableTooltip: true,
                          ),
                        ],
                        primaryXAxis: CategoryAxis(),
                        primaryYAxis: NumericAxis(
                            edgeLabelPlacement: EdgeLabelPlacement.shift,
                            numberFormat: NumberFormat.simpleCurrency(
                                decimalDigits: 0, name: 'B')),
                      ),
              ),
              const Divider(
                height: 20,
              ),
//!~> earning-------------------------------------------------------------------------------------
            ],
          ),
        ),
      ),
    );
  }
}

class SalesData {
  final String month;
  final double sales;
  SalesData(this.month, this.sales);
}

class BarChart1 {
  final String name;
  final List<SalesData> data;
  BarChart1(this.name, this.data);
}
