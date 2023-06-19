import 'package:app/shared/components/components.dart';
import 'package:app/shared/cubit/cubit.dart';
import 'package:app/shared/cubit/states.dart';
import 'package:app/shared/router/routes.dart';
import 'package:app/shared/styles/colors.dart';
import 'package:app/shared/styles/size_config.dart';
import 'package:app/shared/styles/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

class StockAtSectorNew extends StatelessWidget {
  const StockAtSectorNew(
      {super.key,
      required this.sectorNameEn,
      required this.sectorNameAr,
      required this.svgSrc});
  final String sectorNameEn;
  final String sectorNameAr;

  final String svgSrc;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AppCubit()..fetchStocksAtSectors(sectorName: sectorNameEn),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          final appCubit = AppCubit.get(context);
          // final size = MediaQuery.of(context).size;

          return ConditionalBuilder(
            condition: state is! FetchStocksAtSectorLoadingState,
            builder: (context) => Scaffold(
                backgroundColor: kBackgroundColor,
                appBar: AppBar(
                  backgroundColor: kBackgroundColor,
                  // title: Text('${appCubit.stocksAtSectors.length}stock'),
                  titleTextStyle: kBodyText2,
                  leading: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: firstColor,
                    ),
                  ),
                ),
                body: Column(
                  children: [
                    Image.network(
                      svgSrc,
                      width: 200,
                    ),
                    Text(
                      sectorNameAr,
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(
                              color: kPrimaryColor,
                              height: 1.2,
                              fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 50),
                    appCubit.stocksAtSectors.isNotEmpty
                        ? Expanded(
                            child: SizedBox(
                              height: SizeConfig.screenHeight! * 0.4,
                              child: ListView.separated(
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
                                  itemCount: appCubit.stocksAtSectors.length,
                                  itemBuilder: (context, index) => InkWell(
                                        onTap: () {
                                          debugPrint("onTap");
                                          Navigator.pushNamed(context,
                                              AppRoutes.detailsStockRoute,
                                              arguments: appCubit
                                                  .stocksAtSectors[index].ramz);
                                        },
                                        // child: Text("kkkk")
                                        // ToDo: ..................
                                        // stockCard(context,
                                        // stockAtSector: appCubit.stocksAtSectors[index]),
                                        // stockCardInnerSector
                                        child: stockCardInnerSector(context,
                                            stockAtSector: appCubit
                                                .stocksAtSectors[index]),
                                      )),
                            ),
                          )
                        : Center(
                            child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.network(
                                  'https://cdn-icons-png.flaticon.com/128/6598/6598519.png'),
                              const SizedBox(height: 16),
                              Text("Not exist stocks at $sectorNameEn"),
                            ],
                          )),
                  ],
                )),
            fallback: (context) => Container(
                width: 50,
                color: Colors.white,
                child: Center(child: Image.asset('assets/ripple.gif'))),
          );
        },
      ),
    );
  }
}
