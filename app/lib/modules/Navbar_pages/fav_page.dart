import 'package:app/models/stock_model.dart';
import 'package:app/shared/components/components.dart';
import 'package:app/shared/cubit/cubit.dart';
import 'package:app/shared/cubit/states.dart';
import 'package:app/shared/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

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
              centerTitle: true,
              title: Text(
                "مفضلاتك 🔥",
                style: Theme.of(context).textTheme.headline6,
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
                            builder: (context) => ListView.builder(
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
                                ),
                            fallback: (context) => Center(
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const SizedBox(height: 50),
                                        const CircleAvatar(
                                          radius: 90.0,
                                          backgroundImage: NetworkImage(
                                              // "https://img.freepik.com/premium-vector/like-thumb-up-symbol-finger-up-vector-stock-illustration_100456-10995.jpg"
                                              "https://cdn3d.iconscout.com/3d/premium/thumb/hands-with-heart-4883949-4073132.png"
                                              // "https://cdn3d.iconscout.com/3d/premium/thumb/stock-analytics-5233669-4379879.png"
                                              ),
                                          backgroundColor: Colors.transparent,
                                        ),
                                        const SizedBox(height: 5),
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
