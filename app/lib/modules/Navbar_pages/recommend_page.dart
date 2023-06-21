import 'package:app/models/stock_model.dart';
import 'package:app/modules/Navbar_pages/real_time.dart';
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
import 'package:flutter_svg/flutter_svg.dart';

class RecommendPage extends StatelessWidget {
  const RecommendPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
          listener: (context, state) {},
          builder: (context, state) {
            final appCubit = AppCubit.get(context);
            return Scaffold(
              backgroundColor: AppColors.kBackgroundColor,
              appBar: AppBar(
                  // leading: IconButton(icon: const Icon(Icons.search), onPressed: () {}),
                  title: Text(
                    "نرشح لك  🔖",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  actions: [
                    IconButton(
                        onPressed: () {
                          // navigatorTo(context,);
                          navigatorTo(
                            context: context,
                            routeName: AppRoutes.chatRoute,
                          );
                        },
                        icon: Icon(
                          Icons.chat_rounded,
                          color: AppColors.firstColor,
                        )),
                    IconButton(
                        onPressed: () {
                          // navigatorTo(context,);
                          AuthHelper.instance.logout();
                        },
                        icon: Icon(
                          Icons.logout,
                          color: AppColors.firstColor,
                        ))
                  ]),
              body: Center(
                  child: ListView.separated(
                      itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, AppRoutes.detailsStockRoute,
                                    arguments: recommendDataList2[index].ramz);
                              },
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  /*CircleAvatar(
                                      radius: 24,
                                      backgroundColor:
                                          firstColor.withOpacity(0.1),
                                      backgroundImage: NetworkImage(
                                          recommendDataList[index].logo)),*/
                                  CircleAvatar(
                                    radius: 20,
                                    child: SvgPicture.network(
                                      recommendDataList2[index].logo.toString(),
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
                                          Text(recommendDataList2[index].name,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleLarge!
                                                  .copyWith(
                                                      color:
                                                          AppColors.textColor,
                                                      fontWeight:
                                                          FontWeight.w600)),
                                          Text(recommendDataList2[index].ramz,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall!
                                                  .copyWith(
                                                      color:
                                                          AppColors.textColor,
                                                      fontWeight:
                                                          FontWeight.w600)),
                                        ]),
                                  ),
                                  const SizedBox(width: 20),

                                  // Coin(
                                  //     ramz: recommendDataList[index].ramz,
                                  //     lastPrice: '0'),
                                ],
                              ),
                            ),
                          ),
                      separatorBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.only(
                                top: 15, bottom: 15, left: 15, right: 70),
                            child: Divider(
                              height: 1.6,
                              thickness: 1.5,
                              color: Colors.grey.shade200,
                            ),
                          ),
                      itemCount: recommendDataList2.length)
                  /*  ConditionalBuilder(
                  condition: state is! FetchDetailsLoadingState,
                  builder: (context) => ListView.separated(
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
                    itemCount: 1, // recommendList['result']!.length,
                    itemBuilder: (BuildContext context, int index) {
                      appCubit.fetchDetails(
                          ramz: recommendList['result']![index]);

                      // StockModle stockModle = StockModle(
                      //   id: DateTime.now().toIso8601String(),
                      //   logo: arrowss[index].logo.toString(),
                      //   name: arrowss[index].name.toString(),
                      //   // price: stockPriceController.text,
                      //   ramz: arrowss[index].ramz.toString(),
                      //   // stocksNo: stockNoController.text,
                      // );
                      appCubit.details;
                      StockModle stockAtSector = StockModle(
                          id: DateTime.now().toIso8601String(),
                          logo: appCubit.details.logo.toString(),
                          name: appCubit.details.name.toString(),
                          ramz: appCubit.details.ramz.toString());
                      return InkWell(
                        onTap: () {
                          // debugPrint("onTap");
                          // Navigator.pushNamed(
                          //     context, AppRoutes.detailsStockRoute,
                          //     arguments: recommendList['result']![index]);
                        },
                        child: StockCardFav(stockAtSector: stockAtSector),
                      );
                    },
                  ),
                  fallback: (context) => Container(
                      color: Colors.white,
                      child: Center(
                          child:
                              Center(child: Image.asset('assets/ripple.gif')))),
                ),*/
                  ),
            );
          }),
    );
  }
}
