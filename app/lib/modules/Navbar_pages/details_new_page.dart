// import 'package:flutter/material.dart';

// class DetailsScreen extends StatelessWidget {
//   const DetailsScreen({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
//
// import 'package:covid_19/constants.dart';
import 'package:app/models/salesData_model.dart';
import 'package:app/shared/components/components.dart';
import 'package:app/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

List<SalesData> salesData = [
  SalesData("Q2'21", 35),
  SalesData("Q3'21", 28),
  SalesData("Q4'21", 34),
  SalesData("Q1'22", 28),
  SalesData("Q2'22", 34),
];
late List<BarChart> incomeBarChartData1 = [
  BarChart('الإيرادات', salesData),
];

class DetailNewsScreen extends StatelessWidget {
  const DetailNewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomPadding: false,
      appBar: buildDetailsAppBar(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
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
                    buildTitleWithMoreIcon(),
                    const SizedBox(height: 15),
                    buildCaseNumber(context),
                    const SizedBox(height: 15),
                    // const Test(),
                    // Container(
                    //   // color: Colors.red,
                    //   child: SfCartesianChart(
                    //     //! --------------------------SfCartesianChart
                    //     legend: Legend(
                    //         isVisible: true, position: LegendPosition.bottom),
                    //     tooltipBehavior: TooltipBehavior(enable: true),
                    //     series: <CartesianSeries>[
                    //       for (var group in incomeBarChartData1)
                    //         ColumnSeries<SalesData1, String>(
                    //             dataSource: group.data,
                    //             xValueMapper: (SalesData1 sales, _) =>
                    //                 sales.month,
                    //             yValueMapper: (SalesData1 sales, _) =>
                    //                 sales.sales,
                    //             borderRadius: BorderRadius.circular(8.0),
                    //             name: group.name,
                    //             enableTooltip: true,
                    //             spacing: 0.3),
                    //     ],
                    //     // primaryXAxis: CategoryAxis(),
                    //     // primaryYAxis: NumericAxis(
                    //     //     edgeLabelPlacement: EdgeLabelPlacement.shift,
                    //     //     numberFormat: NumberFormat.simpleCurrency(
                    //     //         decimalDigits: 2, name: 'B')),
                    //     plotAreaBorderWidth: 0,
                    //     borderColor: Colors.transparent,
                    //     // plotAreaBackgroundColor:Colors.green,
                    //     enableSideBySideSeriesPlacement: false,
                    //     primaryXAxis: DateTimeAxis(isVisible: false),
                    //     primaryYAxis: DateTimeAxis(isVisible: false),
                    //   ),
                    // )
                    // Test(),
                    // const Text(
                    //   "From Health Center",
                    //   style: TextStyle(
                    //     fontWeight: FontWeight.w200,
                    //     color: kTextMediumColor,
                    //     fontSize: 16,
                    //   ),
                    // ),
                    // const SizedBox(height: 15),
                    // // WeeklyChart(),
                    // const SizedBox(height: 15),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: <Widget>[
                    //     buildInfoTextWithPercentage(
                    //       percentage: "6.43",
                    //       title: "From Last Week",
                    //     ),
                    //     buildInfoTextWithPercentage(
                    //       percentage: "9.43",
                    //       title: "Recovery Rate",
                    //     ),
                    //   ],
                    // )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
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
                              .headline5!
                              .copyWith(color: kPrimaryColor, height: 1.2),
                        ),
                        const Icon(Iconsax.location)
                      ],
                    ),
                    const SizedBox(height: 10),
                    // SvgPicture.asset("assets/icons/map.svg"),
                    const Text(
                      "Nowadays, making printed materials have become fast, easy and simple. If you want your promotional material to be an eye-catching object, you should make it colored. By way of using inkjet printer this is not hard to make. An inkjet printer is any printer that places extremely small droplets of ink onto paper to create an image.",
                      style: TextStyle(
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "News",
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(color: kPrimaryColor, height: 1.2),
                  ),
                  const Icon(Iconsax.location)
                ],
              ),
              const ItemList(),
            ],
          ),
        ),
      ),
    );
  }

  RichText buildInfoTextWithPercentage(
      {required String title, required String percentage}) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: "$percentage% \n",
            style: TextStyle(
              fontSize: 20,
              color: kPrimaryColor,
            ),
          ),
          TextSpan(
            text: title,
            style: const TextStyle(
              color: kTextMediumColor,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Row buildCaseNumber(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(
          "5.47 ",
          style: Theme.of(context)
              .textTheme
              .headline2!
              .copyWith(color: kPrimaryColor, height: 1.2),
        ),
        Text(
          "5.9% ",
          style: TextStyle(color: kPrimaryColor),
        ),
        SvgPicture.asset("assets/icons/increase.svg")
      ],
    );
  }

  Row buildTitleWithMoreIcon() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        const Text(
          "We",
          style: TextStyle(
            color: kTextMediumColor,
            fontWeight: FontWeight.w600,
            fontSize: 15,
          ),
        ),
        SvgPicture.asset("assets/icons/more.svg")
      ],
    );
  }

  AppBar buildDetailsAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: kBackgroundColor,
      elevation: 0,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: kPrimaryColor,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: <Widget>[
        IconButton(
          icon: SvgPicture.asset("assets/icons/search.svg"),
          onPressed: () {},
        ),
      ],
    );
  }
}
