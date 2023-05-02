// /*import 'package:syncfusion_flutter_charts/charts.dart';
// import 'package:syncfusion_flutter_charts/sparkcharts.dart';
// import 'package:flutter/material.dart';

// class Test extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final List<SalesData2> chartData = [
//             SalesData2(2010 as DateTime, 35),
//             SalesData2(2011 as DateTime, 28),
//             SalesData2(2012 as DateTime, 34),
//             SalesData2(2013 as DateTime, 32),
//             SalesData2(2014 as DateTime, 40)
//         ];
//     return Scaffold(
//         body: Column(
//       children: [
//         SizedBox(
//           height: 200,
//           child:  SfCartesianChart(
//                         primaryXAxis: DateTimeAxis(),
//                         series: <ChartSeries>[
//                             // Renders line chart
//                             LineSeries<SalesData2, DateTime>(
//                                 dataSource: chartData,
//                                 xValueMapper: (SalesData2 sales, _) => sales.year,
//                                 yValueMapper: (SalesData2 sales, _) => sales.sales
//                             )
//                         ]
//                     ),),
//         SizedBox(
//             height: 200,
//             child: SfCartesianChart(
//                 primaryXAxis: CategoryAxis(),
//                 series: <LineSeries<SalesData, String>>[
//                   LineSeries<SalesData, String>(
//                       // Bind data source
//                       dataSource: <SalesData>[
//                         SalesData('Jan', 35),
//                         SalesData('Feb', 28),
//                         SalesData('Mar', 34),
//                         SalesData('Apr', 32),
//                         SalesData('May', 40)
//                       ],
//                       xValueMapper: (SalesData sales, _) => sales.year,
//                       yValueMapper: (SalesData sales, _) => sales.sales)
//                 ])),
//       ],
//     ));
//   }
// }

// class SalesData {
//   SalesData(this.year, this.sales);
//   final String year;
//   final double sales;
// }

// class SalesData2 {
//         SalesData2(this.year, this.sales);
//         final DateTime year;
//         final double sales;
//     }*/

// import 'package:flutter/material.dart';
// // import 'package:stock2/shared/components/csvjsonData.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';
// import 'package:intl/intl.dart';
// import 'package:app/modules/csvjsonData.dart';

// List<SalesData> chartData2 = [];
// dynamic dateText, price = 23.0, change, newChange = 0.0;
// List<SalesData> chartData = [
//   /* SalesData(DateTime(2006), 58),
//       SalesData(DateTime(2007), 36),
//       SalesData(DateTime(2008), 72),
//       SalesData(DateTime(2009), 50),
//       SalesData(DateTime(2010), 45),
//       SalesData(DateTime(2011), 28),
//       SalesData(DateTime(2012), 14),
//       SalesData(DateTime(2013), 32),
//       SalesData(DateTime(2014), 40),
//       SalesData(DateTime(2015), 35),
//       SalesData(DateTime(2016), 81),
//       SalesData(DateTime(2017), 24),
//       SalesData(DateTime(2018), 52),
//       SalesData(DateTime(2019), 60),*/
// ];

// class Test extends StatefulWidget {
//   String price_ = '0';
//   Test({Key? key, required String price_}) : super(key: key);

//   @override
//   State<Test> createState() => _TestState();
// }

// class _TestState extends State<Test> {
//   int currentIndex = 1;
//   @override
//   void initState() {
//     super.initState();
//     price = jsonData[4]["Price"];
//     dateText = jsonData[4]["Date"];
//     //DateFormat.yMMMd().format(DateTime.now())
//     // var oldChange = jsonData[8]["Change %"].replaceAll("%", "");
//     // oldChange = double.parse(oldChange);
//     for (var i = 0; i < 4; i++) {
//       var mapDay = jsonData[i];
//       change = mapDay["Change %"].replaceAll("%", "");
//       change = double.parse(change);
//       double sales = mapDay[
//           "Price"]; //*change /100 ; //* element["Change %"].toDouble();//.roundToDouble(); //is int ?element["Price"].toDouble():element["Price"]; //;
//       final month = DateFormat("MM/dd/yyyy").parse(mapDay[
//           "Date"]); //DateFormat.LLLL().format(DateTime.parse(element["Date"]));
//       chartData.add(SalesData(month, sales));
//     }
//     setState(() {
//       newChange = jsonData[0]["Price"] - jsonData[5]["Price"];
//       chartData = chartData.reversed.toList();
//       currentIndex = 1;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;

