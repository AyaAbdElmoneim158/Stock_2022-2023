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
import 'package:app/models/sales_data_model.dart';
import 'package:app/modules/Navbar_pages/my_chart.dart';

import 'package:app/models/stock_model.dart';
import 'package:app/shared/components/components.dart';
import 'package:app/shared/cubit/cubit.dart';
import 'package:app/shared/cubit/states.dart';
import 'package:app/shared/styles/colors.dart';
import 'package:app/shared/styles/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

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
  const DetailNewsScreen({super.key, required this.ramz});
  final String ramz;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..fetchDetsils(ramz: ramz),
      //..fetchStockTimeline(ramz: ramz), //..getStockApiData(ramz: ramz),
      child: BlocConsumer<AppCubit, AppStates>(
          listener: (context, state) {},
          builder: (context, state) {
            final appCubit = AppCubit.get(context);
            final StockModelApi details = appCubit.details;
            final size = MediaQuery.of(context).size;

            return ConditionalBuilder(
              condition: state is! FetchDetailsLoadingState,
              builder: (context) => Scaffold(
                // resizeToAvoidBottomPadding: false,
                backgroundColor: kBackgroundColor,
                floatingActionButton: FloatingActionButton(
                  onPressed: () {},
                  child: const Text("See more"),
                ),
                appBar: AppBar(
                  backgroundColor: kBackgroundColor,
                  title: Text(r'${details.ramz}stock'),
                  titleTextStyle: kBodyText2,
                  leading: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: firstColor,
                    ),
                  ),
                ),

                body:
                    //  MyChart(ramz: ramz),

                    Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 25),
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
                              // buildCaseNumber(context),
                              Row(
                                children: <Widget>[
                                  Text(
                                    details.stockMainApi!.stockPrice.toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineLarge!
                                        .copyWith(
                                            color: kPrimaryColor, height: 1.2),
                                  ),
                                  Text(
                                    details.stockMainApi!.incPercentage
                                        .toString(),
                                    style:
                                        const TextStyle(color: kPrimaryColor),
                                  ),
                                  // SvgPicture.asset("assets/icons/increase.svg")
                                ],
                              ),
                              const SizedBox(height: 15),
                            ],
                          ),
                        ),
                        MyChart(ramz: ramz),
                        // const SizedBox(height: 20),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    "About ",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium!
                                        .copyWith(
                                            color: kPrimaryColor, height: 1.2),
                                  ),
                                  const Icon(Icons.location_city)
                                ],
                              ),
                              const SizedBox(height: 10),
                              // SvgPicture.asset("assets/icons/map.svg"),
                              Text(
                                details.about.toString(),
                                style: const TextStyle(
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
                                  .headlineMedium!
                                  .copyWith(color: kPrimaryColor, height: 1.2),
                            ),
                            const Icon(Iconsax.location)
                          ],
                        ),
                        NewsList(news: details.news!),
                      ],
                    ),
                  ),
                ),
              ),
              fallback: (context) => Container(
                  color: Colors.white,
                  child: Center(
                      child: Center(child: Image.asset('assets/ripple.gif')))),
            );
          }),
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
        // SvgPicture.asset("assets/icons/increase.svg")
      ],
    );
  }

  Row buildTitleWithMoreIcon() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            ramz,
            style: const TextStyle(
              color: kTextMediumColor,
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
          ),
        ),
        // SvgPicture.asset("assets/icons/more.svg")
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
