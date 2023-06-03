import 'package:app/modules/Navbar_pages/new_dash.dart';
import 'package:app/shared/cubit/cubit.dart';
import 'package:app/shared/cubit/states.dart';
import 'package:app/shared/styles/colors.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app/models/sales_data_model.dart';
import 'package:app/models/stock_model.dart';
import 'dart:async';
import 'dart:convert';

List<BarChart1> divideData = [
  BarChart1('Dividends per share', salesData5),
];
List<SalesData> salesData5 = [
  SalesData("2018", 19),
  SalesData("2019", 22),
  SalesData("2020", 35),
  SalesData("2021", 48),
  SalesData("2022", 44),
];

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  int currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          //3-> Timer to refersh every time
          AppCubit()
            // ..getData(ramz: 'abuk'),
            ..getDataTime(),

      // ..

      // ..getData(ramz: 'abuk'),
      //..fetchStockTimeline(ramz: 'abuk', period: 7),
      child: BlocConsumer<AppCubit, AppStates>(
          listener: (context, state) {},
          builder: (context, state) {
            final appCubit = AppCubit.get(context);
            final size = MediaQuery.of(context).size;
            final List<SalesData> chartData = AppCubit.get(context).chartData;
            return Scaffold(
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  appCubit.getDataTime();
                  appCubit.getPriceNo(id: '2023-04-24T11:52:05.533');
                  // appCubit.fetchStockTimeline(period: 7, ramz: 'abuk');
                },
                child: const Icon(Icons.search),
              ),
              body: Center(
                child: Column(
                  children: [
                    const SizedBox(height: 32),
                    Text(appCubit.testVal.toString()),
                    /*ConditionalBuilder(
                      condition: chartData.isNotEmpty,
                      builder: (context) => chartWithLine(
                          groupsData:
                              // divideBarChartData1
                              divideData,
                          // chartData,
                          chartName: 'Divide',
                          dataSourceLine: chartData),
                      fallback: (context) => Container(
                          color: Colors.white,
                          child: Center(
                              child: Center(
                                  child: Image.asset('assets/ripple.gif')))),
                    ),
                    AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        height: MediaQuery.of(context).size.height * 0.2,
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  currentIndex = 5;
                                  appCubit.fetchStockTimeline(
                                      period: 1825, ramz: 'abuk');
                                });
                              },
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 500),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 5.0, vertical: 5.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: currentIndex == 5
                                      ? const Color(0xff161b22)
                                      : const Color(0xff161b22)
                                          .withOpacity(0.0),
                                ),
                                child: Text(
                                  "5Y",
                                  style: TextStyle(
                                      color: currentIndex == 5
                                          ? Colors.blueGrey.shade200
                                          : Colors.blueGrey,
                                      fontSize: 20),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  currentIndex = 4;
                                  appCubit.fetchStockTimeline(
                                      period: 360, ramz: 'abuk');
                                });
                              },
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 500),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 5.0, vertical: 5.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: currentIndex == 4
                                      ? const Color(0xff161b22)
                                      : const Color(0xff161b22)
                                          .withOpacity(0.0),
                                ),
                                child: Text(
                                  "1Y",
                                  style: TextStyle(
                                      color: currentIndex == 4
                                          ? Colors.blueGrey.shade200
                                          : Colors.blueGrey,
                                      fontSize: 20),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  currentIndex = 3;
                                  appCubit.fetchStockTimeline(
                                      period: 180, ramz: 'abuk');
                                });
                              },
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 500),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 5.0, vertical: 5.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: currentIndex == 3
                                      ? const Color(0xff161b22)
                                      : const Color(0xff161b22)
                                          .withOpacity(0.0),
                                ),
                                child: Text(
                                  "6M",
                                  style: TextStyle(
                                      color: currentIndex == 3
                                          ? Colors.blueGrey.shade200
                                          : Colors.blueGrey,
                                      fontSize: 20),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  currentIndex = 2;
                                  appCubit.fetchStockTimeline(
                                      period: 30, ramz: 'abuk');
                                });
                              },
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 500),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 5.0, vertical: 5.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: currentIndex == 2
                                      ? const Color(0xff161b22)
                                      : const Color(0xff161b22)
                                          .withOpacity(0.0),
                                ),
                                child: Text(
                                  "1M",
                                  style: TextStyle(
                                      color: currentIndex == 2
                                          ? Colors.blueGrey.shade200
                                          : Colors.blueGrey,
                                      fontSize: 20),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  currentIndex = 1;
                                  appCubit.fetchStockTimeline(
                                      period: 7, ramz: 'abuk');
                                });
                              },
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 500),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 5.0, vertical: 5.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: currentIndex == 1
                                      ? const Color(0xff161b22)
                                      : const Color(0xff161b22)
                                          .withOpacity(0.0),
                                ),
                                child: Text(
                                  "1W",
                                  style: TextStyle(
                                      color: currentIndex == 1
                                          ? Colors.blueGrey.shade200
                                          : Colors.blueGrey,
                                      fontSize: 20),
                                ),
                              ),
                            ),
                          ],
                        )),
                        */
                    // Text()
                    StreamBuilder<StockModelApi>(
                        stream: appCubit.streamController.stream,
                        builder: (context, snapshot) {
                          debugPrint(snapshot.data.toString());
                          switch (snapshot.connectionState) {
                            case ConnectionState.waiting:
                              return Container(
                                  width: 50,
                                  color: Colors.white,
                                  child: Center(
                                      child: Image.asset(
                                          'assets/ripple.gif'))); //const Center(child: CircularProgressIndicator());
                            default:
                              if (snapshot.hasError) {
                                return const Text("Error...");
                              } else {
                                return Column(
                                  children: [
                                    Text(
                                        appCubit
                                            .dataModel.stockMainApi!.stockPrice!
                                            .split('')
                                            .reversed
                                            .join()
                                            .toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium!
                                            .copyWith(
                                                color: firstColor,
                                                fontWeight: FontWeight.w600)),
                                    Text(
                                        appCubit.dataModel.stockMainApi!
                                            .incPercentage!
                                            .split('')
                                            .reversed
                                            .join()
                                            .toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall!
                                            .copyWith(color: firstColor)),
                                  ],
                                );

                                // Price(snapshot.data!, context);
                              }
                          }
                        }

                        // Text(dataModel.price.toString(),style: Theme.of(context).textTheme.headline3,
                        )
                  ],
                ),
              ),
            );
          }),
    );
  }
}

