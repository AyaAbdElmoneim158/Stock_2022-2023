import 'dart:math';
import 'dart:ui' as ui;
import 'package:app/models/sales_data_model.dart';
import 'package:app/models/stock_model.dart';
import 'package:app/shared/components/components.dart';
import 'package:app/shared/cubit/cubit.dart';
import 'package:app/shared/styles/colors.dart';
import 'package:app/shared/styles/style.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';
import 'package:arabic_numbers/arabic_numbers.dart';

final List<SalesDataYear> chartData = [
  SalesDataYear(DateTime.parse("2023-05-11"), 35),
  SalesDataYear(DateTime.parse("2023-05-12"), 28),
  SalesDataYear(DateTime.parse("2023-05-13"), 34),
  SalesDataYear(DateTime.parse("2023-05-14"), 32),
  SalesDataYear(DateTime.parse("2023-05-15"), 40),
  SalesDataYear(DateTime.parse("2023-05-16"), 15),
  SalesDataYear(DateTime.parse("2023-05-17"), 58),
  SalesDataYear(DateTime.parse("2023-05-18"), 24),
  SalesDataYear(DateTime.parse("2023-05-19"), 72),
  SalesDataYear(DateTime.parse("2023-05-20"), 48),
  SalesDataYear(DateTime.parse("2023-05-21"), 15),
  SalesDataYear(DateTime.parse("2023-05-22"), 48),
  SalesDataYear(DateTime.parse("2023-05-23"), 74),
  SalesDataYear(DateTime.parse("2023-05-24"), 82),
  SalesDataYear(DateTime.parse("2023-05-25"), 30),
  SalesDataYear(DateTime.parse("2023-05-26"), 35),
  SalesDataYear(DateTime.parse("2023-05-27"), 28),
  SalesDataYear(DateTime.parse("2023-05-28"), 34),
  SalesDataYear(DateTime.parse("2023-05-29"), 32),
  SalesDataYear(DateTime.parse("2023-05-30"), 40),
  SalesDataYear(DateTime.parse("2023-06-01"), 15),
  SalesDataYear(DateTime.parse("2023-06-02"), 58),
  SalesDataYear(DateTime.parse("2023-06-03"), 24),
  SalesDataYear(DateTime.parse("2023-06-04"), 72),
  SalesDataYear(DateTime.parse("2023-06-05"), 48),
  SalesDataYear(DateTime.parse("2023-06-06"), 15),
  SalesDataYear(DateTime.parse("2023-06-07"), 48),
  SalesDataYear(DateTime.parse("2023-06-08"), 74),
  SalesDataYear(DateTime.parse("2023-06-09"), 82),
  SalesDataYear(DateTime.parse("2023-06-10"), 30),
];
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

List<BarChart1> incomeStatementData = [
  BarChart1('Total revenue', salesData1),
  BarChart1('Gross profit', salesData2),
  BarChart1('Operating income', salesData3),
  BarChart1('Pretax income', salesData4),
  BarChart1('Net income', salesData5),
];

List<BarChart1> balanceSheetData = [
  BarChart1('Total assets', salesData1),
  BarChart1('Total liabilities', salesData2),
];

List<BarChart1> cashFlowData = [
  BarChart1('Cash from operating activities', salesData1),
  BarChart1('Cash from investing activities', salesData2),
  BarChart1('Cash from financing activities', salesData2),
];

List<BarChart1> divideData = [
  BarChart1('Dividends per share', salesData1),
];

List<BarChart1> revenueData = [
  BarChart1('Reported', salesData1),
  BarChart1('Estimate', salesData2),
];

List<BarChart1> earningData = [
  BarChart1('Reported', salesData1),
  BarChart1('Estimate', salesData2),
];

AppBar detailsAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: kBackgroundColor,
    title: const Align(
      alignment: Alignment.centerLeft,
      child: Text("ramz"),
    ),
    titleTextStyle: kBodyText2,
    leading: IconButton(
      onPressed: () => Navigator.pop(context),
      icon: const Icon(
        Icons.arrow_back_ios,
        color: firstColor,
      ),
    ),
  );
}

