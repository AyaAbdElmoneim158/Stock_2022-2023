// import 'package:app/models/stock_model.dart';
// import 'package:app/shared/components/constants.dart';
// import 'package:app/shared/cubit/cubit.dart';
// import 'package:app/shared/cubit/states.dart';
// import 'package:app/shared/styles/colors.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';
// import 'package:intl/intl.dart';
// class SalesData {
//   final String month;
//   final double sales;
//   SalesData(this.month, this.sales);
// }

// class BarChart1 {
//   final String name;
//   final List<SalesData> data;
//   BarChart1(this.name, this.data);
// }

// class ProfilePage extends StatelessWidget {
//   const ProfilePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<AppCubit, AppStates>(
//         listener: (context, state) {},
//         builder: (context, state) {
//           final appCubit = AppCubit.get(context);
//           return Scaffold(
//               floatingActionButton: CircleAvatar(
//                 backgroundColor: firstColor,
//                 radius: 30,
//                 child: InkWell(
//                   child: const Icon(Icons.add),
//                   onTap: () {
//                     StockModle stockModle = StockModle(
//                       id: docmentIdFormLocationData(),
//                       logo:
//                           "https://static.mubasher.info/File.Company_Logo/5684aba85a54850b3c2d989810043af2.jpg",
//                       name: "بنك التعمير والاسكان",
//                       price: "1.6",
//                       ramz: "HDBK",
//                       stocksNo: "7",
//                     );

//                     appCubit.addArrowToFollowingArrow(stockModle);
//                   },
//                 ),
//               ),
//               body:  Center(
//                 child: Column(
//                   children: [
//                       Row(
//                 children: [
//                   TextButton(
//                       onPressed: () {
//                         setState(() {});
//                         if (!barChart1) {
//                           //Colors.white;
//                           barChart1 = true;
//                         } else {
//                           //Colors.blue;
//                           barChart1 = false;
//                         }
//                       },
//                       child: Text(
//                         'ربع ثانوي',
//                         style: TextStyle(
//                           color: !barChart1 ? Colors.blueAccent : Colors.black,
//                           fontSize: 20,
//                           // fontFamily: FontWeight.w600
//                         ),
//                       )),
//                   TextButton(
//                       onPressed: () {
//                         setState(() {});
//                         if (barChart1) {
//                           //Colors.white;
//                           barChart1 = false;
//                         } else {
//                           //Colors.blue;
//                           barChart1 = true;
//                         }
//                       },
//                       child: Text(
//                         'سنوي',
//                         style: TextStyle(
//                           color: barChart1 ? Colors.blueAccent : Colors.black,
//                           fontSize: 20,
//                           // fontFamily: FontWeight.w600
//                         ),
//                       )),
//                   const Spacer(),
//                   TextButton(
//                       onPressed: () {},
//                       child: const Text(
//                         'بيان الدخل',
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 20,
//                           // fontFamily: FontWeight.w600
//                         ),
//                       )),
//                 ],
//               ),
//               SizedBox(
//                 width: 350,
//                 height: 350,
//                 child: !barChart1
//                     ? SfCartesianChart(
//                         legend: Legend(
//                             isVisible: true, position: LegendPosition.bottom),
//                         tooltipBehavior: _tooltipBehavior,
//                         series: <CartesianSeries>[
//                           LineSeries<SalesData, String>(
//                               dataSource: _LineBarChartData1,
//                               xValueMapper: (SalesData sales, _) => sales.month,
//                               yValueMapper: (SalesData sales, _) => sales.sales,
//                               name: 'هامش الربح %',
//                               color: const Color(0xFFF09F01),
//                               enableTooltip: true,
//                               markerSettings:
//                                   const MarkerSettings(isVisible: true)),
//                           for (var group in _BarChartData1)
//                             ColumnSeries<SalesData, String>(
//                               dataSource: group.data,
//                               xValueMapper: (SalesData sales, _) => sales.month,
//                               yValueMapper: (SalesData sales, _) => sales.sales,
//                               borderRadius: BorderRadius.circular(8.0),
//                               name: group.name,
//                               enableTooltip: true,
//                             ),
//                         ],
//                         primaryXAxis: CategoryAxis(),
//                         primaryYAxis: NumericAxis(
//                             edgeLabelPlacement: EdgeLabelPlacement.shift,
//                             numberFormat: NumberFormat.simpleCurrency(
//                                 decimalDigits: 1, name: 'B')),
//                       )
//                     : SfCartesianChart(
//                         legend: Legend(
//                             isVisible: true, position: LegendPosition.bottom),
//                         tooltipBehavior: _tooltipBehavior,
//                         series: <CartesianSeries>[
//                           LineSeries<SalesData, String>(
//                               dataSource: _LineBarChartData2,
//                               xValueMapper: (SalesData sales, _) => sales.month,
//                               yValueMapper: (SalesData sales, _) => sales.sales,
//                               name: 'هامش الربح %',
//                               color: const Color(0xFFF09F01),
//                               enableTooltip: true,
//                               markerSettings:
//                                   const MarkerSettings(isVisible: true)),
//                           for (var group in _BarChartData2)
//                             ColumnSeries<SalesData, String>(
//                               dataSource: group.data,
//                               xValueMapper: (SalesData sales, _) => sales.month,
//                               yValueMapper: (SalesData sales, _) => sales.sales,
//                               borderRadius: BorderRadius.circular(8.0),
//                               name: group.name,
//                               enableTooltip: true,
//                             ),
//                         ],
//                         primaryXAxis: CategoryAxis(),
//                         primaryYAxis: NumericAxis(
//                             edgeLabelPlacement: EdgeLabelPlacement.shift,
//                             numberFormat: NumberFormat.simpleCurrency(
//                                 decimalDigits: 0, name: 'B')),
//                       ),
//               ),
//               const Divider(
//                 height: 20,
//               ),
// //!~> income_statement -------------------------------------------------------------------------------------
             
//                   ],
//                 ),
//               ));
//         });
//   }
// }