// AnimatedContainer btnsChart(BuildContext context) {
//     return AnimatedContainer(
//           duration: const Duration(milliseconds: 500),
//           height: MediaQuery.of(context).size.height * 0.2,
//           padding: const EdgeInsets.all(20),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               GestureDetector(
//                 onTap: () {
//                   // price = jsonData[jsonData.length - 1]["Price"];
//                   // dateText = jsonData[jsonData.length - 1]["Date"];
//                   // var oldChange = jsonData[jsonData.length - 2]
//                   //         ["Change %"]
//                   //     .replaceAll("%", "");
//                   // oldChange = double.parse(oldChange);

//                   // chartData = [];
//                   // for (var i = 0; i < jsonData.length; i++) {
//                   //   var mapDay = jsonData[i];
//                   //   change = mapDay["Change %"].replaceAll("%", "");
//                   //   change = double.parse(change);
//                   //   double sales = mapDay[
//                   //       "Price"]; //*change /100 ; //* element["Change %"].toDouble();//.roundToDouble(); //is int ?element["Price"].toDouble():element["Price"]; //;
//                   //   final month = DateFormat("MM/dd/yyyy").parse(mapDay[
//                   //       "Date"]); //DateFormat.LLLL().format(DateTime.parse(element["Date"]));
//                   //   chartData.add(SalesData(month, sales));
//                   // }
//                   setState(() {
//                     // newChange = jsonData[0]["Price"] -
//                     //     jsonData[jsonData.length - 1]["Price"];
//                     // chartData = chartData.reversed.toList();
//                     currentIndex = 5;
//                   });
//                 },
//                 child: AnimatedContainer(
//                   duration: const Duration(milliseconds: 500),
//                   padding: const EdgeInsets.symmetric(
//                       horizontal: 5.0, vertical: 5.0),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                     color: currentIndex == 5
//                         ? const Color(0xff161b22)
//                         : const Color(0xff161b22).withOpacity(0.0),
//                   ),
//                   child: Text(
//                     "5Y",
//                     style: TextStyle(
//                         color: currentIndex == 5
//                             ? Colors.blueGrey.shade200
//                             : Colors.blueGrey,
//                         fontSize: 20),
//                   ),
//                 ),
//               ),
//               GestureDetector(
//                 onTap: () {
//                   price = jsonData[240]["Price"];
//                   dateText = jsonData[240]["Date"];
//                   // var oldChange =
//                   //     jsonData[480]["Change %"].replaceAll("%", "");
//                   // oldChange = double.parse(oldChange);

