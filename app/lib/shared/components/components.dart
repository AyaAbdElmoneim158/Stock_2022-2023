//!~> defaultButton >===========================<
import 'package:app/models/sector_model.dart';
import 'package:app/models/stock_model.dart';
import 'package:app/modules/coin.dart';
import 'package:app/shared/router/routes.dart';
import 'package:app/shared/styles/colors.dart';
import 'package:flutter/material.dart';

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
/*Widget defaultCard(context, ArrowModle arrowModle, void Function()? onPressed1,
    void Function()? onPressed2,
    {bool isheart = false, bool home = false}) {
//  static
// var  hear = isheart;
  return InkWell(
    onTap:() {
      // ignore: unnecessary_string_interpolations
      // DioHelper.getData(url: '${arrowModle.ramz}', query: {}).then((value) {
        // print(value.data.runtimeType);
        // print(json.decode(value.data).runtimeType);
// Navigator.of(context, rootNavigator: false).pushNamed(AppRoutes.arrowsDetailsRoute, arguments: value.data);
      }).catchError((err) {
        print("err getData");
      });
    },
    child: 
    SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(top: 15, bottom: 3),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Card(
              color: Theme.of(context).scaffoldBackgroundColor,

              // ColorsApp.green,

              elevation: 20,

              shadowColor: Theme.of(context).dividerColor,

              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Text(
                          //   r"${arrowModle.price} USE",
                          //   overflow: TextOverflow.ellipsis,
                          //   style: Theme.of(context).textTheme.bodySmall,
                          // ),
                          // Text(
                          //   r"${arrowModle.price} USE",
                          //   overflow: TextOverflow.ellipsis,
                          //   style: Theme.of(context)
                          //       .textTheme
                          //       .bodySmall!
                          //       .copyWith(color: Colors.green),
                          // ),
                        ]),
                    Row(children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              arrowModle.name,
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          ]),

                      /*Text(
  
                                "Image",
  
                                overflow:TextOverflow.ellipsis,
  
                                style: Theme.of(context).textTheme.bodyText1,
  
                              ),*/
                    ]),
                  ],
                ),
              ),
            ),
            Positioned(
              right: 15,
              bottom: 75,
              child: /*Image.network('',fit: BoxFit.cover,),*/

                  ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                child: Image.network(
                  arrowModle.logo,
                ),
              ),
            ),
            /*Positioned(
              left: 15,
              bottom: 65,
              child: home
                  ? Row(
                      children: [
                        IconButton(
                            icon: const Icon(
                              Icons.favorite,
                              color: Colors.red,
                            ),
                            onPressed: onPressed1),
                        IconButton(
                            icon: const Icon(Icons.add), onPressed: onPressed2),
                      ],
                    )
                  : isheart
                      ? IconButton(
                          icon: const Icon(
                            Icons.heart_broken,
                            color: Colors.red,
                          ),
                          onPressed: onPressed1)
                      : IconButton(
                          icon: const Icon(Icons.add), onPressed: onPressed2),
            ),*/
          ],
        ),
      ),
    ),
  );
}*/

//!~> defaultSector >===========================<
Widget defaultSector(context, SectorModle sectorModle, {int index = 0}) =>
    SizedBox(
      width: double.infinity,
      child: InkWell(
        onTap: () => Navigator.of(context, rootNavigator: false)
            .pushNamed(AppRoutes.stocksSectorRoute, arguments: sectorModle.name
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
