//!~> defaultButton >===========================<
import 'package:app/models/sector_model.dart';
import 'package:app/models/stock_at_sector_model.dart';
import 'package:app/models/stock_model.dart';
import 'package:app/modules/coin.dart';
import 'package:app/shared/cubit/cubit.dart';
import 'package:app/shared/cubit/states.dart';
import 'package:app/shared/router/routes.dart';
import 'package:app/shared/styles/colors.dart';
import 'package:app/shared/styles/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
// import 'package:iconsax/iconsax.dart';

//!~> Navigator.................................................................
void navigatorTo(
        {required BuildContext context,
        required String routeName,
        Object? arguments,
        bool rootNavigator = true}) =>
    Navigator.of(context, rootNavigator: rootNavigator)
        .pushNamed(routeName, arguments: arguments);
void navigatorRep(
        {required BuildContext context,
        required String routeName,
        Object? arguments,
        bool rootNavigator = true}) =>
    Navigator.of(context, rootNavigator: rootNavigator)
        .pushReplacementNamed(routeName, arguments: arguments);

Widget defaultButton(
        {required String text,
        required void Function()? onPressed,
        required BuildContext context,
        Color color = secondColor,
        Color textColor = whiteColor}) =>
    SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: color,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
          onPressed: onPressed,
          child: Text(text, style: TextStyle(color: textColor, fontSize: 20)
              //  btnTextStyle(context, textColor),
              )),
    );

Widget defaultButton0({String text = '', final VoidCallback? onTap}) =>
    SizedBox(
      width: double.infinity,
      // height: 45,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: secondColor, //Colors.green.shade600,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(color: whiteColor, fontSize: 16),
        ),
      ),
    );

//!~> defaultField >===========================<
Widget defaultField({
  final TextEditingController? controller,
  required void Function(String) onChanged,
  String? Function(String?)? validator,
  String? hintText = '',
  String? labelText = '',
  final TextInputType keyboardType = TextInputType.text,
}) =>
    TextFormField(
      onChanged: onChanged,
      controller: controller,
      validator: validator,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        labelText: labelText,
        floatingLabelStyle:
            const TextStyle(color: secondColor, fontWeight: FontWeight.w600),
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey, width: 1.5),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: secondColor, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.redAccent, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        // bord
        // border: OutlineInputBorder(
        //   borderSide: BorderSide(color: Colors.deepPurple.shade200, width: 2),
        //   borderRadius: BorderRadius.circular(10),
        // )
      ),
    );
Widget defaultField0({
  final TextEditingController? controller,
  required void Function(String) onChanged,
  String? Function(String?)? validator,
  String? hintText = '',
  String? labelText = '',
  final TextInputType keyboardType = TextInputType.text,
  // required Widget widget,
}) =>
    TextFormField(
      onChanged: onChanged,
      controller: controller,
      validator: validator,
      //(val) => val!.isEmpty ? "please enter your email" : null,
      //?  focusNode *** *** *** *** *** *** *** *** ***
      // focusNode: _emailFocusNode,
      // onEditingComplete: () => FocusScope.of(context)
      //     .requestFocus(_passwordFocusNode),
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
      ),
    );

Widget defaultField1({
  final TextEditingController? controller,
  required void Function(String) onChanged,
  String? Function(String?)? validator,
  final String hintText = '',
  final TextInputType keyboardType = TextInputType.text,
  // required Widget widget,
}) =>
    TextFormField(
      validator: validator,
      onChanged: onChanged,
      keyboardType: keyboardType,
      controller: controller,
      decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: const Icon(Icons.search),
          contentPadding: const EdgeInsets.all(15),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
      /* decoration: InputDecoration(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20.0),
    ),
    filled: true,
    
    // border: InputBorder.none,
    hintText: hintText,
      ),*/
    );

//!~> defaultCard >===========================<
Text txt = //Coin(ramz: arrowModle.ramz, lastPrice: arrowModle.price)//
    const Text("example text");