//                   chartData = [];
//                   for (var i = 0; i < 240; i++) {
//                     var mapDay = jsonData[i];
//                     change = mapDay["Change %"].replaceAll("%", "");
//                     change = double.parse(change);
//                     double sales = mapDay[
//                         "Price"]; //*change /100 ; //* element["Change %"].toDouble();//.roundToDouble(); //is int ?element["Price"].toDouble():element["Price"]; //;
//                     final month = DateFormat("MM/dd/yyyy").parse(mapDay[
//                         "Date"]); //DateFormat.LLLL().format(DateTime.parse(element["Date"]));
//                     chartData.add(SalesData(month, sales));
//                   }
//                   setState(() {
//                     newChange = jsonData[0]["Price"] - jsonData[241]["Price"];
//                     chartData = chartData.reversed.toList();
//                     currentIndex = 4;
//                   });
//                 },
//                 child: AnimatedContainer(
//                   duration: const Duration(milliseconds: 500),
//                   padding: const EdgeInsets.symmetric(
//                       horizontal: 5.0, vertical: 5.0),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                     color: currentIndex == 4
//                         ? const Color(0xff161b22)
//                         : const Color(0xff161b22).withOpacity(0.0),
//                   ),
//                   child: Text(
//                     "1Y",
//                     style: TextStyle(
//                         color: currentIndex == 4
//                             ? Colors.blueGrey.shade200
//                             : Colors.blueGrey,
//                         fontSize: 20),
//                   ),
//                 ),
//               ),
//               GestureDetector(
//                 onTap: () {
//                   price = jsonData[120]["Price"];
//                   dateText = jsonData[120]["Date"];
//                   // var oldChange =
//                   //     jsonData[220]["Change %"].replaceAll("%", "");
//                   // oldChange = double.parse(oldChange);

//                   chartData = [];
//                   for (var i = 0; i < 120; i++) {
//                     var mapDay = jsonData[i];
//                     change = mapDay["Change %"].replaceAll("%", "");
//                     change = double.parse(change);
//                     double sales = mapDay[
//                         "Price"]; //*change /100 ; //* element["Change %"].toDouble();//.roundToDouble(); //is int ?element["Price"].toDouble():element["Price"]; //;
//                     final month = DateFormat("MM/dd/yyyy").parse(mapDay[
//                         "Date"]); //DateFormat.LLLL().format(DateTime.parse(element["Date"]));
//                     chartData.add(SalesData(month, sales));
//                   }
//                   setState(() {
//                     newChange = jsonData[0]["Price"] - jsonData[121]["Price"];
//                     chartData = chartData.reversed.toList();
//                     currentIndex = 3;
//                   });
//                 },
//                 child: AnimatedContainer(
//                   duration: const Duration(milliseconds: 500),
//                   padding: const EdgeInsets.symmetric(
//                       horizontal: 5.0, vertical: 5.0),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                     color: currentIndex == 3
//                         ? const Color(0xff161b22)
//                         : const Color(0xff161b22).withOpacity(0.0),
//                   ),
//                   child: Text(
//                     "6M",
//                     style: TextStyle(
//                         color: currentIndex == 3
//                             ? Colors.blueGrey.shade200
//                             : Colors.blueGrey,
//                         fontSize: 20),
//                   ),
//                 ),
//               ),
//               GestureDetector(
//                 onTap: () {
//                   price = jsonData[23]["Price"];
//                   dateText = jsonData[23]["Date"];
//                   // var oldChange =
//                   //     jsonData[46]["Change %"].replaceAll("%", "");
//                   // oldChange = double.parse(oldChange);

