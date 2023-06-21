import 'dart:ui' as ui;

import 'package:app/models/sales_data_model.dart';
import 'package:app/models/stock_model.dart';
import 'package:app/modules/Navbar_pages/real_time.dart';
import 'package:app/modules/test_page.dart';
import 'package:app/shared/components/components.dart';
import 'package:app/shared/components/constants.dart';
import 'package:app/shared/cubit/cubit.dart';
import 'package:app/shared/cubit/states.dart';
import 'package:app/shared/router/routes.dart';
import 'package:app/shared/styles/colors.dart';
import 'package:app/shared/styles/style.dart';
import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

ArabicNumbers arabicNumber = ArabicNumbers();
// arabicNumber.convert(7);

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
      create: (context) => AppCubit()..fetchDetails(ramz: ramz),
      // ..fetchStockTimeline(), //..getStockApiData(ramz: ramz),//ramz: ramz
      child: BlocConsumer<AppCubit, AppStates>(
          listener: (context, state) {},
          builder: (context, state) {
            final appCubit = AppCubit.get(context);
            final StockModelApi details = appCubit.details;
            final size = MediaQuery.of(context).size;
            var stockNoController = TextEditingController();
            var stockPriceController = TextEditingController();
            return ConditionalBuilder(
              condition: state is! FetchDetailsLoadingState,
              builder: (context) => Scaffold(
                // resizeToAvoidBottomPadding: false,
                backgroundColor: AppColors.kBackgroundColor,
                floatingActionButton: FloatingActionButton(
                  onPressed: () {
                    navigatorTo(
                        context: context,
                        routeName: AppRoutes.dashStockRoute,
                        arguments: details.ramz);
                  },
                  child: const Align(child: Text("Charts")),
                ),
                appBar: AppBar(
                  backgroundColor: AppColors.kBackgroundColor,
                  // title: Text(details.ramz.toString()),
                  titleTextStyle: AppTextStyles.kBodyText2,
                  leading: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: AppColors.firstColor,
                    ),
                  ),
                  actions: [
                    bookmarkIcon(appCubit, details, stockPriceController,
                        stockNoController),
                    // followIcon(appCubit, details, stockNoController, size, stockPriceController),
                  ],
                ),

                body:
                    //  MyChart(ramz: ramz),

                    Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        //! Container_1*********************************************
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
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                    radius: 20,
                                    child: SvgPicture.network(
                                      details.logo.toString(),
                                      width: 50,
                                    ),
                                  ),
                                  // const Spacer(),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          //stockAtSector.symbol

                                          Text(details.ramz.toString(),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall!
                                                  .copyWith(
                                                      color: AppColors
                                                          .kTextLightColor,
                                                      fontWeight:
                                                          FontWeight.w400)),
                                          Text(details.name.toString(),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium!
                                                  .copyWith(
                                                      color:
                                                          AppColors.firstColor,
                                                      fontWeight:
                                                          FontWeight.w500)),
                                        ]),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 32),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Coin(
                                    ramz: details.ramz.toString(),
                                    lastPrice: details.stockMainApi!.stockPrice
                                        .toString(),
                                  ),
                                  followIcon(
                                      appCubit,
                                      details,
                                      stockNoController,
                                      size,
                                      stockPriceController),
                                ],
                              ),
                              const SizedBox(height: 15),
                              TestPage(ramz: details.ramz.toString()),
                              const SizedBox(height: 15),
                            ],
                          ),
                        ),
                        const SizedBox(height: 15),
                        //! Container_2 (About) ********************************************
                        aboutContainer(context,
                            about: details.about.toString()),
                        const SizedBox(height: 15),
                        //! Container_3 (News) ********************************************
                        newsContainer(context, news: details.news!),
                      ],
                    ),
                  ),
                ),
              ),
              fallback: (context) => Container(
                  width: 50,
                  color: Colors.white,
                  child: Center(
                      child: Center(child: Image.asset('assets/ripple.gif')))),
            );
          }),
    );
  }
}
