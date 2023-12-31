import 'package:app/modules/Navbar_pages/details_new_page.dart';
import 'package:app/modules/Navbar_pages/recommend_page.dart';

import 'package:app/modules/Navbar_pages/explore_new.dart';
import 'package:app/modules/Navbar_pages/home_page.dart';
import 'package:app/modules/Navbar_pages/new_dash.dart';
import 'package:app/modules/Navbar_pages/test_charts_api.dart';
import 'package:app/modules/chatApp/chat_screen.dart';
import 'package:app/modules/my_chart.dart';
import 'package:app/modules/test_page.dart';
import 'package:app/shared/components/constants.dart';
import 'package:app/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';
import 'package:iconsax/iconsax.dart';
import 'package:app/modules/Navbar_pages/bookmark_page.dart';

//!~> BottomNavbarNew: ...............................................................
class BottomNavbarNew extends StatefulWidget {
  const BottomNavbarNew({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _BottomNavbarNewState createState() => _BottomNavbarNewState();
}

class _BottomNavbarNewState extends State<BottomNavbarNew> {
  late PageController _pageController;
  int selectedIndex = 0;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: selectedIndex);
  }

  void onButtonPressed(int index) {
    setState(() {
      selectedIndex = index;
    });
    _pageController.animateToPage(selectedIndex,
        duration: const Duration(milliseconds: 400), curve: Curves.easeOutQuad);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: <Widget>[
            Expanded(
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: _pageController,
                children: _listOfWidget,
              ),
            ),
          ],
        ),
        bottomNavigationBar: SizedBox(
          height: 80,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16), topRight: Radius.circular(16)),
            child: SlidingClippedNavBar(
              backgroundColor: AppColors.firstColor, // const Color(0XFF12192C),
              onButtonPressed: onButtonPressed,
              iconSize: 30,
              activeColor: const Color(0xFFffffff),
              selectedIndex: selectedIndex,
              barItems: <BarItem>[
                // BarItem(
                //   icon: Icons.edit,
                //   title: 'Test',
                // ),
                BarItem(
                  icon: Iconsax.home_2,
                  title: Constants.home,
                ),
                BarItem(
                  icon: Iconsax.search_normal,
                  title: Constants.search,
                ),
                BarItem(
                  icon: Iconsax.sidebar_top,
                  // .bolt_rounded,
                  title: Constants.recommend,
                ),
                BarItem(
                  icon: Iconsax.bookmark,
                  title: Constants.bookmark,
                ),
              ],
            ),
          ),
        ));
  }
}

// icon size:24 for fontAwesomeIcons
// icons size: 30 for MaterialIcons

List<Widget> _listOfWidget = <Widget>[
  // TestPage(ramz: 'abuk'),
  // ChatScreen(),
  // const NewDash(ramz: 'abuk'), //irax, fwry,RACC,SCTS,TRTO
  // const TestChatsApi(),
  const HomePage(),
  const ExploreNew(),

  // const MyChart(),
  // const DetailNewsScreen(ramz: 'ABUK'),

  const RecommendPage(),
  // Container(
  //     alignment: Alignment.center,
  //     child: const Center(
  //       child: Text(
  //         "❓",
  //         style: TextStyle(fontSize: 80),
  //       ),
  //     )),

  const BookmarkPage(),
];