//     // Stream<String> priceStream() async* {
//     //   while (true) {
//     //     await Future.delayed(const Duration(milliseconds: 500));
//     //     String price = widget.price_;
//     //     print("I go to check,,,,");
//     //     yield price;
//     //   }
//     // }

//     return StreamBuilder(
//         stream: priceStream(),
//         builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
//           return Text("${widget.price_} ",
//               style: Theme.of(context).textTheme.headline5);
//         });
//   }
// }

// class SalesData {
//   SalesData(this.year, this.sales);
//   final DateTime year;
//   final double sales;
// }
// // Column(
// //       crossAxisAlignment: CrossAxisAlignment.start,
//       // mainAxisAlignment: MainAxisAlignment.center,
//   // /*    children: [
//   //       SizedBox(height: size.height * 0.03),
//   //       RichText(
//   //           text: TextSpan(children: [
//   //         TextSpan(
//   //             text: "EGP ",
//   //             style: Theme.of(context)
//   //                 .textTheme
//   //                 .headline4!
//   //                 .copyWith(color: Colors.black, fontWeight: FontWeight.w500)),
//   //         TextSpan(
//   //             text: "$dateText", style: Theme.of(context).textTheme.caption),
//   //       ])),
//   //       RichText(
//   //           text: TextSpan(children: [
//   //         //➚
//   //         newChange > 0
//   //             ? TextSpan(
//   //                 text: "EGP➚ ",
//   //                 style: Theme.of(context)
//   //                     .textTheme
//   //                     .bodyLarge!
//   //                     .copyWith(color: Colors.green))
//   //             : TextSpan(
//   //                 text: "EGP➘ ",
//   //                 style: Theme.of(context)
//   //                     .textTheme
//   //                     .bodyLarge!
//   //                     .copyWith(color: Colors.red)),
//   //         TextSpan(
//   //             text: "${newChange.toStringAsFixed(2)}%",
//   //             style: Theme.of(context).textTheme.bodyLarge!.copyWith(
//   //                 color: newChange > 0 ? Colors.green : Colors.red,
//   //                 fontWeight: FontWeight.w500)),
//   //       ])),
//   //       SizedBox(height: size.height * 0.03),
//   //       SizedBox(
//   //         height: 200,
//   //         child: SfCartesianChart(
//   //             tooltipBehavior: TooltipBehavior(
//   //               enable: true,
//   //               color: Color.fromRGBO(66, 244, 164, 1),
//   //               builder: (data, point, series, pointIndex, seriesIndex) {
//   //                 // debugPrint("data : ${DateFormat.y().format(data.year)} ${DateFormat.yMMMEd().format(data.year)}  \t ... ${data.sales} \n point : $point \n series : $series \n pointIndex : $pointIndex \n seriesIndex : $seriesIndex \n ");
//   //                 setState(() {
//   //                   dateText = DateFormat('MM/dd/yyyy').format(data.year);
//   //                   price = data.sales;
//   //                 });

