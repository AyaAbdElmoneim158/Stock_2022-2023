// import 'dart:async';
// import 'dart:convert';

// import 'package:app/shared/styles/colors.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class DataModel {
//   String? about;
//   String? logo;
//   String? name;
//   String? ramz;
//   String? price;
//   DataModel.fromJson(Map<String, dynamic> json)
//       : price = json['price'],
//         about = json["about"],
//         logo = json["logo"],
//         name = json["name"],
//         ramz = json["ramz"];
//   Map<String, dynamic> toJson() => {
//         'price': price,
//         'about': about,
//         'logo': logo,
//         'name': name,
//         'ramz': ramz,
//       };
// }

// class Coin extends StatefulWidget {
//   final String ramz;
//   String lastPrice = "";
//   Coin({super.key, required this.ramz, required this.lastPrice});
//   static String newPrice = "0.0";
//   @override
//   State<Coin> createState() => _CoinState();
// }

// class _CoinState extends State<Coin> {
//   //1-> Create Stream Controler
//   StreamController<String> streamController = StreamController();

//   @override
//   void dispose() {
//     super.dispose();
//     streamController.close();
//   }

//   @override
//   void initState() {
//     super.initState();
//     getData();
//     //3-> Timer to refersh every time
//     Timer.periodic(const Duration(minutes: 1), (timer) {
//       debugPrint("get data at :  ${DateTime.now().toString()}");
//       getData();
//     });
//   }

// //2-> Get Data From Api
//   Future<void> getData() async {
//     var url = Uri.parse(
//         // "https://scrap-29ek.onrender.com/stock/${widget.ramz}"
//         "https://20mccck65d.execute-api.ap-northeast-1.amazonaws.com/?stock=ABUK-0");
//     final res = await http.get(url);
//     var dataBody = json.decode(res.body);
//     debugPrint("Coin.... ${dataBody["stock_main"]["stock_price"].toString()}");
//     Coin.newPrice = dataBody["stock_main"]["stock_price"];
//     debugPrint("Coin.newPrice.... ${Coin.newPrice}");
//     // dataBody = {};
//     // DataModel dataModel = DataModel.fromJson(dataBody);
//     // streamController.sink.add(Coin.newPrice);
//     // debugPrint("data: ${dataModel.toString()}");
//   }

//   @override
//   Widget build(BuildContext context) {
//     // 4-> build Stream
//     return StreamBuilder<String>(
//         stream: streamController.stream,
//         builder: (context, snapshot) {
//           switch (snapshot.connectionState) {
//             case ConnectionState.waiting:
//               return Text(Coin
//                   .newPrice); //const Center(child: CircularProgressIndicator());
//             default:
//               if (snapshot.hasError) {
//                 return const Text("Error...");
//               } else {
//                 //  widget.lastPrice = snapshot.data!.price!;
//                 Coin.newPrice = snapshot.data!;
//                 return Text(Coin.newPrice,
//                     //snapshot.data!.price.toString(),
//                     style: Theme.of(context)
//                         .textTheme
//                         .bodySmall!
//                         .copyWith(color: whiteColor));
//                 // Price(snapshot.data!, context);
//               }
//           }
//         }

//         // Text(dataModel.price.toString(),style: Theme.of(context).textTheme.headline3,
//         );
//   }
// }

// // Text Price(DataModel dataModel, BuildContext context) {
// //   // static pr;
// //   String pr = dataModel.price.toString();
// //   // Key textKey = Valuekey(pr);
// //   return Text(
// //     pr,
// //     key:
// //         Key(dataModel.price.toString()), //Valuekey(dataModel.price.toString()),
// //     style: Theme.of(context).textTheme.bodySmall!.copyWith(color: whiteColor),
// //   );
// // }

//4.87 -> 4.77 -> 4,80
import 'dart:async';
import 'dart:convert';

import 'package:app/models/stock_model.dart';
import 'package:app/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// import 'package:fabexdateformatter/fabexdateformatter.dart';

class DataModel {
  String? about;
  String? logo;
  String? name;
  String? ramz;
  String? price;
  DataModel.fromJson(Map<String, dynamic> json)
      : price = json['price'],
        about = json["about"],
        logo = json["logo"],
        name = json["name"],
        ramz = json["ramz"];
  Map<String, dynamic> toJson() => {
        'price': price,
        'about': about,
        'logo': logo,
        'name': name,
        'ramz': ramz,
      };
}

StockModelApi dataModel = StockModelApi();

class Coin extends StatefulWidget {
  final String ramz;
  final String lastPrice;
  const Coin({super.key, required this.ramz, required this.lastPrice});

  @override
  State<Coin> createState() => _CoinState();
}

class _CoinState extends State<Coin> {
  //1-> Create Stream Controler
  StreamController<StockModelApi> streamController = StreamController();

  @override
  void dispose() {
    super.dispose();
    streamController.close();
  }

  @override
  void initState() {
    super.initState();
    getData(ramz: widget.ramz);
    //3-> Timer to refersh every time
    Timer.periodic(const Duration(minutes: 5), (timer) {
      debugPrint("get data at :  ${DateTime.now().toString()}");
      getData(ramz: widget.ramz);
    });
  }

//2-> Get Data From Api
  Future<void> getData({required String ramz}) async {
    var url = Uri.parse(
        "https://20mccck65d.execute-api.ap-northeast-1.amazonaws.com/?stock=$ramz-0");
    final res = await http.get(url);
    final dataBody = json.decode(res.body);
    // StockModelApi
    dataModel = StockModelApi.fromJson(dataBody);
    // DataModel dataModel = DataModel.fromJson(dataBody);
    streamController.sink.add(dataModel);
    debugPrint("data: ${dataModel.stockMainApi!.stockPrice.toString()}");
  }

  @override
  Widget build(BuildContext context) {
    // 4-> build Stream
    return StreamBuilder<StockModelApi>(
        stream: streamController.stream,
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
                    // Text(dataModel.stockMainApi!.stockPrice.toString(),
                    //     style: Theme.of(context).textTheme.titleMedium),
                    Text(
                        // ArabicNumbers().convert(double.parse(dataModel.stockMainApi!.stockPrice) ).toString(),
                        dataModel.stockMainApi!.stockPrice.toString(),
                        // 'stockAtSector.change100',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                color: firstColor,
                                fontWeight: FontWeight.w600)),
                    Text(dataModel.stockMainApi!.incPercentage.toString(),
                        // 'stockAtSector.change',
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
        );
  }
}

Widget Price(StockModelApi dataModel, BuildContext context) {
  return Text(
    dataModel.ramz.toString(),
    style: Theme.of(context).textTheme.bodySmall,
  );
}
