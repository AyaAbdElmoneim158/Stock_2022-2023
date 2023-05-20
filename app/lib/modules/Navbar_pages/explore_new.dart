import 'package:app/shared/components/components.dart';
import 'package:app/shared/cubit/cubit.dart';
import 'package:app/shared/cubit/states.dart';
import 'package:app/shared/router/routes.dart';
import 'package:app/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

class ExploreNew extends StatelessWidget {
  const ExploreNew({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AppCubit()..fetchStocksAtSectors(setcorName: 'Commercial Services'),
      child: BlocConsumer<AppCubit, AppStates>(
          listener: (context, state) {},
          builder: (context, state) {
            final appCubit = AppCubit.get(context);
            final size = MediaQuery.of(context).size;

            return Scaffold(
              backgroundColor: kBackgroundColor,
              appBar: homeAppBar(context),
              body: Column(
                children: [
                  SearchBox(
                    onChanged: (val) {},
                  ),
                  const ItemList(),
                  const CategoryList(),
                  ConditionalBuilder(
                    condition: state is! FetchStocksAtSectorLoadingState,
                    builder: (context) => SizedBox(
                      height: 330,
                      child: ListView.separated(
                          separatorBuilder: (context, index) => Padding(
                                padding: const EdgeInsets.only(
                                    top: 15, bottom: 15, left: 70, right: 15),
                                child: Divider(
                                  height: 1.6,
                                  thickness: 1.5,
                                  color: Colors.grey.shade200,
                                ),
                              ),
                          itemCount: appCubit.stocksAtSectors!.length,
                          itemBuilder: (context, index) => InkWell(
                                onTap: () {
                                  debugPrint("onTap");
                                  Navigator.pushNamed(
                                      context, AppRoutes.detailsStockRoute,
                                      arguments: appCubit
                                          .stocksAtSectors[index].symbol);
                                },
                                child: stockCard(context,
                                    stockAtSector:
                                        appCubit.stocksAtSectors[index]),
                              )),
                    ),
                    fallback: (context) => Container(
                        color: kBackgroundColor,
                        child: Center(
                            child: Center(
                                child: Image.asset('assets/ripple.gif')))),
                  )
                ],
              ),
            );
          }),
    );
  }
}
