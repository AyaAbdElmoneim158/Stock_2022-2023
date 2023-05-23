import 'package:app/models/stock_at_sector_model.dart';
import 'package:app/models/stock_model.dart';
import 'package:app/shared/components/components.dart';
import 'package:app/shared/components/constants.dart';
import 'package:app/shared/cubit/cubit.dart';
import 'package:app/shared/cubit/states.dart';
import 'package:app/shared/network/remote/auth_helper.dart';
import 'package:app/shared/router/routes.dart';
import 'package:app/shared/styles/colors.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          final appCubit = AppCubit.get(context);
          return Scaffold(
            floatingActionButton: FloatingActionButton.small(
                child: const Icon(Icons.logout),
                onPressed: () => appCubit.getStockApiData(ramz: 'FWRY')
                //  => AuthHelper.instance.logout()
                ),
            body: NestedScrollView(
                headerSliverBuilder: (context, innerBoxIsScrolled) => [
                      SliverAppBar(
                        backgroundColor: Colors.white, //whiteColor,
                        elevation: 0,
                        automaticallyImplyLeading: false,
                        bottom: PreferredSize(
                          preferredSize: size * 0.05,
                          child: Container(
                              padding: EdgeInsets.all(size.height * 0.03),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white, //whiteColor,
                                borderRadius: BorderRadius.only(
                                    topLeft:
                                        Radius.circular(size.height * 0.04),
                                    topRight:
                                        Radius.circular(size.height * 0.04)),
                              ),
                              child: Text(
                                "الأسهم الخاصة بك التالية",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(
                                        color: firstColor,
                                        fontWeight: FontWeight.bold),
                              )),
                        ),
                        pinned: true,
                        stretch: true,
                        //! Add Stack Here .............................
                        flexibleSpace: FlexibleSpaceBar(
                          background: Container(
                            color: Colors.white, //whiteColor,
                            height: size.height * 0.6,
                            child: Column(children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: size.height * 0.02,
                                  vertical: size.height * 0.04,
                                ),
                                child: SizedBox(
                                  width: double.infinity,
                                  child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Expanded(
                                          child: Row(children: const [
                                            Icon(Icons.search),
                                            // SizedBox(width: 8),
                                            Spacer(),
                                            Icon(Icons.notifications),
                                          ]),
                                        )
                                      ]),
                                ),
                              ),
                              CarouselSlider.builder(
                                options: CarouselOptions(
                                  height: 150,
                                  aspectRatio: 16 / 9,
                                  viewportFraction: 0.9,
                                  initialPage: 0,
                                  enableInfiniteScroll: true,
                                  reverse: false,
                                  autoPlay: true,
                                  autoPlayInterval: const Duration(seconds: 3),
                                  autoPlayAnimationDuration:
                                      const Duration(milliseconds: 800),
                                  autoPlayCurve: Curves.fastOutSlowIn,
                                  enlargeCenterPage: true,
                                  enlargeFactor: 0.3,
                                  // onPageChanged: callbackFunction,
                                  scrollDirection: Axis.horizontal,
                                ),
                                itemCount: Constants.onboaringData.length,
                                itemBuilder: (BuildContext context,
                                        int itemIndex, int pageViewIndex) =>
                                    Container(
                                        padding: const EdgeInsets.all(12),
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            color: firstColor,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Align(
                                                child: Text(
                                                    Constants.onboaringData[
                                                        itemIndex]["text"],
                                                    style: const TextStyle(
                                                        color: Colors.white)),
                                              ),
                                            ),
                                            const SizedBox(width: 8),
                                            Image.network(
                                                Constants.onboaringData[
                                                    itemIndex]["image"],
                                                width: 100,
                                                fit: BoxFit.cover),
                                          ],
                                        )
                                        // Text(itemIndex.toString()),
                                        ),
                              )
                            ]),
                          ),
                        ),
                        expandedHeight: 400,
                      ),
                    ],
                body: StreamBuilder<List<StockModle>>(
                    stream: appCubit.getFollowingArrows(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.active) {
                        final arrowss = snapshot.data;
                        debugPrint("arrowss![1] ${arrowss!.length}");
                        return ConditionalBuilder(
                          condition: arrowss.isNotEmpty,
                          builder: (context) => Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 32),
                            color: Colors.white,
                            child: ListView.separated(
                              // controller: scrollController,
                              separatorBuilder: (context, index) => Padding(
                                padding: const EdgeInsets.only(
                                    top: 15, bottom: 15, left: 70, right: 15),
                                child: Divider(
                                  height: 1.6,
                                  thickness: 1.5,
                                  color: Colors.grey.shade200,
                                ),
                              ),
                              itemCount: arrowss.length,
                              itemBuilder: (BuildContext context, int index) {
                                StockAtSectorModel stockAtSector =
                                    StockAtSectorModel(
                                        symbol: arrowss[index].ramz,
                                        price: arrowss[index].price,
                                        change: arrowss[index].price,
                                        change100: arrowss[index].price);
                                return InkWell(
                                  onTap: () {
                                    debugPrint("onTap");
                                    Navigator.pushNamed(
                                        context, AppRoutes.detailsStockRoute,
                                        arguments: arrowss[index].ramz);
                                  },
                                  child: stockCard(context,
                                      stockAtSector: stockAtSector),
                                );
                              },
                            ),
                          ),
                          fallback: (context) {
                            return Container(
                              color: Colors.white,
                              child: Column(children: [
                                const SizedBox(height: 60),
                                // Videop
                                const CircleAvatar(
                                  radius: 90.0,
                                  backgroundImage: NetworkImage(
                                    "https://cdn3d.iconscout.com/3d/free/thumb/stock-market-4756743-3960608.png?f=avif",
                                    // "https://cdnl.iconscout.com/lottie/premium/thumb/stock-growth-7470720-6137749.mp4"
                                    // 'https://cdn3d.iconscout.com/3d/premium/thumb/stock-exchange-4843322-4039643.png'
                                  ),
                                  backgroundColor: Colors.transparent,
                                ),
                                const SizedBox(height: 5),
                                InkWell(
                                    onTap:
                                        () {}, //=> appCubit.changeCurrentIndex(2),//{}, //=> Navigator.pushNamed(context, AppRoutes.arrowsSectorRoute),
                                    child: Text(
                                      "اختر الأسهم الخاص بك التي تريد متابعته",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall,
                                    ))
                              ]),
                            );
                          },
                        );
                      } else {
                        return Container(
                            color: Colors.white,
                            child: Center(
                                child: Image.asset('assets/ripple.gif')));
                      }
                    })),
          );
        });
  }
}