//   //                 return SizedBox(
//   //                   width: 150,
//   //                   height: 30,
//   //                   child: Center(
//   //                       child: Text(
//   //                     //yMMMM
//   //                     "${DateFormat('MM/dd/yyyy').format(data.year)} : ${data.sales} ",
//   //                     // "${DateFormat.y().format(data.year)} : ${data.sales}\$ ",
//   //                     style: const TextStyle(color: Colors.white),
//   //                   )),
//   //                 );
//   //               },
//   //             ),
//   //             plotAreaBorderWidth: 0,
//   //             borderColor: Colors.transparent,
//   //             plotAreaBackgroundColor:Colors.green,
//   //             enableSideBySideSeriesPlacement: false,
//   //             primaryXAxis: DateTimeAxis(isVisible: false),
//   //             primaryYAxis: DateTimeAxis(isVisible: false),
//   //             series: <ChartSeries>[
//   //               // Renders line chart
//   //               LineSeries<SalesData, DateTime>(
//   //                   dataSource: chartData,
//   //                   xValueMapper: (SalesData sales, _) => sales.year,
//   //                   yValueMapper: (SalesData sales, _) => sales.sales,
//   //                   pointColorMapper: (SalesData sales, _) => Colors.amber),
//   //             ]),
//   //       ),
//   //       AnimatedContainer(
//   //           duration: const Duration(milliseconds: 500),
//   //           height: MediaQuery.of(context).size.height * 0.2,
//   //           padding: const EdgeInsets.all(20),
//   //           child: Row(
//   //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   //             children: [
//   //               GestureDetector(
//   //                 onTap: () {
//   //                   price = jsonData[jsonData.length - 1]["Price"];
//   //                   dateText = jsonData[jsonData.length - 1]["Date"];
//   //                   // var oldChange = jsonData[jsonData.length - 2]
//   //                   //         ["Change %"]
//   //                   //     .replaceAll("%", "");
//   //                   // oldChange = double.parse(oldChange);

//   //                   chartData = [];
//   //                   for (var i = 0; i < jsonData.length; i++) {
//   //                     var mapDay = jsonData[i];
//   //                     change = mapDay["Change %"].replaceAll("%", "");
//   //                     change = double.parse(change);
//   //                     double sales = mapDay[
//   //                         "Price"]; //*change /100 ; //* element["Change %"].toDouble();//.roundToDouble(); //is int ?element["Price"].toDouble():element["Price"]; //;
//   //                     final month = DateFormat("MM/dd/yyyy").parse(mapDay[
//   //                         "Date"]); //DateFormat.LLLL().format(DateTime.parse(element["Date"]));
//   //                     chartData.add(SalesData(month, sales));
//   //                   }
//   //                   setState(() {
//   //                     newChange = jsonData[0]["Price"] -
//   //                         jsonData[jsonData.length - 1]["Price"];
//   //                     chartData = chartData.reversed.toList();
//   //                     currentIndex = 5;
//   //                   });
//   //                 },
//   //                 child: AnimatedContainer(
//   //                   duration: const Duration(milliseconds: 500),
//   //                   padding: const EdgeInsets.symmetric(
//   //                       horizontal: 5.0, vertical: 5.0),
//   //                   decoration: BoxDecoration(
//   //                     borderRadius: BorderRadius.circular(10),
//   //                     color: currentIndex == 5
//   //                         ? const Color(0xff161b22)
//   //                         : const Color(0xff161b22).withOpacity(0.0),
//   //                   ),
//   //                   child: Text(
//   //                     "5Y",
//   //                     style: TextStyle(
//   //                         color: currentIndex == 5
//   //                             ? Colors.blueGrey.shade200
//   //                             : Colors.blueGrey,
//   //                         fontSize: 20),
//   //                   ),
//   //                 ),
//   //               ),
//   //               GestureDetector(
//   //                 onTap: () {
//   //                   price = jsonData[240]["Price"];
//   //                   dateText = jsonData[240]["Date"];
//   //                   // var oldChange =
//   //                   //     jsonData[480]["Change %"].replaceAll("%", "");
//   //                   // oldChange = double.parse(oldChange);

