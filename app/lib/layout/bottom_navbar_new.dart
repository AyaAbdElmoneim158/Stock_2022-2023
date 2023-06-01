import 'package:app/modules/Navbar_pages/explore_new.dart';
import 'package:app/modules/Navbar_pages/home_page.dart';
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
              backgroundColor: firstColor, // const Color(0XFF12192C),
              onButtonPressed: onButtonPressed,
              iconSize: 30,
              activeColor: const Color(0xFFffffff),
              selectedIndex: selectedIndex,
              barItems: <BarItem>[
                BarItem(
                  icon: Icons.home,
                  title: Constants.home,
                ),
                BarItem(
                  icon: Icons.search_rounded,
                  title: Constants.search,
                ),
                BarItem(
                  icon: Icons.bolt_rounded,
                  title: Constants.recommend,
                ),
                BarItem(
                  icon: Icons.bookmark,
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
  const HomePage(),
  const ExploreNew(),
  Container(
      alignment: Alignment.center,
      child: const Center(
        child: Text(
          "❓",
          style: TextStyle(fontSize: 80),
        ),
      )),
  const BookmarkPage(),
];