// txt.data;
Widget defaultCard(context,
    {required StockModle arrowModle,
    required void Function(DismissDirection)? onDismissed,
    required void Function()? onTap,
    bool isFollow = false}) {
  var coin = Coin(ramz: arrowModle.ramz, lastPrice: arrowModle.price);
  debugPrint("coin ${coin.toString()}");
  debugPrint("coin-Key ${coin.key.toString()}");
  // Key key_ = coin.key; //! https://github.com/flutter/flutter/issues/27241
  // debugPrint("coin-value.... ${(key_ as ValueKey<String>).value}");

  return InkWell(
    onTap: onTap,
    // {
    //   Navigator.of(context, rootNavigator: false).pushNamed(AppRoutes.detailsStockRoute, arguments: arrowModle.ramz);
    // },
    //
    child: Dismissible(
      key: const Key('item'),
      onDismissed: onDismissed,
      background: Container(
        color: Colors.red.shade500,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              Icon(Icons.delete, color: Colors.white),
              Text('Move to trash', style: TextStyle(color: Colors.white)),
            ],
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 15, bottom: 3),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Card(
              color: firstColor,
              elevation: 20,
              shadowColor: Theme.of(context).dividerColor,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            arrowModle.name, //.substring(0, 15),
                            maxLines: 1,
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(color: whiteColor),
                          ),
                        ),
                        // Coin(ramz: arrowModle.ramz, lastPrice: arrowModle.price)
                        coin
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("${arrowModle.ramz} ",
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(color: secondColor)),
                        isFollow
                            ? Text(
                                // "",
                                "${(int.parse(arrowModle.stocksNo) * (double.parse(arrowModle.price))) - ((double.parse(arrowModle.price)))}", //- double.parse(coin.key.toString())
                                //- int.parse(Coin(ramz: arrowModle.ramz, lastPrice: arrowModle.price).data))} USE",// * double.parse(Coin.newPrice)
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(color: Colors.green),
                              )
                            : Container(),
                      ],
                    )
                  ],
                ),
              ),
            ),
            /*Positioned(
              right: 15,
              bottom: 75,
              child: /*Image.network('',fit: BoxFit.cover,),*/
    
                  ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                child: Image.network(
                  arrowModle.logo,
                ),
              ),
            ),*/
          ],
        ),
      ),
    ),
  );
}

//!~> defaultSector >===========================<
Widget defaultSector(context, SectorModel sectorModle, {int index = 0}) =>
    SizedBox(
      width: double.infinity,
      child: InkWell(
        onTap: () => Navigator.of(context, rootNavigator: false).pushNamed(
            AppRoutes.stocksAtSectorRoute,
            arguments: sectorModle.name
            // {'sector': sectorModle, 'index': index}
            ),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            //set border radius more than 50% of height and width to make circle
          ),
          color: cardColors[index],
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.network(sectorModle.image,
                      width: 60, fit: BoxFit.cover),
                  Expanded(
                    child: Text(
                      sectorModle.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  )
                ]),
          ),
        ),
      ),
    );

//!~> SocailCArd................................................................
class SocailCArd extends StatelessWidget {
  const SocailCArd({
    super.key,
    required this.icon,
    required this.press,
  });

  final String icon;
  final void Function()? press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.all(12),
        height: 40,
        width: 40,
        decoration: const BoxDecoration(
          color: Color(0xFFF5F6F9),
          shape: BoxShape.circle,
        ),
        child: SvgPicture.network(icon),
      ),
    );
  }
}

//!~> snackbarErr........................................................
SnackBar snackbarErr(AppStates state, {required String message}) {
  return SnackBar(
    elevation: 0,
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    content: AwesomeSnackbarContent(
      title: 'Error..!',
      message: message,
      contentType: ContentType.failure,
    ),
  );
}

//?~> Search_box ..............................................................
class SearchBox extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const SearchBox({
    super.key,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: secondColor.withOpacity(0.32),
        ),
      ),
      child: TextField(
        onChanged: onChanged,
        decoration: const InputDecoration(
          border: InputBorder.none,
          icon: Icon(Icons.search, color: Color(0XFF12192C)),
          hintText: "Search Here",
          hintStyle: TextStyle(color: kTextColor),
        ),
      ),
    );
  }
}

//?~> sector item..............................................................
class ItemCard extends StatelessWidget {
  final String title, svgSrc;
  final void Function()? press;
  const ItemCard({
    super.key,
    required this.title,
    required this.svgSrc,
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    // This size provide you the total height and width of the screen
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 4),
            blurRadius: 6,
            color: const Color(0xFFB0CCE1).withOpacity(0.22),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => navigatorTo(
              context: context,
              routeName: AppRoutes.stocksAtSectorRoute,
              arguments: title),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(bottom: 15),
                  padding: const EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    color: kPrimaryColor.withOpacity(0.13),
                    shape: BoxShape.circle,
                  ),
                  child: Image.network(
                    svgSrc,
                    width: size.width * 0.1,
                  ),
                ),
                Text(
                  title,
                  style: kBodyText.copyWith(
                      color: firstColor, fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//?~>homeAppBar.................................................................
AppBar homeAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: kBackgroundColor,
    elevation: 0,
    leading: IconButton(
      icon: const Icon(Icons.menu, color: Color(0XFF12192C)),
      onPressed: () {},
    ),
    actions: <Widget>[
      IconButton(
        icon: const Icon(Icons.search, color: Color(0XFF12192C)),
        onPressed: () {},
      ),
    ],
  );
}

