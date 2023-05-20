import 'package:app/modules/Navbar_pages/home_page.dart';
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
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16), topRight: Radius.circular(16)),
          child: SlidingClippedNavBar(
            backgroundColor: const Color(0XFF12192C),
            onButtonPressed: onButtonPressed,
            iconSize: 30,
            activeColor: const Color(0xFFffffff),
            selectedIndex: selectedIndex,
            barItems: <BarItem>[
              BarItem(
                icon: Icons.home,
                title: 'Home',
              ),
              BarItem(
                icon: Icons.search_rounded,
                title: 'Search',
              ),
              BarItem(
                icon: Icons.bolt_rounded,
                title: 'Recommend',
              ),
              BarItem(
                icon: Icons.bookmark,
                title: 'Bookmark',
              ),
            ],
          ),
        ));
  }
}

// icon size:24 for fontAwesomeIcons
// icons size: 30 for MaterialIcons

List<Widget> _listOfWidget = <Widget>[
  // Container(
  //   alignment: Alignment.center,
  //   child: SingleChildScrollView(
  //     child: Column(
  //       children: const [
  //         Icon(Iconsax.home, size: 30, color: Colors.brown),
  //         Icon(Iconsax.home1, size: 30, color: Colors.brown),
  //         Icon(Iconsax.home2, size: 30, color: Colors.brown),
  //         Icon(Iconsax.home_22, size: 30, color: Colors.brown),
  //         Icon(Iconsax.home_23, size: 30, color: Colors.brown),
  //         Icon(Iconsax.home_24, size: 30, color: Colors.brown),
  //         Icon(Iconsax.home_25, size: 30, color: Colors.brown),
  //       ],
  //     ),
  //   ),
  // ),
  const HomePage(),
  Container(
    alignment: Alignment.center,
    child: SingleChildScrollView(
      child: Column(
        children: const [
          Icon(Iconsax.search_normal2, size: 30, color: Colors.brown),
          Icon(Iconsax.search_normal3, size: 30, color: Colors.brown),
          Icon(Iconsax.search_normal4, size: 30, color: Colors.brown),
          Icon(Iconsax.search_status3, size: 30, color: Colors.brown),
          Icon(Iconsax.search_status4, size: 30, color: Colors.brown),
        ],
      ),
    ),
  ),
  Container(
    alignment: Alignment.center,
    child: SingleChildScrollView(
      child: Column(
        children: const [
          Icon(Iconsax.bookmark, size: 30, color: Colors.brown),
          Icon(Iconsax.bookmark1, size: 30, color: Colors.brown),
          Icon(Iconsax.bookmark2, size: 30, color: Colors.brown),
          Icon(Iconsax.bookmark3, size: 30, color: Colors.brown),
          Icon(Iconsax.bookmark4, size: 30, color: Colors.brown),
          Icon(Iconsax.bookmark5, size: 30, color: Colors.brown),
          Icon(Iconsax.bookmark_2, size: 30, color: Colors.brown),
          Icon(Iconsax.bookmark_21, size: 30, color: Colors.brown),
          Icon(Iconsax.bookmark_22, size: 30, color: Colors.brown),
          Icon(Iconsax.bookmark_23, size: 30, color: Colors.brown),
          Icon(Iconsax.bookmark_24, size: 30, color: Colors.brown),
          Icon(Iconsax.bookmark_25, size: 30, color: Colors.brown),
        ],
      ),
    ),
  ),
  // Container(
  //   alignment: Alignment.center,
  //   child: SingleChildScrollView(
  //     child: Column(
  //       children: const [
  //         Icon(Iconsax.tag, size: 30, color: Colors.brown),
  //         Icon(Iconsax.chart_13, size: 30, color: Colors.brown),
  //         Icon(Iconsax.bookmark2, size: 30, color: Colors.brown),
  //         Icon(Iconsax.bookmark3, size: 30, color: Colors.brown),
  //         Icon(Iconsax.bookmark4, size: 30, color: Colors.brown),
  //         Icon(Iconsax.bookmark5, size: 30, color: Colors.brown),
  //         Icon(Iconsax.bookmark_2, size: 30, color: Colors.brown),
  //         Icon(Iconsax.bookmark_21, size: 30, color: Colors.brown),
  //         Icon(Iconsax.bookmark_22, size: 30, color: Colors.brown),
  //         Icon(Iconsax.bookmark_23, size: 30, color: Colors.brown),
  //         Icon(Iconsax.bookmark_24, size: 30, color: Colors.brown),
  //         Icon(Iconsax.bookmark_25, size: 30, color: Colors.brown),
  //       ],
  //     ),
  //   ),
  // ),
  BookmarkPage(),
];
