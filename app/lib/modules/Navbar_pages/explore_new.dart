import 'package:app/models/stock_model.dart';
import 'package:app/shared/components/components.dart';
import 'package:app/shared/cubit/cubit.dart';
import 'package:app/shared/cubit/states.dart';
import 'package:app/shared/router/routes.dart';
import 'package:app/shared/styles/colors.dart';
import 'package:app/shared/styles/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:animate_do/animate_do.dart';

class ExploreNew extends StatelessWidget {
  const ExploreNew({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()
        // ..fetchChartsData(ramz: 'ABUK'),
        ..fetchStocksAtSectors(sectorName: 'Commercial Services'),
      child: BlocConsumer<AppCubit, AppStates>(
          listener: (context, state) {},
          builder: (context, state) {
            final appCubit = AppCubit.get(context);
            SizeConfig().init(context);

            return Scaffold(
              backgroundColor: kBackgroundColor,
              appBar: AppBar(
                iconTheme: const IconThemeData(color: firstColor),
              ),
              drawer: Drawer(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Stack(clipBehavior: Clip.none, children: [
                        coverProfile(),
                        Positioned(
                          bottom: -55,
                          left: 24,
                          child: ZoomIn(
                              duration: const Duration(milliseconds: 1200),
                              child: user()),
                        )
                      ]),
                      FadeInDown(
                        duration: const Duration(milliseconds: 1800),
                        child: Padding(
                          padding:
                              EdgeInsets.all(SizeConfig.defaultSize! * 2.5),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                      width: SizeConfig.defaultSize! * 2.5),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'userName',
                                      ),
                                      Text(
                                        'userEmail',
                                      ),
                                    ],
                                  ),
                                  const Icon(
                                    Icons.check_circle,
                                    color: kPrimaryColor,
                                  )
                                ],
                              ),
                              SizedBox(height: SizeConfig.defaultSize! * 2),
                              Divider(
                                  thickness: 1.6,
                                  color: kTextColor,
                                  height: 1.5),
                              const SizedBox(height: 48),
                              SizedBox(
                                  height: 400,
                                  child: ListView.separated(
                                      itemBuilder: (context, index) =>
                                          index % 2 == 0
                                              ? FadeInLeft(
                                                  duration: const Duration(
                                                      milliseconds: 2700),
                                                  child: infoListItem(
                                                      index: index,
                                                      context: context))
                                              : FadeInRight(
                                                  duration: const Duration(
                                                      milliseconds: 2700),
                                                  child: infoListItem(
                                                      index: index,
                                                      context: context)),
                                      separatorBuilder: (context, index) =>
                                          seperator(),
                                      itemCount: 5)),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(Icons.logout, color: firstColor),
                                  Text(
                                    "  Logout",
                                  ),
                                ],
                              ),
                              SizedBox(height: SizeConfig.defaultSize! * 4),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              // const Drawer(backgroundColor: firstColor),
              floatingActionButton: FloatingActionButton.small(
                  child: const Icon(Icons.logout),
                  onPressed: () => appCubit.fetchChartsData(ramz: 'ABUK')
                  // fetchStocksAtSectors(sectorName: 'Communications'),
                  //appCubit.getStockApiData(ramz: 'FWRY')
                  //  => AuthHelper.instance.logout()
                  ),
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
                          itemCount: appCubit.stocksAtSectors.length,
                          itemBuilder: (context, index) => InkWell(
                                onTap: () {
                                  debugPrint("onTap");
                                  Navigator.pushNamed(
                                      context, AppRoutes.detailsStockRoute,
                                      arguments:
                                          appCubit.stocksAtSectors[index].logo);
                                },
                                // StockModle stockAtSector = StockModle(id: id);
                                //  Text("kkkk")
                                // ToDo: ..................
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

//!~> ProfileComponents .................................................................
Widget coverProfile() => Stack(children: [
      ClipRRect(
          // borderRadius: const BorderRadius.only(
          //     bottomLeft: Radius.circular(24),
          //     bottomRight: Radius.circular(24)),
          child: Image.network(
        'https://img.freepik.com/free-photo/leaves_23-2148013544.jpg',
        fit: BoxFit.cover,
        height: 120,
        width: double.infinity,
      )),
      Container(
        width: double.infinity,
        height: 120,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.5),
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(24),
              bottomRight: Radius.circular(24)),
        ),
      ),
    ]);

Widget user() => Stack(alignment: Alignment.center, children: const [
      CircleAvatar(
        radius: 37,
        backgroundColor: Color(0xFFed5f43),
      ),
      CircleAvatar(
        radius: 35,
        backgroundColor: Color(0xFFed5f43),
        backgroundImage: NetworkImage(
          "https://img.freepik.com/free-photo/young-bearded-man-with-striped-shirt_273609-5677.jpg",
        ),
      )
    ]);

Widget seperator() => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
      child: Divider(thickness: 1.6, color: Colors.grey.shade300, height: 1.5),
    );

Widget infoListItem({required int index, required BuildContext context}) => Row(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: const Color(0xFFed5f43).withOpacity(0.1),
          child: Icon(
            Icons.location_on,
            color: Colors.black.withOpacity(0.8),
            size: 20,
          ),
        ),
        const SizedBox(width: 24),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '...',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  // fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: Text(
                '...',
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(color: Colors.grey),
              ),
            ),
          ],
        ),
      ],
    );
/*
import 'package:app/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:app/shared/styles/style.dart';
import 'package:app/shared/components/size_config.dart';
import 'package:app/shared/components/constants.dart';
import 'package:animate_do/animate_do.dart';
import 'package:app/shared/styles/colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(clipBehavior: Clip.none, children: [
              coverProfile(),
              Positioned(
                bottom: -55,
                left: 24,
                child: ZoomIn(
                    duration: const Duration(milliseconds: 1200),
                    child: user()),
              )
            ]),
            FadeInDown(
              duration: const Duration(milliseconds: 1800),
              child: Padding(
                padding: EdgeInsets.all(SizeConfig.defaultSize! * 2.5),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(width: SizeConfig.defaultSize! * 2.5),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(userName, style: userNameStyle(context)),
                            Text(userEmail, style: userEmailStyle(context)),
                          ],
                        ),
                        const Icon(
                          Icons.check_circle,
                          color: primaryColor,
                        )
                      ],
                    ),
                    SizedBox(height: SizeConfig.defaultSize! * 2),
                    Divider(
                        thickness: 1.6, color: greyColor.shade300, height: 1.5),
                    const SizedBox(height: 48),
                    SizedBox(
                        height: 400,
                        child: ListView.separated(
                            itemBuilder: (context, index) => index % 2 == 0
                                ? FadeInLeft(
                                    duration:
                                        const Duration(milliseconds: 2700),
                                    child: infoListItem(
                                        index: index, context: context))
                                : FadeInRight(
                                    duration:
                                        const Duration(milliseconds: 2700),
                                    child: infoListItem(
                                        index: index, context: context)),
                            separatorBuilder: (context, index) => seperator(),
                            itemCount: 5)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.logout, color: primaryColor),
                        Text("  Logout", style: logoutStyle(context)),
                      ],
                    ),
                    SizedBox(height: SizeConfig.defaultSize! * 4),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}*/