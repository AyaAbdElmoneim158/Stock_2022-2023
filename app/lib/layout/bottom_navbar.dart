import 'package:app/modules/profile_page.dart';
import 'package:app/shared/styles/colors.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:app/modules/home_page.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _page = 0;
  // ignore: non_constant_identifier_names
  List<Widget> Screens = [
    // Scaffold(
    //     body: Center(
    //   child: Text('HomePage ...!',
    //       style: TextStyle(fontSize: 30, color: Colors.grey)),
    // )),
    const HomePage(),
    // HomePa(),
    const Scaffold(
        body: Center(
      child: Text('FavoritePage ...!',
          style: TextStyle(fontSize: 30, color: Colors.grey)),
    )),
    const Scaffold(
        body: Center(
      child: Text('ExplorePage ...!',
          style: TextStyle(fontSize: 30, color: Colors.grey)),
    )),
    const Scaffold(
        body: Center(
      child: Text('RecommendPage ...!',
          style: TextStyle(fontSize: 30, color: Colors.grey)),
    )),
    ProfilePage()
  ];
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: 0,
          height: 60.0,
          items: const [
            Icon(
              Icons.home,
              size: 30,
              color: secondColor,
            ),
            Icon(
              Icons.favorite,
              size: 30,
              color: secondColor,
            ),
            Icon(
              Icons.search,
              size: 30,
              color: secondColor,
            ),
            Icon(
              Icons.add_chart_sharp,
              size: 30,
              color: secondColor,
            ),
            Icon(
              Icons.person_add_alt_1_outlined,
              size: 30,
              color: secondColor,
            ),
          ],
          // color: ColorsApp.secondColor,
          color: Theme.of(context).dividerColor,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          buttonBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
          // backgroundColor: ColorsApp.bodyColor,
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 600),
          onTap: (index) {
            setState(() {
              _page = index;
            });
          },
          letIndexChange: (index) => true,
        ),
        body: Screens[_page]);
  }
}