//                   chartData = [];
//                   for (var i = 0; i < 23; i++) {
//                     var mapDay = jsonData[i];
//                     change = mapDay["Change %"].replaceAll("%", "");
//                     change = double.parse(change);
//                     double sales = mapDay[
//                         "Price"]; //*change /100 ; //* element["Change %"].toDouble();//.roundToDouble(); //is int ?element["Price"].toDouble():element["Price"]; //;
//                     final month = DateFormat("MM/dd/yyyy").parse(mapDay[
//                         "Date"]); //DateFormat.LLLL().format(DateTime.parse(element["Date"]));
//                     chartData.add(SalesData(month, sales));
//                   }
//                   setState(() {
//                     newChange = jsonData[0]["Price"] - jsonData[24]["Price"];
//                     chartData = chartData.reversed.toList();
//                     currentIndex = 2;
//                   });
//                 },
//                 child: AnimatedContainer(
//                   duration: const Duration(milliseconds: 500),
//                   padding: const EdgeInsets.symmetric(
//                       horizontal: 5.0, vertical: 5.0),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                     color: currentIndex == 2
//                         ? const Color(0xff161b22)
//                         : const Color(0xff161b22).withOpacity(0.0),
//                   ),
//                   child: Text(
//                     "1M",
//                     style: TextStyle(
//                         color: currentIndex == 2
//                             ? Colors.blueGrey.shade200
//                             : Colors.blueGrey,
//                         fontSize: 20),
//                   ),
//                 ),
//               ),
//               GestureDetector(
//                 onTap: () {
//                   price = jsonData[4]["Price"];
//                   dateText = jsonData[4]["Date"];
//                   // var oldChange =
//                   //     jsonData[8]["Change %"].replaceAll("%", "");
//                   // oldChange = double.parse(oldChange);
//                   chartData = [];
//                   for (var i = 0; i < 4; i++) {
//                     var mapDay = jsonData[i];
//                     change = mapDay["Change %"].replaceAll("%", "");
//                     change = double.parse(change);
//                     double sales = mapDay[
//                         "Price"]; //*change /100 ; //* element["Change %"].toDouble();//.roundToDouble(); //is int ?element["Price"].toDouble():element["Price"]; //;
//                     final month = DateFormat("MM/dd/yyyy").parse(mapDay[
//                         "Date"]); //DateFormat.LLLL().format(DateTime.parse(element["Date"]));
//                     chartData.add(SalesData(month, sales));
//                   }
//                   setState(() {
//                     newChange = jsonData[0]["Price"] - jsonData[5]["Price"];
//                     chartData = chartData.reversed.toList();
//                     currentIndex = 1;
//                   });
//                 },
//                 child: AnimatedContainer(
//                   duration: const Duration(milliseconds: 500),
//                   padding: const EdgeInsets.symmetric(
//                       horizontal: 5.0, vertical: 5.0),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                     color: currentIndex == 1
//                         ? const Color(0xff161b22)
//                         : const Color(0xff161b22).withOpacity(0.0),
//                   ),
//                   child: Text(
//                     "1W",
//                     style: TextStyle(
//                         color: currentIndex == 1
//                             ? Colors.blueGrey.shade200
//                             : Colors.blueGrey,
//                         fontSize: 20),
//                   ),
//                 ),
//               ),
//             ],
//           ));
//   }
