import 'package:app/models/sector_model.dart';
import 'package:app/shared/components/components.dart';
import 'package:app/shared/cubit/cubit.dart';
import 'package:app/shared/cubit/states.dart';
import 'package:app/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

class Explore extends StatelessWidget {
  const Explore({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          AppCubit appCubit = AppCubit.get(context);

          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.network(
                      'https://cdn3d.iconscout.com/3d/premium/thumb/profit-3597243-3010223.png',
                      //'https://cdn3d.iconscout.com/3d/premium/thumb/handshake-3311965-2764508.png',
                      width: 200,
                      fit: BoxFit.cover,
                    ),
                    Text(
                      " ا بحث الأن عن الاسهم المصرية في السوق المصري🔎",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 48),
                    InkWell(
                      onTap:
                          () {}, //=> Navigator.of(context, rootNavigator: false).pushNamed(AppRoutes.viewAllStocksRoute ),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          "view All >",
                          textAlign: TextAlign.right,
                          style: Theme.of(context)
                              .textTheme
                              .caption!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    StreamBuilder<List<SectorModle>>(
                        stream: appCubit.getAllSectors(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.active) {
                            final sectors = snapshot.data;
                            debugPrint("arrowss![1] ${sectors![1]}");
                            return ConditionalBuilder(
                              condition:
                                  true, // sectors == null || sectors.isEmpty,
                              fallback: (context) => const Center(
                                  child: Text("No FollowingArrows")),
                              builder: (context) => CarouselSlider.builder(
                                options: CarouselOptions(
                                  height: 150.0,
                                  aspectRatio: 16 / 9,
                                  viewportFraction: 0.8,
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
                                itemCount: sectors.length,
                                itemBuilder: (BuildContext context,
                                        int itemIndex, int pageViewIndex) =>
                                    defaultSector(context, sectors[itemIndex],
                                        index: itemIndex),
                              ),
                            );
                          } else {
                            return Container(
                                color: whiteColor,
                                child: Center(
                                    child: Image.asset('assets/ripple.gif')));
                          }
                        })
                  ]),
            ),
          );
        });
  }
}
