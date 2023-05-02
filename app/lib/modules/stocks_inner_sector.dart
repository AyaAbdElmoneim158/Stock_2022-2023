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

class StocksInnerSectot extends StatelessWidget {
  const StocksInnerSectot(
      {super.key, required this.sector, required this.index});
  final SectorModle sector;
  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          AppCubit appCubit = AppCubit.get(context);

          return Scaffold(
            extendBodyBehindAppBar: true,
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
            body: ListView(
              children: [
                const SizedBox(height: 48),
                // Stack(children: [
                //   ClipPath(
                //     clipper: WaveClipperOne(flip: true),
                //     child: Container(
                //       height: size.height * 0.4,
                //       color: cardColors[index].withOpacity(0.3),
                //       child: Container(),
                //     ),
                //   ),
                //   ClipPath(
                //     clipper: WaveClipperOne(flip: true),
                //     child: Container(
                //       width: double.infinity,
                //       height: size.height * 0.36,
                //       color: cardColors[index],
                //       child: Padding(
                //         padding: EdgeInsets.all(size.height * 0.02),
                //         child: Column(
                //             mainAxisAlignment: MainAxisAlignment.center,
                //             crossAxisAlignment: CrossAxisAlignment.start,
                //             children: [
                //               Text(sector.name,
                //                   style: GoogleFonts.amiri(
                //                       color: ColorsApp.containerColor,
                //                       fontSize: 35)),
                //               Align(
                //                   alignment: Alignment.bottomLeft,
                //                   child: Image.network(
                //                     sector.image,
                //                     width: 150,
                //                   )),
                //             ]),
                //       ),
                //     ),
                //   ),
                // ]),
                SizedBox(
                  height: 400,
                  child: StreamBuilder<List<StockModle>>(
                      stream:
                          appCubit.getAllStockInnerEachSector(id: sector.id),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.active) {
                          final stocks = snapshot.data;
                          debugPrint("stocks![1] ${stocks![1]}");
                          return ConditionalBuilder(
                            condition:
                                true, // stocks == null || stocks.isEmpty,
                            builder: (context) => ListView.builder(
                              itemCount:
                                  stocks.length, // cubit.allTickers.length,
                              itemBuilder: (context, index) => InkWell(
                                  onTap: () {
                                    appCubit.getStockApiData(
                                        context, stocks[index].ramz);
                                    //     ramz: stocks[index].ramz);
                                    // imageApi = stocks[index].logo;
                                    // debugPrint("appCubit.stockApiData :: ${appCubit.stockApiDataMap}");
                                    // Navigator.of(context, rootNavigator: false)
                                    //     .pushNamed(AppRoutes.stockDetailsRoute,
                                    //         arguments: appCubit
                                    //             .stockApiDataMap //stocks[index]
                                    //         /* {
                                    //          "stockApi": appCubit.stockApiDataMap,
                                    //          "stock":
                                    //         } */
                                    //         );
                                  },
                                  child: defaultCard(context,
                                      arrowModle: stocks[index],
                                      onDismissed: null, onTap: () {
                                    appCubit.getStockApiData(
                                        context, stocks[index].ramz);
                                    Navigator.of(context, rootNavigator: false)
                                        .pushNamed(AppRoutes.detailsStockRoute,
                                            arguments:
                                                appCubit.stockApiDataMap);
                                  }
                                      //  onTap: () {
                                      // appCubit.getStockApiData(
                                      //     context, arrowss[index].ramz);
                                      // Navigator.of(context,
                                      //         rootNavigator: false)
                                      //     .pushNamed(
                                      //         AppRoutes.detailsStockRoute,
                                      //         arguments:
                                      //             appCubit.stockApiDataMap);
                                      // }
                                      )),
                            ),
                            fallback: (context) =>
                                const Center(child: Text("No FollowingArrows")),
                          );
                        } else {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                      }),
                ),
              ],
            ),
          );
        });
  }
}