//?~> Sectors list...................................................................
class ItemList extends StatelessWidget {
  const ItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: fackSector.length,
          itemBuilder: (context, index) => ItemCard(
              title: fackSector[index].name,
              svgSrc: fackSector[index].image,
              press: () {})),
    );
  }
}

//?~> CategoryItem ...................................................................
class CategoryItem extends StatelessWidget {
  final String title;
  final bool isActive;
  static bool active = false;

  // final void Function()? press;
  const CategoryItem({
    super.key,
    required this.title,
    this.isActive = false,
    // required this.press,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          final appCubit = AppCubit.get(context);
          // final size = MediaQuery.of(context).size;

          return GestureDetector(
            onTap: () => appCubit.fetchStocksAtSectors(setcorName: title),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Column(
                children: <Widget>[
                  Text(
                    title,
                    style: isActive
                        ? const TextStyle(
                            color: kTextColor,
                            fontWeight: FontWeight.bold,
                          )
                        : const TextStyle(fontSize: 12),
                  ),
                  if (isActive)
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      height: 3,
                      width: 22,
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                ],
              ),
            ),
          );
        });
  }
}

//?~> CategoryList ...................................................................
class CategoryList extends StatelessWidget {
  const CategoryList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          CategoryItem(
            title: "Commercial Services",
            isActive: true,
          ),
          CategoryItem(
            title: "Finance",
          ),
          CategoryItem(
            title: "Commercial Services",
          ),
          CategoryItem(
            title: "Commercial Services",
          ),
        ],
      ),
    );
  }
}

//?~> StockList ...................................................................
ListView stockList({required List<StockAtSectorModel> stocksAtSector}) {
  return ListView.separated(
    separatorBuilder: (context, index) => Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 15, left: 70, right: 15),
      child: Divider(
        height: 1.6,
        thickness: 1.5,
        color: Colors.grey.shade200,
      ),
    ),
    itemCount: stocksAtSector.length,
    itemBuilder: (context, index) =>
        stockCard(context, stockAtSector: stocksAtSector[index]),
  );
}

//?~> StockCard ...................................................................
/*Padding stockCard(BuildContext context,
    {required StockAtSectorModel stockAtSector}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15),
    child: Row(
      children: [
        // Image.network() // Wrab with circle Avter...
        const CircleAvatar(
          radius: 25,
        ),
        const SizedBox(width: 20),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(stockAtSector.symbol,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: secondColor, fontWeight: FontWeight.w600)),
          Text("*20",
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: kTextColor)),
        ]),
        const Spacer(),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(stockAtSector.price,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: secondColor, fontWeight: FontWeight.w600)),
          Text(stockAtSector.change,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: kTextColor)),
        ]),
      ],
    ),
  );
}*/

