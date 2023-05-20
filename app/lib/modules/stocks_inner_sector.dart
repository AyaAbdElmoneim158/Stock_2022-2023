import 'package:app/models/sector_model.dart';
import 'package:app/models/stock_model.dart';
import 'package:app/shared/cubit/cubit.dart';
import 'package:app/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:app/shared/components/components.dart';
import 'package:app/shared/router/routes.dart';
import 'package:app/shared/styles/colors.dart';

class StocksInnerSectot extends StatelessWidget {
  const StocksInnerSectot({super.key, required this.sectorName});
  final String sectorName;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          AppCubit appCubit = AppCubit.get(context);

          return Scaffold(
            backgroundColor: Colors.white,
            // extendBodyBehindAppBar: true,
            appBar: AppBar(
              title: Text(
                sectorName,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              leading: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton(
                onPressed: () {
                  // appCubit.fetchStockInnerSector();
                },
                child: const Icon(Icons.search)),
            body: false //appCubit.allStockInnerSector.isEmpty
                ? Container(
                    color: Colors.white,
                    child: Center(child: Image.asset('assets/ripple.gif')))
                : SizedBox(
                    height: 800,
                    child: ListView.builder(
                        itemCount: 33, //appCubit.allStockInnerSector.length,
                        itemBuilder: (context, index) => Container(
                              height: 100,
                              padding: const EdgeInsets.all(16),
                              margin: const EdgeInsets.all(16),
                              decoration:
                                  BoxDecoration(color: Colors.red.shade300),
                              child: Column(
                                children: const [
                                  Text(
                                      'appCubit.allStockInnerSector[index].symbol'),
                                  Text(
                                      'appCubit.allStockInnerSector[index].price'),
                                  Text(
                                      'appCubit.allStockInnerSector[index].change'),
                                ],
                              ),
                            )

                        /*Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          //set border radius more than 50% of height and width to make circle
                        ),
                        color: cardColors[index],
                        child: Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  child: Text(
                                    appCubit.allStockInnerSector[index].symbol,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: false,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    appCubit.allStockInnerSector[index].price,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: false,
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    appCubit.allStockInnerSector[index].change,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: false,
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                  ),
                                ),
                              ]),
                        ),
                      ),*/
                        ),
                  ),
          );
        });
  }
}
// appBar: AppBar(
            //   backgroundColor: cardColors[index],
            //   elevation: 0,
            //   excludeHeaderSemantics: true,
            //   // title: const Text("your Arrows Of Sector"),
            //   //   leading:
            //   //  IconButton(onPressed: () {
            //   //   Navigator.pushNamed(context, AppRoutes.s);
            //   //  }, icon: const Icon(Icons.arrow_back_ios,color: Colors.black,))
            // ),
            // body: ListView(
            //   children: [
            //     const SizedBox(height: 48),
            //     // Stack(children: [
            //     //   ClipPath(
            //     //     clipper: WaveClipperOne(flip: true),
            //     //     child: Container(
            //     //       height: size.height * 0.4,
            //     //       color: cardColors[index].withOpacity(0.3),
            //     //       child: Container(),
            //     //     ),
            //     //   ),
            //     //   ClipPath(
            //     //     clipper: WaveClipperOne(flip: true),
            //     //     child: Container(
            //     //       width: double.infinity,
            //     //       height: size.height * 0.36,
            //     //       color: cardColors[index],
            //     //       child: Padding(
            //     //         padding: EdgeInsets.all(size.height * 0.02),
            //     //         child: Column(
            //     //             mainAxisAlignment: MainAxisAlignment.center,
            //     //             crossAxisAlignment: CrossAxisAlignment.start,
            //     //             children: [
            //     //               Text(sector.name,
            //     //                   style: GoogleFonts.amiri(
            //     //                       color: ColorsApp.containerColor,
            //     //                       fontSize: 35)),
            //     //               Align(
            //     //                   alignment: Alignment.bottomLeft,
            //     //                   child: Image.network(
            //     //                     sector.image,
            //     //                     width: 150,
            //     //                   )),
            //     //             ]),
            //     //       ),
            //     //     ),
            //     //   ),
            //     // ]),
            //     SizedBox(
            //       height: 400,
            //       child: StreamBuilder<List<StockModle>>(
            //           stream:
            //               appCubit.getAllStockInnerEachSector(id: sector.id),
            //           builder: (context, snapshot) {
            //             if (snapshot.connectionState ==
            //                 ConnectionState.active) {
            //               final stocks = snapshot.data;
            //               debugPrint("stocks![1] ${stocks![1]}");
            //               return ConditionalBuilder(
            //                 condition:
            //                     true, // stocks == null || stocks.isEmpty,
            //                 builder: (context) => ListView.builder(
            //                   itemCount:
            //                       stocks.length, // cubit.allTickers.length,
            //                   itemBuilder: (context, index) => InkWell(
            //                       onTap: () {
            //                         appCubit.getStockApiData(
            //                             context, stocks[index].ramz);
            //                         //     ramz: stocks[index].ramz);
            //                         // imageApi = stocks[index].logo;
            //                         // debugPrint("appCubit.stockApiData :: ${appCubit.stockApiDataMap}");
            //                         // Navigator.of(context, rootNavigator: false)
            //                         //     .pushNamed(AppRoutes.stockDetailsRoute,
            //                         //         arguments: appCubit
            //                         //             .stockApiDataMap //stocks[index]
            //                         //         /* {
            //                         //          "stockApi": appCubit.stockApiDataMap,
            //                         //          "stock":
            //                         //         } */
            //                         //         );
            //                       },
            //                       child: defaultCard(context,
            //                           arrowModle: stocks[index],
            //                           onDismissed: null, onTap: () {
            //                         appCubit.getStockApiData(
            //                             context, stocks[index].ramz);
            //                         Navigator.of(context, rootNavigator: false)
            //                             .pushNamed(AppRoutes.detailsStockRoute,
            //                                 arguments:
            //                                     appCubit.stockApiDataMap);
            //                       }
            //                           //  onTap: () {
            //                           // appCubit.getStockApiData(
            //                           //     context, arrowss[index].ramz);
            //                           // Navigator.of(context,
            //                           //         rootNavigator: false)
            //                           //     .pushNamed(
            //                           //         AppRoutes.detailsStockRoute,
            //                           //         arguments:
            //                           //             appCubit.stockApiDataMap);
            //                           // }
            //                           )),
            //                 ),
            //                 fallback: (context) =>
            //                     const Center(child: Text("No FollowingArrows")),
            //               );
            //             } else {
            //               return const Center(
            //                   child: CircularProgressIndicator());
            //             }
            //           }),
            //     ),
            //   ],
            // ),
          