import 'package:app/models/sales_data_model.dart';
import 'package:app/modules/loading_page.dart';
import 'package:app/shared/components/components.dart';
import 'package:app/shared/components/constants.dart';
import 'package:app/shared/cubit/cubit.dart';
import 'package:app/shared/cubit/states.dart';
import 'package:app/shared/styles/colors.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

List<SalesData> salesData1 = [
  SalesData("2018", 35),
  SalesData("2019", 28),
  SalesData("2020", 34),
  SalesData("2021", 28),
  SalesData("2022", 34),
];
List<SalesData> salesData2 = [
  SalesData("2018", 20),
  SalesData("2019", 32),
  SalesData("2020", 25),
  SalesData("2021", 28),
  SalesData("2022", 34),
];
List<SalesData> salesData3 = [
  SalesData("2018", 10),
  SalesData("2019", 22),
  SalesData("2020", 35),
  SalesData("2021", 48),
  SalesData("2022", 44),
];
List<SalesData> salesData4 = [
  SalesData("2018", 60),
  SalesData("2019", 20),
  SalesData("2020", 2),
  SalesData("2021", 48),
  SalesData("2022", 24),
];
List<SalesData> salesData5 = [
  SalesData("2018", 19),
  SalesData("2019", 22),
  SalesData("2020", 35),
  SalesData("2021", 48),
  SalesData("2022", 44),
];

List<BarChart> incomeStatementData = [
  BarChart('Total revenue', salesData1),
  BarChart('Gross profit', salesData2),
  BarChart('Operating income', salesData3),
  BarChart('Pretax income', salesData4),
  BarChart('Net income', salesData5),
];

List<BarChart> balanceSheetData = [
  BarChart('Total assets', salesData1),
  BarChart('Total liabilities', salesData2),
];

List<BarChart> cashFlowData = [
  BarChart('Cash from operating activities', salesData1),
  BarChart('Cash from investing activities', salesData2),
  BarChart('Cash from financing activities', salesData2),
];

List<BarChart> divideData = [
  BarChart('Dividends per share', salesData1),
];

List<BarChart> revenueData = [
  BarChart('Reported', salesData1),
  BarChart('Estimate', salesData2),
];

List<BarChart> earningData = [
  BarChart('Reported', salesData1),
  BarChart('Estimate', salesData2),
];

class NewDash extends StatelessWidget {
  const NewDash({super.key, required this.ramz});
  final String ramz;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..fetchChartsData(ramz: ramz),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          final appCubit = AppCubit.get(context);
          final size = MediaQuery.of(context).size;
          List<BarChart> incomeBarChartData1 = appCubit.incomeBarChartData1,
              balanceSheetBarChartData1 = appCubit.balanceSheetBarChartData1,
              divideBarChartData1 = appCubit.divideBarChartData1,
              cashFlowBarChartData1 = appCubit.cashFlowBarChartData1,
              revenueBarChartData1 = appCubit.revenueBarChartData1,
              earningBarChartData1 = appCubit.earningBarChartData1;

          return ConditionalBuilder(
            condition: state is! FetchIncomeChartLoadingState,
            builder: (context) => Scaffold(
                appBar: generalAppbar(context),
                backgroundColor: AppColors.kBackgroundColor,
                body: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        //! Container_4 (AllCharts) ********************************************
/*
                        incomeBarChartData1.isEmpty
                            ? noData()
                            : columnsChart(
                                // incomeStatementData
                                groupsData: incomeBarChartData1,
                                chartName: Constants.incomeStatement),
 balanceSheetBarChartData1.isEmpty
                            ? noData()
                            : columnsChart(
                                //  balanceSheetData
                                groupsData: balanceSheetBarChartData1,
                                chartName: Constants.balanceSheet),



                        divideBarChartData1.isEmpty
                            ? noData()
                            : columnsChartWithLine(
                                //  divideData
                                groupsData: divideBarChartData1,
                                chartName: Constants.dividends,
                                dataSourceLine: appCubit.divideData2),
cashFlowBarChartData1.isEmpty
                            ? noData()
                            : columnsChart(
                                groupsData: cashFlowBarChartData1,
                                chartName: Constants.cashFlow),

*/

/*                        divideBarChartData1.isEmpty
                            ? noData()
                            : columnsChartWithLine(
                                //  divideData
                                groupsData: divideBarChartData1,
                                chartName: 'الإيرادات',
                                dataSourceLine: appCubit.divideData2),
                       
                        revenueBarChartData1.isEmpty
                            ? noData()
                            : columnsChart(
                                //revenueData1
                                // revenueBarChartData1
                                groupsData: appCubit.revenueBarChartData1,
                                // revenueData,
                                chartName: 'أرباح'),
                        earningBarChartData1.isEmpty
                            ? noData()
                            : columnsChart(
                                // earningBarChartData1
                                groupsData: appCubit.earningBarChartData1,
                                chartName: 'العوائد'),
                                */
                      ],
                    ),
                  ),
                )),
            fallback: (context) =>
                // const LoadingPage(),
                Container(
                    width: 50,
                    color: Colors.white,
                    child: Center(
                        child:
                            Center(child: Image.asset('assets/ripple.gif')))),
          );
        },
      ),
    );
  }

  Center noData() {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.network(
            'https://cdn-icons-png.flaticon.com/128/6598/6598519.png'),
        const SizedBox(height: 16),
        const Text("no data"),
      ],
    ));
  }
}