class DetailsBody extends StatelessWidget {
  const DetailsBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SingleChildScrollView(
        child: Column(children: [
//! Container_1*********************************************
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 21),
                  blurRadius: 53,
                  color: Colors.black.withOpacity(0.05),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                nameLogo(ramz: 'ramz', logo: 'assets/ripple.gif'),
                const SizedBox(height: 15),
                const StockPrice(price: '4.53 Eg', change: '0.43%'),
                const SizedBox(height: 15),
                const DetailsChart(),
                const SizedBox(height: 15),
              ],
            ),
          ),
          const SizedBox(height: 15),
//! Container_2 (About) ********************************************
          aboutContainer(
            context,
            about:
                'Lorem ipsum dolor sit amet consectetur adipisicing elit. Id obcaecati velit eaque magnam illum, dolor quis assumenda autem itaque ullam. Impedit unde amet exercitationem, ducimus perferendis minus soluta voluptate ratione.',
          ),
          const SizedBox(height: 15),
//! Container_3 (News) ********************************************
          newsContainer(context, news: fakeNews),
//! Container_4 (AllCharts) ********************************************
          columnsChart(
              groupsData: incomeStatementData, chartName: 'Income Statement'),
          columnsChart(
              groupsData: balanceSheetData, chartName: 'Balance Sheet'),

          columnsChartWithLine(
              groupsData: divideData,
              chartName: 'Divide',
              dataSourceLine: salesData2),

          columnsChart(groupsData: revenueData, chartName: 'Revenue'),
          columnsChart(groupsData: earningData, chartName: 'Earning'),
        ]),
      ),
    );
  }

  Column cashFlow({required List<BarChart1> groupSalesData}) {
    return Column(children: [
      Row(
        children: const [
          Text(
            'سنوي',
            style: TextStyle(
              color: kPrimaryColor,
              fontSize: 20,
              // fontFamily: FontWeight.w600
            ),
          ),
          Spacer(),
          Text(
            'Cash Flow ',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              // fontFamily: FontWeight.w600
            ),
          ),
        ],
      ),
      SfCartesianChart(
        borderWidth: 0,
        borderColor: Colors.transparent,
        plotAreaBorderWidth: 0,
        //!
        legend: Legend(isVisible: true, position: LegendPosition.bottom),
        tooltipBehavior: TooltipBehavior(enable: true),
        series: <LineSeries>[
          for (var group in groupSalesData)
            LineSeries<SalesData, String>(
                dataSource: group.data,
                xValueMapper: (SalesData sales, _) => sales.month,
                yValueMapper: (SalesData sales, _) => sales.sales,
                name: group.name,
                enableTooltip: true,
                markerSettings: const MarkerSettings(isVisible: true)),
        ],
        primaryXAxis: CategoryAxis(
          isVisible: false,
        ),
        primaryYAxis: NumericAxis(
            isVisible: false,
            edgeLabelPlacement: EdgeLabelPlacement.shift,
            numberFormat:
                NumberFormat.simpleCurrency(decimalDigits: 1, name: 'B')),
      ),
    ]);
  }

  Column columnsChart(
      {required List<BarChart1> groupsData, required String chartName}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            const Text('سنوي',
                style: TextStyle(
                  color: Colors.orangeAccent,
                  fontSize: 20,
                  // fontFamily: FontWeight.w600
                )),
            const Spacer(),
            Text(
              chartName,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                // fontFamily: FontWeight.w600
              ),
            ),
          ],
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
                  color: (group.name == 'Total revenue') ||
                          (group.name == 'Total assets') ||
                          (group.name == 'Cash from operating activities') ||
                          (group.name == 'Reported' &&
                              groupsData == earningData)
                      ? const Color(0XFF448aff)
                      : (group.name == 'Gross profit') ||
                              (group.name == 'Total liabilities') ||
                              (group.name ==
                                  'Cash from investing activities') ||
                              (group.name == 'Reported' &&
                                  groupsData == revenueData)
                          ? const Color(0XFF4dd0e1)
                          : (group.name == 'Operating income') ||
                                  (group.name ==
                                      'Cash from financing activities') ||
                                  (group.name ==
                                      'Cash from financing activities')
                              ? const Color(0XFFf57f17)
                              : (group.name == 'Pretax income')
                                  ? const Color(0XFFb388ff)
                                  : (group.name == 'Net income')
                                      ? const Color(0XFFfbc02d)
                                      : const Color(0XFFe0e3eb)),
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

  Column columnsChartWithLine(
      {required List<BarChart1> groupsData,
      required String chartName,
      required List<SalesData> dataSourceLine}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            const Text('سنوي',
                style: TextStyle(
                  color: Colors.orangeAccent,
                  fontSize: 20,
                  // fontFamily: FontWeight.w600
                )),
            const Spacer(),
            Text(
              chartName,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                // fontFamily: FontWeight.w600
              ),
            ),
          ],
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

  Container newsContainer(BuildContext context, {required List<News> news}) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 21),
            blurRadius: 54,
            color: Colors.black.withOpacity(0.05),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "News",
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(color: kPrimaryColor, height: 1.2),
              ),
              const Icon(Icons.newspaper)
            ],
          ),
          NewsList(news: news // details.news!
              ),
        ],
      ),
    );
  }

  Container aboutContainer(BuildContext context, {required String about}) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 21),
            blurRadius: 54,
            color: Colors.black.withOpacity(0.05),
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "About ",
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(color: kPrimaryColor, height: 1.2),
              ),
              const Icon(Icons.location_city)
            ],
          ),
          const SizedBox(height: 10),
          // SvgPicture.asset("assets/icons/map.svg"),
          Text(
            // 'details.about.toString()',
            // 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Id obcaecati velit eaque magnam illum, dolor quis assumenda autem itaque ullam. Impedit unde amet exercitationem, ducimus perferendis minus soluta voluptate ratione.',
            about,
            style: const TextStyle(
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Row nameLogo({required String ramz, required String logo}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            ramz,
            style: const TextStyle(
              color: kTextMediumColor,
              fontWeight: FontWeight.w600,
              fontSize: 25,
            ),
          ),
        ),
        logoCircleAvatar(logo: logo),
      ],
    );
  }

  CircleAvatar logoCircleAvatar({required String logo}) {
    return CircleAvatar(
        radius: 30,
        backgroundColor: kPrimaryColor.withOpacity(0.5),
        child: Image.asset(
          logo,
          fit: BoxFit.cover,
        ));
  }
}