//   //                   chartData = [];
//   //                   for (var i = 0; i < 240; i++) {
//   //                     var mapDay = jsonData[i];
//   //                     change = mapDay["Change %"].replaceAll("%", "");
//   //                     change = double.parse(change);
//   //                     double sales = mapDay[
//   //                         "Price"]; //*change /100 ; //* element["Change %"].toDouble();//.roundToDouble(); //is int ?element["Price"].toDouble():element["Price"]; //;
//   //                     final month = DateFormat("MM/dd/yyyy").parse(mapDay[
//   //                         "Date"]); //DateFormat.LLLL().format(DateTime.parse(element["Date"]));
//   //                     chartData.add(SalesData(month, sales));
//   //                   }
//   //                   setState(() {
//   //                     newChange = jsonData[0]["Price"] - jsonData[241]["Price"];
//   //                     chartData = chartData.reversed.toList();
//   //                     currentIndex = 4;
//   //                   });
//   //                 },
//   //                 child: AnimatedContainer(
//   //                   duration: const Duration(milliseconds: 500),
//   //                   padding: const EdgeInsets.symmetric(
//   //                       horizontal: 5.0, vertical: 5.0),
//   //                   decoration: BoxDecoration(
//   //                     borderRadius: BorderRadius.circular(10),
//   //                     color: currentIndex == 4
//   //                         ? const Color(0xff161b22)
//   //                         : const Color(0xff161b22).withOpacity(0.0),
//   //                   ),
//   //                   child: Text(
//   //                     "1Y",
//   //                     style: TextStyle(
//   //                         color: currentIndex == 4
//   //                             ? Colors.blueGrey.shade200
//   //                             : Colors.blueGrey,
//   //                         fontSize: 20),
//   //                   ),
//   //                 ),
//   //               ),
//   //               GestureDetector(
//   //                 onTap: () {
//   //                   price = jsonData[120]["Price"];
//   //                   dateText = jsonData[120]["Date"];
//   //                   // var oldChange =
//   //                   //     jsonData[220]["Change %"].replaceAll("%", "");
//   //                   // oldChange = double.parse(oldChange);

//   //                   chartData = [];
//   //                   for (var i = 0; i < 120; i++) {
//   //                     var mapDay = jsonData[i];
//   //                     change = mapDay["Change %"].replaceAll("%", "");
//   //                     change = double.parse(change);
//   //                     double sales = mapDay[
//   //                         "Price"]; //*change /100 ; //* element["Change %"].toDouble();//.roundToDouble(); //is int ?element["Price"].toDouble():element["Price"]; //;
//   //                     final month = DateFormat("MM/dd/yyyy").parse(mapDay[
//   //                         "Date"]); //DateFormat.LLLL().format(DateTime.parse(element["Date"]));
//   //                     chartData.add(SalesData(month, sales));
//   //                   }
//   //                   setState(() {
//   //                     newChange = jsonData[0]["Price"] - jsonData[121]["Price"];
//   //                     chartData = chartData.reversed.toList();
//   //                     currentIndex = 3;
//   //                   });
//   //                 },
//   //                 child: AnimatedContainer(
//   //                   duration: const Duration(milliseconds: 500),
//   //                   padding: const EdgeInsets.symmetric(
//   //                       horizontal: 5.0, vertical: 5.0),
//   //                   decoration: BoxDecoration(
//   //                     borderRadius: BorderRadius.circular(10),
//   //                     color: currentIndex == 3
//   //                         ? const Color(0xff161b22)
//   //                         : const Color(0xff161b22).withOpacity(0.0),
//   //                   ),
//   //                   child: Text(
//   //                     "6M",
//   //                     style: TextStyle(
//   //                         color: currentIndex == 3
//   //                             ? Colors.blueGrey.shade200
//   //                             : Colors.blueGrey,
//   //                         fontSize: 20),
//   //                   ),
//   //                 ),
//   //               ),
//   //               GestureDetector(
//   //                 onTap: () {
//   //                   price = jsonData[23]["Price"];
//   //                   dateText = jsonData[23]["Date"];
//   //                   // var oldChange =
//   //                   //     jsonData[46]["Change %"].replaceAll("%", "");
//   //                   // oldChange = double.parse(oldChange);

