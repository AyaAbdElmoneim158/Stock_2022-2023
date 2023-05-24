// import 'package:app/models/sales_data_model.dart';
// import 'package:app/shared/cubit/cubit.dart';
// import 'package:app/shared/cubit/states.dart';
// import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';
// import 'package:intl/intl.dart';

// class NewDash extends StatelessWidget {
//   const NewDash({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => AppCubit()..fetchIncomeChart(),
//       child: BlocConsumer<AppCubit, AppStates>(
//         listener: (context, state) {},
//         builder: (context, state) {
//           final appCubit = AppCubit.get(context);
//           final size = MediaQuery.of(context).size;
//           List<SalesData> salesData1 = [
//             SalesData("Q2'21", 35),
//             SalesData("Q3'21", 28),
//             SalesData("Q4'21", 34),
//             SalesData("Q1'22", 28),
//             SalesData("Q2'22", 34),
//           ];

//           List<SalesData> salesData2 = [
//             SalesData("Q2'21", 20),
//             SalesData("Q3'21", 32),
//             SalesData("Q4'21", 25),
//             SalesData("Q1'22", 28),
//             SalesData("Q2'22", 34),
//           ];

//           List<BarChart1> groupSalesData = [
//             BarChart1('الإيرادات', salesData1),
//             BarChart1('صافي الربح', salesData2),
//           ];
//           return ConditionalBuilder(
//             condition: state is! FetchIncomeChartLoadingState,
//             builder: (context) => Scaffold(
//                 body: Center(
//               child: Column(
//                 children: [
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Row(
//                         children: [
//                           const Text('سنوي',
//                               style: TextStyle(
//                                 color: Colors.orangeAccent,
//                                 fontSize: 20,
//                                 // fontFamily: FontWeight.w600
//                               )),
//                           const Spacer(),
//                           TextButton(
//                               onPressed: () {},
//                               child: const Text(
//                                 'income_statement',
//                                 style: TextStyle(
//                                   color: Colors.black,
//                                   fontSize: 20,
//                                   // fontFamily: FontWeight.w600
//                                 ),
//                               )),
//                         ],
//                       ),
//                       SfCartesianChart(
//                         //! -------------------------- incomeBarChartData1
//                         legend: Legend(
//                             isVisible: true, position: LegendPosition.bottom),
//                         tooltipBehavior: TooltipBehavior(enable: true),
//                         series: <CartesianSeries>[
//                           for (var group in
//                               // groupSalesData
//                               appCubit.incomeBarChartData1)
//                             ColumnSeries<SalesData, String>(
//                                 dataSource: group.data,
//                                 xValueMapper: (SalesData sales, _) =>
//                                     sales.month,
//                                 yValueMapper: (SalesData sales, _) =>
//                                     sales.sales,
//                                 // borderRadius: BorderRadius.circular(8.0),
//                                 name: group.name,
//                                 enableTooltip: true,
//                                 spacing: 0.3),
//                         ],
//                         primaryXAxis: CategoryAxis(),
//                         primaryYAxis: NumericAxis(
//                             edgeLabelPlacement: EdgeLabelPlacement.shift,
//                             numberFormat: NumberFormat.simpleCurrency(
//                                 decimalDigits: 2, name: 'B')),
//                       )
//                     ],
//                   ),
//                   Divider(
//                     height: 1.2,
//                     color: Colors.grey.shade500,
//                   ),
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Row(
//                         children: [
//                           const Text('سنوي',
//                               style: TextStyle(
//                                 color: Colors.orangeAccent,
//                                 fontSize: 20,
//                                 // fontFamily: FontWeight.w600
//                               )),
//                           const Spacer(),
//                           TextButton(
//                               onPressed: () {},
//                               child: const Text(
//                                 'Balance Sheet',
//                                 style: TextStyle(
//                                   color: Colors.black,
//                                   fontSize: 20,
//                                   // fontFamily: FontWeight.w600
//                                 ),
//                               )),
//                         ],
//                       ),
//                       // Text(appCubit.page),
//                       SfCartesianChart(
//                         //! --------------------------SfCartesianChart
//                         legend: Legend(
//                             isVisible: true, position: LegendPosition.bottom),
//                         tooltipBehavior: TooltipBehavior(enable: true),
//                         series: <CartesianSeries>[
//                           for (var group in appCubit.balanceSheetBarChartData1)
//                             ColumnSeries<SalesData, String>(
//                                 dataSource: group.data,
//                                 xValueMapper: (SalesData sales, _) =>
//                                     sales.month,
//                                 yValueMapper: (SalesData sales, _) =>
//                                     sales.sales,
//                                 // borderRadius: BorderRadius.circular(8.0),
//                                 name: group.name,
//                                 enableTooltip: true,
//                                 spacing: 0.3),
//                         ],
//                         primaryXAxis: CategoryAxis(),
//                         primaryYAxis: NumericAxis(
//                             edgeLabelPlacement: EdgeLabelPlacement.shift,
//                             numberFormat: NumberFormat.simpleCurrency(
//                                 decimalDigits: 2, name: 'B')),
//                       )
//                     ],
//                   ),
//                   Divider(
//                     height: 1.2,
//                     color: Colors.grey.shade500,
//                   ),
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: const [
//                       /*  Row(
//                         children: [
//                           const Text('سنوي',
//                               style: TextStyle(
//                                 color: Colors.orangeAccent,
//                                 fontSize: 20,
//                                 // fontFamily: FontWeight.w600
//                               )),
//                           const Spacer(),
//                           TextButton(
//                               onPressed: () {},
//                               child: const Text(
//                                 'Cash Flow',
//                                 style: TextStyle(
//                                   color: Colors.black,
//                                   fontSize: 20,
//                                   // fontFamily: FontWeight.w600
//                                 ),
//                               )),
//                         ],
//                       ),*/
//                       // Text(appCubit.page),
//                       /* SfCartesianChart(
//                         //! --------------------------
//                         legend: Legend(
//                             isVisible: true, position: LegendPosition.bottom),
//                         tooltipBehavior: TooltipBehavior(enable: true),
//                         series: <LineSeries>[
//                           for (var group in appCubit.cashFlowBarChartData1)
//                             LineSeries<SalesData, String>(
//                               dataSource: group.data,
//                               xValueMapper: (SalesData sales, _) => sales.month,
//                               yValueMapper: (SalesData sales, _) => sales.sales,
//                               // borderRadius: BorderRadius.circular(8.0),
//                               name: group.name,
//                               enableTooltip: true,
//                               // spacing: 0.3
//                             ),
//                         ],
//                         primaryXAxis: CategoryAxis(),
//                         primaryYAxis: NumericAxis(
//                             edgeLabelPlacement: EdgeLabelPlacement.shift,
//                             numberFormat: NumberFormat.simpleCurrency(
//                                 decimalDigits: 2, name: 'B')),
//                       )*/
//                     ],
//                   ),
//                   Divider(
//                     height: 1.2,
//                     color: Colors.grey.shade500,
//                   ),
//                 ],
//               ),
//             )),
//             fallback: (context) => Container(
//                 color: Colors.white,
//                 child: Center(
//                     child: Center(child: Image.asset('assets/ripple.gif')))),
//           );
//         },
//       ),
//     );
//   }
// }
