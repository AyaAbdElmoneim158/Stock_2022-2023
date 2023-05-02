import 'package:app/shared/components/components.dart';
import 'package:app/shared/cubit/cubit.dart';
import 'package:app/shared/cubit/states.dart';
import 'package:app/shared/router/routes.dart';
import 'package:app/shared/styles/colors.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app/models/stock_model.dart';
import 'package:app/modules/test_chart.dart';

import 'package:app/shared/components/constants.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

class DetailsStock extends StatelessWidget {
  final String ramz;
  const DetailsStock({super.key, required this.ramz});

  @override
  Widget build(BuildContext context) {
    var stockNoController = TextEditingController();
    var stockPriceController = TextEditingController();

    return BlocProvider(
      create: (context) => AppCubit()
        ..getStockApiData(context, ramz)
        // ..stocksAtFavStream(ramz: ramz),
        ..stocksAtFollowStream(ramz: ramz),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {
          if (state is AddArrowToFavSuccessState) {
            final snackBar = SnackBar(
                elevation: 0,
                behavior: SnackBarBehavior.floating,
                backgroundColor: Colors.transparent,
                content: AwesomeSnackbarContent(
                  title: 'Success..!',
                  message: "Stock is added to fav-arrows...! ",
                  contentType: ContentType.success,
                ));
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(snackBar);
          }
          if (state is AddArrowToFollowSuccessState) {
            final snackBar = SnackBar(
                elevation: 0,
                behavior: SnackBarBehavior.floating,
                backgroundColor: Colors.transparent,
                content: AwesomeSnackbarContent(
                  title: 'Success..!',
                  message: "Stock is added to follow-arrows...! ",
                  contentType: ContentType.success,
                ));
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(snackBar);
          }

          if (state is RemoveArrowToFavSuccessState) {
            final snackBar = SnackBar(
                elevation: 0,
                behavior: SnackBarBehavior.floating,
                backgroundColor: Colors.transparent,
                content: AwesomeSnackbarContent(
                  title: 'warning..!',
                  message: "Stock is remove to fav-arrows...! ",
                  contentType: ContentType.warning,
                ));
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(snackBar);
          } //
          if (state is RemoveArrowToFollowSuccessState) {
            final snackBar = SnackBar(
                elevation: 0,
                behavior: SnackBarBehavior.floating,
                backgroundColor: Colors.transparent,
                content: AwesomeSnackbarContent(
                  title: 'warning..!',
                  message: "Stock is remove to follow-arrows...! ",
                  contentType: ContentType.warning,
                ));
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(snackBar);
          }
        },
        builder: (context, state) {
          final appCubit = AppCubit.get(context);
          Map<String, dynamic> stockApiDataMap = appCubit.stockApiDataMap;
          final size = MediaQuery.of(context).size;

          return ConditionalBuilder(
            condition: state is! GetStockApiDatawLoadingState,
            builder: (context) => Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                leading: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: firstColor,
                  ),
                ),
                actions: [
                  StreamBuilder<List<StockModle>>(
                      stream: appCubit.stocksAtFavStream(
                          ramz: stockApiDataMap["ramz"]),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.active) {
                          final stock = snapshot.data;
                          debugPrint(stock.runtimeType.toString());
                          if (stock!.isEmpty) {
                            return IconButton(
                                onPressed: () {
                                  StockModle stockModle = StockModle(
                                    id: docmentIdFormLocationData(),
                                    logo: stockApiDataMap["logo"],
                                    name: stockApiDataMap["name"],
                                    price: stockApiDataMap["price"],
                                    ramz: stockApiDataMap["ramz"],
                                    stocksNo: "0",
                                  );
                                  appCubit.addArrowToFavoriteArrow(stockModle);
                                },
                                icon: const Icon(
                                  Icons.favorite,
                                  color: firstColor,
                                ));
                          } else {
                            return IconButton(
                                onPressed: () {
                                  appCubit.deleteFavoriteArrow(
                                      id: stock[0]
                                          .id); //! remove to fav with message
                                },
                                icon: const Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                ));
                          }
                        } else {
                          return IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.favorite,
                                color: firstColor,
                              ));
                        }
                      }),
                  StreamBuilder<List<StockModle>>(
                      stream: appCubit.stocksAtFollowStream(
                          ramz: stockApiDataMap["ramz"]),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.active) {
                          final stock = snapshot.data;
                          // debugPrint(stock![0].id.toString());
                          debugPrint(stock.runtimeType.toString());
                          if (stock!.isEmpty) {
                            return IconButton(
                                onPressed: () {
                                  //! pop....
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          // title: Text("Success"),
                                          content: SizedBox(
                                            // color: Colors.blueGrey,
                                            height: 250,
                                            child: Form(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Column(
                                                  children: [
                                                    defaultField(
                                                        hintText:
                                                            "Enter stock number....",
                                                        labelText:
                                                            "stock number",
                                                        controller:
                                                            stockNoController,
                                                        validator: (val) => val!
                                                                .isEmpty
                                                            ? "Enter stock number"
                                                            : null,
                                                        onChanged: (val) =>
                                                            appCubit
                                                                .changeStockNo(
                                                                    val)),
                                                    SizedBox(
                                                        height:
                                                            size.height * 0.03),
                                                    defaultField(
                                                        hintText:
                                                            "Enter stock price....",
                                                        labelText:
                                                            "stock price",
                                                        controller:
                                                            stockPriceController,
                                                        validator: (val) => val!
                                                                .isEmpty
                                                            ? "Enter stock price"
                                                            : null,
                                                        onChanged: (val) =>
                                                            appCubit
                                                                .changeStockPrice(
                                                                    val)),
                                                    SizedBox(
                                                        height:
                                                            size.height * 0.03),
                                                    defaultButton(
                                                        text: "Follow",
                                                        onPressed: () {
                                                          //!.........................Added Here
                                                          // debugPrint(stockPriceController.text);
                                                          // debugPrint(stockNoController.text);
                                                          StockModle
                                                              stockModle =
                                                              StockModle(
                                                            id: docmentIdFormLocationData(),
                                                            logo:
                                                                stockApiDataMap[
                                                                    "logo"],
                                                            name:
                                                                stockApiDataMap[
                                                                    "name"],
                                                            price:
                                                                stockPriceController
                                                                    .text,
                                                            ramz:
                                                                stockApiDataMap[
                                                                    "ramz"],
                                                            stocksNo:
                                                                stockNoController
                                                                    .text,
                                                          );
                                                          appCubit
                                                              .addArrowToFollowingArrow(
                                                                  stockModle);
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        context: context)
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      });
                                  // StockModle stockModle = StockModle(
                                  //   id: docmentIdFormLocationData(),
                                  //   logo: stockApiDataMap["logo"],
                                  //   name: stockApiDataMap["name"],
                                  //   price: stockApiDataMap["price"],
                                  //   ramz: stockApiDataMap["ramz"],
                                  //   stocksNo: "0",
                                  // );
                                  // appCubit.addArrowToFollowingArrow(stockModle);
                                },
                                icon: const Icon(
                                  Icons.autorenew,
                                  color: firstColor,
                                ));
                          } else {
                            return IconButton(
                                onPressed: () {
                                  appCubit.deleteFollowingArrow(
                                      id: stock[0]
                                          .id); //! remove to fav with message
                                },
                                icon: const Icon(
                                  Icons.autorenew,
                                  color: Colors.green,
                                ));
                          }
                        } else {
                          return IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.autorenew,
                                color: firstColor,
                              ));
                        }
                      }),
                ],
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Center(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            // data["ramz"]
                            "${stockApiDataMap["name"]}",
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .copyWith(color: firstColor),
                          ),
                          Text('${stockApiDataMap["ramz"]}',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(color: secondColor)),
                          // Divider(
                          //   thickness: 1.7,
                          //   color: Colors.grey.shade300,
                          // ),
                          // SizedBox(height: size.height * 0.01),
                          const Test(),
                          // Test(),
                          SizedBox(height: size.height * 0.01),

                          InkWell(
                              onTap: () =>
                                  Navigator.of(context, rootNavigator: false)
                                      .pushNamed(AppRoutes.moreChatsRoute),
                              child: Align(
                                child: Text(
                                  "See more chats",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall!
                                      .copyWith(color: secondColor),
                                ),
                              )),
                          SizedBox(height: size.height * 0.01),
                          Divider(
                            thickness: 1.7,
                            color: Colors.grey.shade300,
                          ),
                          Text("• نبذة ",
                              style:
                                  Theme.of(context).textTheme.headlineMedium),
                          SizedBox(height: size.height * 0.01),
                          Text('${stockApiDataMap["about"]}',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                      color: textColor.withOpacity(0.7),
                                      fontWeight: FontWeight.w600)),
                          Divider(
                            thickness: 1.7,
                            color: Colors.grey.shade300,
                          ),

                          SizedBox(height: size.height * 0.01),
                          Text('• أخبار ',
                              style:
                                  Theme.of(context).textTheme.headlineMedium),
                          SizedBox(height: size.height * 0.01),
                          SizedBox(
                            height: 500,
                            child: ListView.separated(
                                itemBuilder: (context, index) => InkWell(
                                      // onTap: () => WebView(),
                                      child: NewsCard(
                                          index: index,
                                          stockApiDataMap: stockApiDataMap,
                                          size: size),
                                    ),
                                separatorBuilder: (context, index) =>
                                    const SizedBox(height: 8),
                                itemCount: 5
                                // stockApiDataMap["news"].length
                                ),
                          )
                        ]),
                  ),
                ),
              ),
            ),
            fallback: (context) => Container(
                color: Colors.white,
                child: Center(child: Image.asset('assets/ripple.gif'))),
          );
        },
      ),
    );
  }
}

class NewsCard extends StatelessWidget {
  const NewsCard(
      {super.key,
      required this.stockApiDataMap,
      required this.size,
      required this.index});

  final Map<String, dynamic> stockApiDataMap;
  final Size size;
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context, rootNavigator: false).pushNamed(
          AppRoutes.newsUrlRoute,
          arguments: stockApiDataMap["news"][index]["link"]),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${stockApiDataMap["news"][index]["title"]}',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              SizedBox(height: size.height * 0.01),
              Text('${stockApiDataMap["news"][index]["des"]}',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: textColor.withOpacity(0.7),
                      fontWeight: FontWeight.w600)),
            ],
          ),
        ),
      ),
    );
  }
}