Column columnsChart(
    {required List<BarChart> groupsData, required String chartName}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Text(
              chartName,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                // fontFamily: FontWeight.w600
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
      SfCartesianChart(
        borderWidth: 0,
        borderColor: Colors.transparent,
        plotAreaBorderWidth: 0,
        //! -------------------------- incomeBarChartData1
        legend: Legend(isVisible: true, position: LegendPosition.bottom),
        tooltipBehavior: TooltipBehavior(enable: true),
        series: <CartesianSeries>[
          for (var group in groupsData)
            // appCubit.incomeBarChartData1)
            ColumnSeries<SalesData, String>(
                dataSource: group.data,
                xValueMapper: (SalesData sales, _) => sales.month,
                yValueMapper: (SalesData sales, _) => sales.sales,
                borderRadius: BorderRadius.circular(2.0),
                name: group.name,
                enableTooltip: true,
                spacing: 0.3,
                color: (group.name == 'إجمالي الإيرادات') ||
                        (group.name == 'total_revenue') ||
                        (group.name == 'إجمالي الأصول') ||
                        (group.name == 'total_assets') ||
                        (group.name == 'العائد النقدي من الأنشطة التشغيلية') ||
                        (group.name == 'cash_from_operating_activity') ||
                        (group.name == 'reported_E') ||
                        (group.name == '_مُبلّغ عنه')
                    ? const Color(0XFF448aff)
                    : (group.name == 'الربح الإجمالي') ||
                            (group.name == 'gross_profit') ||
                            (group.name == 'إجمالي المطلوبات') ||
                            (group.name == 'total_liabilities') ||
                            (group.name ==
                                'العائد النقدي من الأنشطة الاستثمارية') ||
                            (group.name == 'cash_from_investing_activity') ||
                            (group.name == 'reported_R') ||
                            (group.name == 'مُبلّغ عنه')
                        ? const Color(0XFF4dd0e1)
                        : (group.name == 'دخل التشغيل') ||
                                (group.name == 'operating_income') ||
                                (group.name ==
                                    'العائد النقدي من الأنشطة المالية') ||
                                (group.name == 'cash_from_financing_activity')
                            ? const Color(0XFFf57f17)
                            : (group.name == 'الدخل قبل الضرائب') ||
                                    (group.name == 'pretax_income')
                                ? const Color(0XFFb388ff)
                                : (group.name == 'صافي الدخل') ||
                                        (group.name == 'net_income')
                                    ? const Color(0XFF42bda8)
                                    : (group.name ==
                                                'توزيعات الأرباح لكل سهم (سنة مالية)') ||
                                            (group.name == 'dividens_per_share')
                                        ? const Color(0XFFfbc02d)
                                        : const Color(0XFFe0e3eb)),
        ],
        primaryXAxis:
            CategoryAxis(isVisible: false, placeLabelsNearAxisLine: false),
        primaryYAxis: NumericAxis(
            placeLabelsNearAxisLine: false,
            isVisible: false,
            edgeLabelPlacement: EdgeLabelPlacement.shift,
            numberFormat:
                NumberFormat.simpleCurrency(decimalDigits: 2, name: 'B')),
      ),
      Divider(height: 1.2, color: Colors.grey.shade500),
    ],
  );
}