//?~> news item..............................................................
class NewsCard extends StatelessWidget {
  final String title, des;
  final void Function()? press;
  const NewsCard({
    super.key,
    required this.title,
    required this.des,
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    // This size provide you the total height and width of the screen
    // Size size = MediaQuery.of(context).size;
    return Container(
      width: 250,
      margin: const EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 4),
            blurRadius: 6,
            color: const Color(0xFFB0CCE1).withOpacity(0.22),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => navigatorTo(
              context: context,
              routeName: AppRoutes.detailsStockRoute,
              arguments: title),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: kBodyText.copyWith(
                      color: secondColor, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: Text(
                    des,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: kBodyText.copyWith(color: kTextColor),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//?~> News list...................................................................
class NewsList extends StatelessWidget {
  const NewsList({super.key, required this.news});
  final List<News> news;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: news.length,
          itemBuilder: (context, index) => NewsCard(
              title: news[index].title.toString(),
              des: news[index].des.toString(),
              press: () {})),
    );
  }
}

//?~> buildDetailsAppBar...................................................................
AppBar buildDetailsAppBar(BuildContext context, {required String title}) {
  return AppBar(
    backgroundColor: kBackgroundColor,
    elevation: 0,
    title: Text(title, style: kBodyText.copyWith(color: kPrimaryColor)),
    leading: IconButton(
      icon: const Icon(
        Icons.arrow_back_ios,
        color: kPrimaryColor,
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    ),
    actions: <Widget>[
      IconButton(
        icon: SvgPicture.asset("assets/icons/search.svg"),
        onPressed: () {},
      ),
    ],
  );
}

/*
//! Search_box ..............................................................
class SearchBox extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const SearchBox({
    super.key,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: firstColor.withOpacity(0.32),
        ),
      ),
      child: TextField(
        onChanged: onChanged,
        decoration: const InputDecoration(
          border: InputBorder.none,
          icon: Icon(Iconsax.search_favorite2, color: Color(0XFF12192C)),
          hintText: "Search Here",
          hintStyle: TextStyle(color: firstColor),
        ),
      ),
    );
  }
}

//! sector item..............................................................
class ItemCard extends StatelessWidget {
  final String title, shopName, svgSrc;
  final void Function()? press;
  const ItemCard({
    super.key,
    required this.title,
    required this.shopName,
    required this.svgSrc,
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    // This size provide you the total height and width of the screen
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 4),
            blurRadius: 10,
            color: const Color(0xFFB0CCE1).withOpacity(0.32),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: press,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                Container(
                    margin: const EdgeInsets.only(bottom: 15),
                    padding: const EdgeInsets.all(25),
                    decoration: BoxDecoration(
                      color: secondColor.withOpacity(0.13),
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.network(
                      // https://www.svgrepo.com/show/475520/bank.svg"",
                      svgSrc,
                      width: size.width * 0.18,
                    )),
                Text(title),
                const SizedBox(height: 10),
                Text(
                  shopName,
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//! CategoryItem ...................................................................
class CategoryItem extends StatelessWidget {
  final String title;
  final bool isActive;
  static bool active = false;

  final void Function()? press;
  const CategoryItem({
    super.key,
    required this.title,
    this.isActive = false,
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          children: <Widget>[
            Text(
              title,
              style: isActive
                  ? const TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.bold,
                    )
                  : const TextStyle(fontSize: 12),
            ),
            if (isActive)
              Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                height: 3,
                width: 22,
                decoration: BoxDecoration(
                  color: firstColor,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

//! CategoryList ...................................................................
class CategoryList extends StatelessWidget {
  const CategoryList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CategoryItem(
            title: "Combo Meal",
            isActive: true,
            press: () {
              CategoryItem.active = true;
            },
          ),
          CategoryItem(
            title: "Chicken",
            press: () {},
          ),
          CategoryItem(
            title: "Beverages",
            press: () {},
          ),
          CategoryItem(
            title: "Snacks & Sides",
            press: () {},
          ),
        ],
      ),
    );
  }
}

//! Sectors list...................................................................
class ItemList extends StatelessWidget {
  const ItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          ItemCard(
            svgSrc: "https://www.svgrepo.com/show/475520/bank.svgvg",
            title: "Burger & Beer!",
            shopName: "MacDonald's",
            press: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) {
              //       // return DetailsScreen();
              //     },
              //   ),
              // );
            },
          ),
          ItemCard(
            svgSrc: "assets/icons/chinese_noodles.svg",
            title: "Chinese & Noodles",
            shopName: "Wendys",
            press: () {},
          ),
          ItemCard(
            svgSrc: "assets/icons/burger_beer.svg",
            title: "Burger & Beer",
            shopName: "MacDonald's",
            press: () {},
          )
        ],
      ),
    );
  }
}

//?~> StockCard ...................................................................
GestureDetector stockCard(BuildContext context,
    {required StockAtSectorModel stockAtSector}) {
  return GestureDetector(
    // onTap: () {
    //   debugPrint("onTap");
    //   Navigator.pushNamed(context, AppRoutes.detailsStockRoute);
    // },
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image.network() // Wrab with circle Avter...

          Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            //stockAtSector.price
            Text(stockAtSector.change100,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: firstColor, fontWeight: FontWeight.w600)),
            Text(stockAtSector.change,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: firstColor)),
          ]),
          const Spacer(),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            //stockAtSector.symbol
            Text(stockAtSector.symbol,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: textColor, fontWeight: FontWeight.w600)),
          ]),
          const SizedBox(width: 20),
          CircleAvatar(
            radius: 28,
            backgroundColor: firstColor.withOpacity(0.1),
          ),
        ],
      ),
    ),
  );
}
*/
GestureDetector stockCard(BuildContext context,
    {required StockAtSectorModel stockAtSector}) {
  return GestureDetector(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image.network() // Wrab with circle Avter...

          Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            //stockAtSector.price
            Text(stockAtSector.change100,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: firstColor, fontWeight: FontWeight.w600)),
            Text(stockAtSector.change,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: firstColor)),
          ]),
          const Spacer(),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            //stockAtSector.symbol
            Text(stockAtSector.symbol,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: textColor, fontWeight: FontWeight.w600)),
          ]),
          const SizedBox(width: 20),
          CircleAvatar(
            radius: 28,
            backgroundColor: firstColor.withOpacity(0.1),
          ),
        ],
      ),
    ),
  );
}