//   //                   chartData = [];
//   //                   for (var i = 0; i < 23; i++) {
//   //                     var mapDay = jsonData[i];
//   //                     change = mapDay["Change %"].replaceAll("%", "");
//   //                     change = double.parse(change);
//   //                     double sales = mapDay[
//   //                         "Price"]; //*change /100 ; //* element["Change %"].toDouble();//.roundToDouble(); //is int ?element["Price"].toDouble():element["Price"]; //;
//   //                     final month = DateFormat("MM/dd/yyyy").parse(mapDay[
//   //                         "Date"]); //DateFormat.LLLL().format(DateTime.parse(element["Date"]));
//   //                     chartData.add(SalesData(month, sales));
//   //                   }
//   //                   setState(() {
//   //                     newChange = jsonData[0]["Price"] - jsonData[24]["Price"];
//   //                     chartData = chartData.reversed.toList();
//   //                     currentIndex = 2;
//   //                   });
//   //                 },
//   //                 child: AnimatedContainer(
//   //                   duration: const Duration(milliseconds: 500),
//   //                   padding: const EdgeInsets.symmetric(
//   //                       horizontal: 5.0, vertical: 5.0),
//   //                   decoration: BoxDecoration(
//   //                     borderRadius: BorderRadius.circular(10),
//   //                     color: currentIndex == 2
//   //                         ? const Color(0xff161b22)
//   //                         : const Color(0xff161b22).withOpacity(0.0),
//   //                   ),
//   //                   child: Text(
//   //                     "1M",
//   //                     style: TextStyle(
//   //                         color: currentIndex == 2
//   //                             ? Colors.blueGrey.shade200
//   //                             : Colors.blueGrey,
//   //                         fontSize: 20),
//   //                   ),
//   //                 ),
//   //               ),
//   //               GestureDetector(
//   //                 onTap: () {
//   //                   price = jsonData[4]["Price"];
//   //                   dateText = jsonData[4]["Date"];
//   //                   // var oldChange =
//   //                   //     jsonData[8]["Change %"].replaceAll("%", "");
//   //                   // oldChange = double.parse(oldChange);
//   //                   chartData = [];
//   //                   for (var i = 0; i < 4; i++) {
//   //                     var mapDay = jsonData[i];
//   //                     change = mapDay["Change %"].replaceAll("%", "");
//   //                     change = double.parse(change);
//   //                     double sales = mapDay[
//   //                         "Price"]; //*change /100 ; //* element["Change %"].toDouble();//.roundToDouble(); //is int ?element["Price"].toDouble():element["Price"]; //;
//   //                     final month = DateFormat("MM/dd/yyyy").parse(mapDay[
//   //                         "Date"]); //DateFormat.LLLL().format(DateTime.parse(element["Date"]));
//   //                     chartData.add(SalesData(month, sales));
//   //                   }
//   //                   setState(() {
//   //                     newChange = jsonData[0]["Price"] - jsonData[5]["Price"];
//   //                     chartData = chartData.reversed.toList();
//   //                     currentIndex = 1;
//   //                   });
//   //                 },
//   //                 child: AnimatedContainer(
//   //                   duration: const Duration(milliseconds: 500),
//   //                   padding: const EdgeInsets.symmetric(
//   //                       horizontal: 5.0, vertical: 5.0),
//   //                   decoration: BoxDecoration(
//   //                     borderRadius: BorderRadius.circular(10),
//   //                     color: currentIndex == 1
//   //                         ? const Color(0xff161b22)
//   //                         : const Color(0xff161b22).withOpacity(0.0),
//   //                   ),
//   //                   child: Text(
//   //                     "1W",
//   //                     style: TextStyle(
//   //                         color: currentIndex == 1
//   //                             ? Colors.blueGrey.shade200
//   //                             : Colors.blueGrey,
//   //                         fontSize: 20),
//   //                   ),
//   //                 ),
//   //               ),
//   //             ],
//   //           )),
//   //     ],
//   //   );
//   //   */