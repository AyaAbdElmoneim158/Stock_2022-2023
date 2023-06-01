import 'package:app/models/stock_model.dart';
import 'package:app/shared/components/components.dart';
import 'package:app/shared/cubit/cubit.dart';
import 'package:app/shared/cubit/states.dart';
import 'package:app/shared/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

class BookmarkPage extends StatelessWidget {
  const BookmarkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          AppCubit appCubit = AppCubit.get(context);

          return Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              excludeHeaderSemantics: true,
              // centerTitle: true,
              title: Text(
                "مفضلاتك 🔖",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            body: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        // Color.fromARGB(255, 255, 136, 148),
                        // ColorsApp.containerColor,
                        Color.fromARGB(255, 255, 255, 255),
                        Color(0XFFf5f7fa),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0.2, 0.8])),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: StreamBuilder<List<StockModle>>(
                    stream: appCubit.getFavoriteArrows(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.active) {
                        final arrowss = snapshot.data;
                        debugPrint("arrowss![1] ${arrowss!.length}");
                        return ConditionalBuilder(
                            condition: arrowss
                                .isNotEmpty, // true,// arrowss == null || arrowss.isEmpty,
                            builder: (context) => ListView.separated(
                                  // controller: scrollController,
                                  separatorBuilder: (context, index) => Padding(
                                    padding: const EdgeInsets.only(
                                        top: 15,
                                        bottom: 15,
                                        left: 70,
                                        right: 15),
                                    child: Divider(
                                      height: 1.6,
                                      thickness: 1.5,
                                      color: Colors.grey.shade200,
                                    ),
                                  ),
                                  itemCount: arrowss.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    /* StockAtSectorModel stockAtSector =
                                    StockAtSectorModel(
                                        symbol: arrowss[index].ramz,
                                        price: arrowss[index].price,
                                        change: arrowss[index].price,
                                        change100: arrowss[index].price);*/
                                    StockModle stockModle = StockModle(
                                      id: DateTime.now().toIso8601String(),
                                      logo: arrowss[index].logo.toString(),
                                      name: arrowss[index].name.toString(),
                                      // price: stockPriceController.text,
                                      ramz: arrowss[index].ramz.toString(),
                                      // stocksNo: stockNoController.text,
                                    );
                                    return InkWell(
                                      onTap: () {
                                        debugPrint("onTap");
                                        Navigator.pushNamed(context,
                                            AppRoutes.detailsStockRoute,
                                            arguments: arrowss[index].ramz);
                                      },
                                      child: stockCard(context,
                                          stockAtSector: arrowss[index]),
                                    );
                                  },
                                ),
                            /* ListView.builder(
                                  itemCount: arrowss
                                      .length, // cubit.allTickers.length,
                                  itemBuilder: (context, index) => defaultCard(
                                      context,
                                      arrowModle: arrowss[index],
                                      onDismissed:
                                          (DismissDirection direction) =>
                                              appCubit.deleteFavoriteArrow(
                                                  id: arrowss[index].id),
                                      onTap: () {
                                        // appCubit.getStockDetails(
                                        //     arrowss[index].ramz);
                                        // Navigator.of(context,
                                        //         rootNavigator: false)
                                        //     .pushNamed(
                                        //         AppRoutes.detailsStockRoute,
                                        //         arguments:
                                        //             appCubit.stockDetails);
                                        // appCubit.getStockApiData(
                                        //     context, arrowss[index].ramz);
                                        Navigator.of(context,
                                                rootNavigator: false)
                                            .pushNamed(
                                                AppRoutes.detailsStockRoute,
                                                arguments: arrowss[index].ramz);
                                      }), // index: index,
                                ),*/
                            fallback: (context) => Center(
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const SizedBox(height: 50),
                                        // const CircleAvatar(
                                        //   radius: 90.0, backgroundColor: Colors.transparent,backgroundImage:
                                        //NetworkImage(
                                        // "https://img.freepik.com/premium-vector/like-thumb-up-symbol-finger-up-vector-stock-illustration_100456-10995.jpg"
                                        // "https://cdn3d.iconscout.com/3d/premium/thumb/hands-with-heart-4883949-4073132.png"
                                        // "https://cdn3d.iconscout.com/3d/premium/thumb/stock-analytics-5233669-4379879.png"
                                        // ), ),
                                        Image.network(
                                          'https://cdn-icons-png.flaticon.com/128/3208/3208709.png',
                                          // 'https://cdn-icons-png.flaticon.com/128/7222/7222088.png',
                                          // 'https://cdn-icons-png.flaticon.com/128/2899/2899445.png',
                                          width: 150, fit: BoxFit.cover,
                                        ),

                                        const SizedBox(height: 15),
                                        InkWell(
                                            onTap:
                                                () {}, //=>appCubit.changeCurrentIndex(2), // {}, //=> Navigator.pushNamed(context, AppRoutes.arrowsSectorRoute),
                                            child: Text(
                                              "اختار مفضلاتك للاسهم",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headlineSmall,
                                            ))
                                      ]),
                                )
                            //const Center(child: Text("No FollowingArrows")),
                            );
                      } else {
                        return Container(
                            color: Colors.white,
                            child: Center(
                                child: Image.asset('assets/ripple.gif')));

                        //return const Center(child: CircularProgressIndicator());
                      }
                    }),
              ),
            ),
          );
        });
  }
}