Column columnsChartWithLine(
    {required List<BarChart> groupsData,
    required String chartName,
    required List<SalesData> dataSourceLine}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            Text(
              chartName,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                // fontFamily: FontWeight.w600
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
      SfCartesianChart(
        borderWidth: 0,
        borderColor: Colors.transparent,
        plotAreaBorderWidth: 0,
        //! -------------------------- incomeBarChartData1
        legend: Legend(isVisible: true, position: LegendPosition.bottom),
        tooltipBehavior: TooltipBehavior(enable: true),
        series: <CartesianSeries>[
          for (var group in groupsData)
            // appCubit.incomeBarChartData1)
            ColumnSeries<SalesData, String>(
                dataSource: group.data,
                xValueMapper: (SalesData sales, _) => sales.month,
                yValueMapper: (SalesData sales, _) => sales.sales,
                borderRadius: BorderRadius.circular(2.0),
                name: group.name,
                enableTooltip: true,
                spacing: 0.3,
                color: const Color(0XFF42bda8)
                //Colors.green
                //
                ),
          LineSeries<SalesData, String>(
              dataSource: dataSourceLine,
              xValueMapper: (SalesData sales, _) => sales.month,
              yValueMapper: (SalesData sales, _) => sales.sales,
              name: 'Dividend yield',
              color: const Color(0xFFF09F01),
              enableTooltip: true,
              markerSettings: const MarkerSettings(isVisible: true)),
        ],
        primaryXAxis: CategoryAxis(isVisible: false),
        primaryYAxis: NumericAxis(
            isVisible: false,
            edgeLabelPlacement: EdgeLabelPlacement.shift,
            numberFormat:
                NumberFormat.simpleCurrency(decimalDigits: 2, name: 'B')),
      ),
      Divider(height: 1.2, color: Colors.grey.shade500),
    ],
  );
}

Column chartWithLine(
    {required List<BarChart> groupsData,
    required String chartName,
    required List<SalesData> dataSourceLine}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      SfCartesianChart(
        borderWidth: 0,
        borderColor: Colors.transparent,
        plotAreaBorderWidth: 0,
        //! -------------------------- incomeBarChartData1
        legend: Legend(isVisible: true, position: LegendPosition.bottom),
        tooltipBehavior: TooltipBehavior(enable: true),
        series: <CartesianSeries>[
          for (var group in groupsData)
            // appCubit.incomeBarChartData1)
            /*ColumnSeries<SalesData, String>(
                dataSource: group.data,
                xValueMapper: (SalesData sales, _) => sales.month,
                yValueMapper: (SalesData sales, _) => sales.sales,
                borderRadius: BorderRadius.circular(2.0),
                name: group.name,
                enableTooltip: true,
                spacing: 0.3,
                color: const Color(0XFF42bda8)
                //Colors.green
                //
                ),*/
            LineSeries<SalesData, String>(
                dataSource: dataSourceLine,
                xValueMapper: (SalesData sales, _) => sales.month,
                yValueMapper: (SalesData sales, _) => sales.sales,
                name: 'Dividend yield',
                color: const Color(0xFFF09F01),
                enableTooltip: true,
                markerSettings: const MarkerSettings(isVisible: false)),
        ],
        primaryXAxis: CategoryAxis(isVisible: false),
        primaryYAxis: NumericAxis(
            isVisible: false,
            edgeLabelPlacement: EdgeLabelPlacement.shift,
            numberFormat:
                NumberFormat.simpleCurrency(decimalDigits: 2, name: 'B')),
      ),
      Divider(height: 1.2, color: Colors.grey.shade500),
    ],
  );
}

Column chartWithLine2(
    {required List<BarChart> groupsData,
    required String chartName,
    required List<SalesData> dataSourceLine}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      SfCartesianChart(
        borderWidth: 0,
        borderColor: Colors.transparent,
        plotAreaBorderWidth: 0,
        //! -------------------------- incomeBarChartData1
        // legend: Legend(isVisible: true, position: LegendPosition.bottom),
        tooltipBehavior: TooltipBehavior(enable: true),
        series: <CartesianSeries>[
          for (var group in groupsData)
            // appCubit.incomeBarChartData1)
            /*ColumnSeries<SalesData, String>(
                dataSource: group.data,
                xValueMapper: (SalesData sales, _) => sales.month,
                yValueMapper: (SalesData sales, _) => sales.sales,
                borderRadius: BorderRadius.circular(2.0),
                name: group.name,
                enableTooltip: true,
                spacing: 0.3,
                color: const Color(0XFF42bda8)
                //Colors.green
                //
                ),*/
            LineSeries<SalesData, String>(
                dataSource: dataSourceLine,
                xValueMapper: (SalesData sales, _) => sales.month,
                yValueMapper: (SalesData sales, _) => sales.sales,
                name: 'Dividend yield',
                color: const Color(0xFFF09F01),
                width: 2,
                enableTooltip: true,
                markerSettings: const MarkerSettings(isVisible: false)),
        ],
        primaryXAxis: CategoryAxis(isVisible: false),
        primaryYAxis: NumericAxis(
            isVisible: false,
            edgeLabelPlacement: EdgeLabelPlacement.shift,
            numberFormat:
                NumberFormat.simpleCurrency(decimalDigits: 2, name: '')),
      ),
      // Divider(height: 1.2, color: Colors.grey.shade500),
    ],
  );
}