class DetailsChart extends StatelessWidget {
  const DetailsChart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                pointColorMapper: (SalesDataYear sales, _) => kPrimaryColor)
          ]),
    );
  }
}

class StockPrice extends StatelessWidget {
  final String price;
  final String change;
  const StockPrice({
    Key? key,
    required this.price,
    required this.change,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Directionality(
            textDirection: ui.TextDirection.ltr,
            child: Text(
              // details.stockMainApi!.incPercentage.toString(),
              // textDirection: TextDirection.ltr,
              ArabicNumbers().convert(change),
              // change.toString(),
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: change.contains('-') ? Colors.green : Colors.red,
                  // double.parse(change.substring(0, 3)) > 0? kPrimaryColor:
                  // Colors.green,
                  height: 1.2),
            ),
          ),
          //EGP
          const SizedBox(width: 16),

          Directionality(
            textDirection: ui.TextDirection.ltr,
            child: Align(
              alignment: Alignment.topLeft,
              child: RichText(
                  text: TextSpan(children: [
                TextSpan(
                  text: ArabicNumbers().convert(price),

                  // price.toString(),
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall!
                      .copyWith(color: kPrimaryColor, height: 1.2),
                ),
                // TextSpan(
                //   text: 'EGP',
                //   style: Theme.of(context)
                //       .textTheme
                //       .bodySmall!
                //       .copyWith(color: kPrimaryColor, height: 1.2),
                // ),
              ])),
            ),
          ),

          // const SizedBox(width: 16),

          // SvgPicture.asset("assets/icons/increase.svg")
        ],
      ),
    );
  }
}
