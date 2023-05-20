import 'package:app/models/salesData_model.dart';
import 'package:app/models/sector_model.dart';
import 'package:app/models/stock_at_sector_model.dart';
import 'package:app/models/stock_model.dart';
import 'package:app/models/user_model.dart';
import 'package:app/shared/components/constants.dart';
import 'package:app/shared/cubit/states.dart';
import 'package:app/shared/network/remote/auth_helper.dart';
import 'package:app/shared/network/remote/dio_helper.dart';
import 'package:app/shared/network/remote/firestore_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:convert';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitState());
  static AppCubit get(context) => BlocProvider.of(context);
  final _service = FirestoreHelper.instance;
  final _fireStore = FirestoreHelper.instance;
  var user = AuthHelper.instance.currentUser;

  String userName = "";
  String email = "";
  String emailForget = "";

  String password = "";

  String uid_ = "";
  bool saving = false;
  String stockNo = "0";
  String stockPrice = "0";

  void changeStockNo(String stockNoValue) {
    stockNo = stockNoValue;
    emit(AuthAppChangestockNoState());
  }

  void changeStockPrice(String stockPriceValue) {
    stockPrice = stockPriceValue;
    emit(AuthAppChangestockPriceState());
  }

//!~> changeEmail ===========================================<
  void changeEmail(String emailValue) {
    email = emailValue;
    emit(AuthAppChangeEmailState());
  }

  void changeEmailForget(String emailValue) {
    emailForget = emailValue;
    emit(AuthAppChangeEmailForgetState());
  }

//!~> changeUserName ===========================================<
  void changeUserName(String userNameValue) {
    userName = userNameValue;
    emit(AuthAppChangeUserNameState());
  }

//!~> changePassword ===========================================<
  void changePassword(String passwordValue) {
    password = passwordValue;
    emit(AuthAppChangePasswordState());
  }

//!~> forgetPassword ===========================================<
  void forgetPassword() {
    //! ToDo:: no for get check email-feild is exist
    emit(AuthforgetPasswordApploadingState());

    AuthHelper.instance.passwordReset(emailForget).then((value) {
      debugPrint("forgetPassword Success ....!");
      emit(AuthforgetPasswordAppSuccessState());
    }).catchError((err) {
      debugPrint("forgetPassword Error ....!");
      emit(AuthforgetPasswordAppErrorState(err));
    });
  }

//? !~> loginWithEmail ===========================================<
  void loginWithEmail() {
    emit(AuthLoginWithEmailApploadingState());
    AuthHelper.instance
        .loginWithEmailAndPassword(email, password)
        .then((value) async {
      debugPrint(
          "login Success ....! :: $value"); // dfviIWpMuJPgz4eDoFmgFxTFnnP2
      emit(AuthLoginWithEmailAppSuccessState()); //value.uid)
    }).catchError((err) {
      debugPrint("login Error ....!");
      emit(AuthLoginWithEmailAppErrorState(err));
    });
  }

  void signinWithEmail() {
    emit(AuthLoginWithEmailApploadingState());

    AuthHelper.instance
        .loginWithEmailAndPassword(email, password)
        .then((value) async {
      emit(AuthRegisterAppSuccessState());
    }).catchError((err) {
      debugPrint("Register Email Error ....! $err");
      emit(AuthRegisterAppErrorState(err.toString()));
    });
  }

//? !~> loginWithGoogle ===========================================<
  void loginWithGoogle() {
    emit(AuthWithGoogleApploadingState());
    AuthHelper.instance.signInWithGoogle().then((value) {
      debugPrint("signInWithGoogle Success ....!");
      emit(AuthWithGoogleAppSuccessState());
    }).catchError((err) {
      debugPrint("signInWithGoogle Error ....!");
      emit(AuthWithGoogleAppErrorState(err));
    });
  }

//!~> MyBlocObserver_loginWithFacebook..............................................
  void loginWithFacebook() {
    emit(AuthWithFacebookApploadingState());
    AuthHelper.instance.signInWithFacebook().then((value) {
      debugPrint("signInWithFacebook Success ....!");
      emit(AuthWithFacebookAppSuccessState());
    }).catchError((err) {
      debugPrint("signInWithFacebook Error ....!");
      emit(AuthWithFacebookAppErrorState(err: err));
    });
  }

//!X~> registerWithEmail ===========================================<
  void registerWithEmail() {
    //! ToDo:: auth + firebase ...
    emit(AuthRegisterApploadingState());

    AuthHelper.instance
        .signUpWithEmailAndPassword(email, password)
        .then((value) async {
      await _service.setData(
        path: 'users/${value!.uid}',
        data: UserModle(
          email: email,
          name: userName,
          uId: value.uid,
        ).toMap(),
      );
      await FirebaseAuth.instance.currentUser?.updateDisplayName(userName);

      debugPrint(
          "Register Email Success ....! ${value.email} :: ${value.uid} :: ${value.displayName}");
      emit(AuthRegisterAppSuccessState());
    }).catchError((err) {
      debugPrint("Register Email Error ....! $err");
      emit(AuthRegisterAppErrorState(err.toString()));
    });
  }

//---------------------------------------------------------------------------------------------------------
//! addArrowToFollowingArrow from Floating action Btn =================<
  Future<void> addArrowToFollowingArrow(StockModle stockModle) async {
    _fireStore.setData(
        path: 'users/${user?.uid}/followingArrow/${stockModle.id}',
        data: stockModle.toMapFoll());
    emit(AddArrowToFollowSuccessState());
  }

//! addArrowToFavoriteArrow from Floating action Btn =================<
  Future<void> addArrowToFavoriteArrow(StockModle stockModle) async {
    _fireStore.setData(
      path: 'users/${user?.uid}/favoriteArrow/${stockModle.id}',
      data: stockModle.toMapFav(),
    );
    emit(AddArrowToFavSuccessState());
  }

  bool isFavoriteArrow(String ramz) {
    // _fireStore.collectionsStream(
    //   path: 'users/${user?.uid}/followingArrow/',
    // );
    // _fireStore.documentsStream(path: 'users/${user?.uid}/followingArrow/', builder: builder)
    // _fireStore.collectionsStream(
    //   path:'users/${user?.uid}/followingArrow/' ,
    //    builder:(data, documentId) => null,
    //    queryBuilder: )
    return true;
  }

//! getFollowingArrow ============================================<
  Stream<List<StockModle>> getFollowingArrows() => _fireStore.collectionsStream(
      path: 'users/${user?.uid}/followingArrow/',
      builder: (data, documentId) => StockModle.fromMap(data!, documentId));
  getFavData() {
    _fireStore.documentsStream(
      path: 'users/${user?.uid}/favoriteArrow/',
      builder: (data, documentId) => StockModle.fromMap(data!, documentId),
    );
  }
//! getFavoriteArrow ============================================<

  Stream<List<StockModle>> getFavoriteArrows() {
    return _fireStore.collectionsStream(
        path: 'users/${user?.uid}/favoriteArrow/',
        builder: (data, documentId) => StockModle.fromMap(data!, documentId));
  }

//! deleteFollowingArrow ============================================<
  void deleteFollowingArrow({required id}) {
    _fireStore.deleteData(path: 'users/${user?.uid}/followingArrow/$id');
    emit(RemoveArrowToFollowSuccessState());
  }

//! deleteFavoriteArrow ============================================<

  void deleteFavoriteArrow({required id}) {
    _fireStore.deleteData(path: 'users/${user?.uid}/favoriteArrow/$id');
    emit(RemoveArrowToFavSuccessState());
  }

// //! getStockDetails ============================================<
//   var stockDetails;
//   dynamic getStockDetails(String stockName) async {
//     emit(GetStockApiDatawLoadingState());
//     DioHelper.getData(
//       path: "test/",
//       queryParameters: {
//         "stock": "abuk-0"
//         // "$stockName-0"
//       },
//     ).then((value) {
//       stockDetails = value.data;
//       debugPrint("getAllStock sucess:: ${value.data}");
//     }).catchError((err) {
//       debugPrint("getAllStock error ::$err");
//     });
//   }

//   Map<String, dynamic> stockApiDataMap = {};
//   void getStockApiData(BuildContext context, String ramz) {
//     emit(GetStockApiDatawLoadingState());
//     // stockApiDataMap ={};
//     print("Before $stockApiDataMap");
//     DioHelper.getData(
//       path: "test/",
//       queryParameters: {
//         //"abuk-0"
//         "stock": "$ramz-0"
//       },
//     ).then((value) {
//       // stockApiDataMap["id"] = docmentIdFormLocationData();
//       stockApiDataMap["about"] = value.data["about"];
//       stockApiDataMap["logo"] = value.data["logo"];
//       stockApiDataMap["name"] = value.data["name"];
//       stockApiDataMap["price"] = value.data["price"];
//       stockApiDataMap["ramz"] = value.data["ramz"];
//       stockApiDataMap["news"] = value.data["news"];
//       print("After $stockApiDataMap");
//       emit(GetStockApiDatawSuccessState());
//     }).catchError((err) {
//       debugPrint("getStockApiData error ::$err");
//       emit(GetStockApiDatawErrorState(err));
//     });
//   }

//!~> priceStream ...................................
// var EndPrice ;
//   Stream<String> priceStream(BuildContext context,String ramz) async* {
//     while (true) {
//       await Future.delayed(const Duration(milliseconds: 500));
//       // Getted(context, ramz);
//       DioHelper.getData(
//     path: "http://localhost:5000/price",
//       queryParameters: {},
//     ).then((value) => {
//       EndPrice = value.data["price"]; //stockApi["price"];
//       print("I go to check,,,,");
//       yield EndPrice;
//     }).catchError((err){});

//     }
//   }

  //!~> Check fav || follow at Table
  // int lenAtFav = -2;
  Future<int> stocksAtFavStreamInt({required String ramz}) {
    return _service
        .collectionsStream(
          path: 'users/${user?.uid}/favoriteArrow/',
          builder: (data, documentId) => StockModle.fromMap(data!, documentId),
          queryBuilder: (query) => query.where('ramz', isEqualTo: ramz),
        )
        .length;
    //     .then((value) {
    //   lenAtFav = value.data;
    //   debugPrint(".........................................................");
    //   debugPrint("lenAtFav $lenAtFav");
    //   debugPrint(".........................................................");
    //   debugPrint("value $value");
    //   debugPrint(".........................................................");
    // }); //int.parse(len);

    // return lenAtFav;
  }

  // !~> Check fav || follow at Table
  Stream<List<StockModle>> stocksAtFollowStream({required String ramz}) =>
      _service.collectionsStream(
        path: 'users/${user?.uid}/followingArrow/',
        builder: (data, documentId) => StockModle.fromMap(data!, documentId),
        queryBuilder: (query) => query.where('ramz', isEqualTo: ramz),
      );
  Stream<List<StockModle>> stocksAtFavStream({required String ramz}) =>
      _service.collectionsStream(
        path: 'users/${user?.uid}/favoriteArrow/',
        builder: (data, documentId) => StockModle.fromMap(data!, documentId),
        queryBuilder: (query) => query.where('ramz', isEqualTo: ramz),
      );
  // // !~> getAllSectors ====================================================<
  // Stream<List<SectorModel>> getAllSectors() => _fireStore.collectionsStream(
  //     path: 'sectors/',
  //     builder: (data, documentId) => SectorModel.fromMap(data!, documentId));
  // // !~>  getAllStockInnerEachSector ====================================================<
  // Stream<List<StockModle>> getAllStockInnerEachSector({required String id}) =>
  //     _fireStore.collectionsStream(
  //         path: 'sectors/$id/stocks/',
  //         builder: (data, documentId) => StockModle.fromMap(data!, documentId));
//* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/*
   List<SalesData> salesData1 = [
      SalesData("Q4 '21", 1.24),
      SalesData("Q1 '22", 1.55),
      SalesData("Q2 '22", 2.35),
      SalesData("Q3 '22", 4.07),
      SalesData("Q4 '22", 2.65),
      SalesData("Q1 '23", 0),
      SalesData("Q2 '23", 0),
    ];
 */
// SalesData("2017", 25),
  // SalesData("2018", 38),
  // SalesData("2019", 44),
  // SalesData("2020", 38),
  // SalesData("2021", 14),
  List<BarChart> groupSalesDataIncomeChart = [];
  late List<SalesData> salesDataIncomeChart1 = [];
  late List<SalesData> salesDataIncomeChart2 = [];
  late List<SalesData> salesDataIncomeChart3 = [];
  late List<SalesData> salesDataIncomeChart4 = [];
  late List<SalesData> salesDataIncomeChart5 = [];

  List<BarChart> groupSalesDataBalanceSheetChart = [];
  late List<SalesData> salesDataBalanceSheetChart1 = [];
  late List<SalesData> salesDataBalanceSheetChart2 = [];

  List<BarChart> groupSalesDataCashFlowChart = [];
  late List<SalesData> salesDataCashFlowChart1 = [];
  late List<SalesData> salesDataCashFlowChart2 = [];
  late List<SalesData> salesDataCashFlowChart3 = [];

  List<dynamic> editText(List<dynamic> old) {
    List<dynamic> neww = [];
    for (var e in old) {
      // debugPrint(e);
      List<String> c = e.split("");
      c.removeLast();
      debugPrint(c.join());
      neww.add(double.parse(c.join()));
    }
    return neww;
  }

  List<SalesData> fullSalesData(
      List<SalesData> salesData, List<dynamic> l, List<dynamic> r) {
    for (var i = 0; i < r.length; i++) {
      salesData.add(SalesData(l[i], r[i]));
    }
    return salesData;
  }

//--------------------------------------------------------
  List<StockAtSectorModel> stocksAtSectors = [];
  void fetchStocksAtSectors({required String setcorName}) {
    emit(FetchStocksAtSectorLoadingState());
    DioHelper.getData(
        path: '/test',
        queryParameters: {"stock": "$setcorName-2"}).then((value) {
      var allData = value.data; //jsonDecode(value.data); length

      for (int i = 1; i < allData.length; i++) {
        stocksAtSectors.add(StockAtSectorModel(
            symbol: allData["$i"][0],
            price: allData["$i"][1],
            change: allData["$i"][2],
            change100: allData["$i"][3]));
      }
      debugPrint("len: ${stocksAtSectors.length}");
      emit(FetchStocksAtSectorSuccessState());
    }).catchError((err) {
      debugPrint("error at fetchStocksAtSectors: $err");
      emit(FetchStocksAtSectorErrorState(err));
    });
  }
//! Fetch Chart ....................................................................................
//https://20mccck65d.execute-api.ap-northeast-1.amazonaws.com/?stock=ABUK-1
  // Map<dynamic, dynamic> incomeChartApiDataMap = {};
  // List<SalesData> salesData1 = [];
//   void fetchChartApiData(BuildContext context) {
//     //?, String ramz
//     emit(GetIncomeChartApiDatawLoadingState());
//     DioHelper.getData(
//       path: "/",
//       queryParameters: {"stock": "ABUK-1"},
//     ).then((value) {
//       Map valueMap = jsonDecode(value.data);
//       // [2018, 2019, 2020, 2021, 2022, TTM]
//       // [7.55B, 8.58B, 7.88B, 8.84B, 16.33B, —]
// //? Data of income_statement============================================
//       //!  header..........................................................................
//       List<dynamic> headerIncome = valueMap["income_statement"]["header"];
//       headerIncome.removeAt(headerIncome.length - 1);
//       debugPrint(headerIncome.toString());
//       //!  total_revenue.....................................................................
//       List<dynamic> totalRevenue =
//           valueMap["income_statement"]["total_revenue"];
//       totalRevenue.removeAt(totalRevenue.length - 1);
//       debugPrint(totalRevenue.toString());
//       List<dynamic> newTotalRevenue = editText(totalRevenue);
//       debugPrint(newTotalRevenue.toString());
//       //!  gross_profit..................................................................
//       List<dynamic> grossProfit = valueMap["income_statement"]["gross_profit"];
//       grossProfit.removeAt(grossProfit.length - 1);
//       debugPrint(grossProfit.toString());
//       List<dynamic> newGrossProfit = editText(grossProfit);
//       debugPrint(newGrossProfit.toString());
//       //!  operating_income.....................................................................
//       List<dynamic> operatingIncome =
//           valueMap["income_statement"]["operating_income"];
//       operatingIncome.removeAt(operatingIncome.length - 1);
//       debugPrint(operatingIncome.toString());
//       List<dynamic> newOperatingIncome = editText(operatingIncome);
//       debugPrint(newOperatingIncome.toString());
//       //!  pretax_income..................................................................
//       List<dynamic> pretaxIncome =
//           valueMap["income_statement"]["pretax_income"];
//       pretaxIncome.removeAt(pretaxIncome.length - 1);
//       debugPrint(pretaxIncome.toString());
//       List<dynamic> newPretaxIncome = editText(pretaxIncome);
//       debugPrint(newPretaxIncome.toString());
//       //!  net_income.....................................................................
//       List<dynamic> netIncome = valueMap["income_statement"]["net_income"];
//       netIncome.removeAt(netIncome.length - 1);
//       debugPrint(netIncome.toString());
//       List<dynamic> newNetIncome = editText(netIncome);
//       debugPrint(newNetIncome.toString());
//       /*
// //? Data of balance_sheet ============================================
//       //!  header.....................................................................
//       List<dynamic> headerBalanceSheet = valueMap["balance_sheet"]["header"];
//       debugPrint(headerBalanceSheet.toString());
//       //!  total_assets.....................................................................
//       List<dynamic> newTotalAssets = editText(valueMap["balance_sheet"]
//           ["total_assets"]); // debugPrint(newTotalAssets.toString());
//       //!  total_liabilities.....................................................................
//       List<dynamic> newTotalLiabilities = editText(valueMap["balance_sheet"]
//           ["total_liabilities"]); // debugPrint(newTotalAssets.toString());
// //? Data of cash_flow ============================================
//       //!header..........................................................................
//       List<dynamic> headercashFlow = valueMap["cash_flow"]["header"];
//       headercashFlow.removeAt(headercashFlow.length - 1);
//       debugPrint(headercashFlow.toString());
//       //!cash_from_operating_activity..........................................................................
//       List<dynamic> cashFromOperatingActivity =
//           valueMap["cash_flow"]["cash_from_operating_activity"];
//       cashFromOperatingActivity.removeAt(cashFromOperatingActivity.length - 1);
//       debugPrint(cashFromOperatingActivity.toString());
//       List<dynamic> newcashFromOperatingActivity =
//           editText(cashFromOperatingActivity);
//       debugPrint(newcashFromOperatingActivity.toString());
//       //!cash_from_investing_activity..........................................................................
//       List<dynamic> cashFromInvestingActivity =
//           valueMap["cash_flow"]["cash_from_investing_activity"];
//       cashFromInvestingActivity.removeAt(cashFromInvestingActivity.length - 1);
//       debugPrint(cashFromInvestingActivity.toString());
//       List<dynamic> newcashFromInvestingActivity =
//           editText(cashFromInvestingActivity);
//       debugPrint(newcashFromInvestingActivity.toString());
//       //!cash_from_financing_activity..........................................................................
//       List<dynamic> cashFromFinancingActivity =
//           valueMap["cash_flow"]["cash_from_financing_activity"];
//       cashFromFinancingActivity.removeAt(cashFromFinancingActivity.length - 1);
//       debugPrint(cashFromFinancingActivity.toString());
//       List<dynamic> newcashFromFinancingActivity =
//           editText(cashFromFinancingActivity);
//       debugPrint(newcashFromFinancingActivity.toString());
// */
// //******************************************************************************************
//       //? full_Chart_IncomeChart.....................................................................
//       salesDataIncomeChart1 =
//           fullSalesData(salesDataIncomeChart1, headerIncome, newTotalRevenue);
//       salesDataIncomeChart2 =
//           fullSalesData(salesDataIncomeChart2, headerIncome, newGrossProfit);
//       salesDataIncomeChart3 = fullSalesData(
//           salesDataIncomeChart3, headerIncome, newOperatingIncome);
//       salesDataIncomeChart4 =
//           fullSalesData(salesDataIncomeChart4, headerIncome, newPretaxIncome);
//       salesDataIncomeChart5 =
//           fullSalesData(salesDataIncomeChart5, headerIncome, newNetIncome);

//       groupSalesDataIncomeChart = [
//         BarChart1('Total revenue', salesDataIncomeChart1),
//         BarChart1('gross_profit', salesDataIncomeChart2),
//         BarChart1('operating_income', salesDataIncomeChart3),
//         BarChart1('pretax_income', salesDataIncomeChart4),
//         BarChart1('new_net_income', salesDataIncomeChart5),
//       ];
//       emit(GetIncomeChartApiDatawSuccessState());
//       /*     //? full_Chart_BalanceSheet.....................................................................
//       salesDataBalanceSheetChart1 = fullSalesData(
//           salesDataBalanceSheetChart1, headerBalanceSheet, newTotalAssets);
//       salesDataBalanceSheetChart2 = fullSalesData(
//           salesDataBalanceSheetChart2, headerBalanceSheet, newTotalLiabilities);
//       groupSalesDataBalanceSheetChart = [
//         BarChart1('Total assets', salesDataBalanceSheetChart1),
//         BarChart1('Total liabilities', salesDataBalanceSheetChart2),
//       ];
//       emit(GetBalanceSheetChartApiDatawSuccessState());

//       //? full_cash_flow.....................................................................
//       // salesDataCashFlowChart1 = fullSalesData(
//       //     salesDataCashFlowChart1, headercashFlow, cashFromOperatingActivity);
//       // salesDataCashFlowChart2 = fullSalesData(
//       //     salesDataCashFlowChart2, headercashFlow, cashFromInvestingActivity);
//       // salesDataCashFlowChart3 = fullSalesData(
//       //     salesDataCashFlowChart3, headercashFlow, cashFromFinancingActivity);

//       groupSalesDataCashFlowChart = [
//         BarChart1('Cash from operating activities', salesDataCashFlowChart1),
//         BarChart1('Cash from investing activities', salesDataCashFlowChart2),
//         BarChart1('Cash from financing activities', salesDataCashFlowChart2),
//       ];
//       emit(GetCashFlowChartApiDatawSuccessState());*/
//     }).catchError((err) {
//       debugPrint("getIncomeChartApiData error ::$err");
//       emit(GetIncomeChartApiDatawErrorState(err));
//     });

  // stockApiDataMap ={};
  // print("Before $incomeChartApiDataMap");//"$ramz-1"//"abuk-0"
  /**/
  // print("After $valueMap.... ${valueMap.runtimeType}");
  /*incomeChartApiDataMap = valueMap;*/
  // debugPrint(
  //     incomeChartApiDataMap["income_statement"]["headerIncome"].toString());
  // debugPrint(incomeChartApiDataMap["income_statement"]["total_revenue"]
  //     .toString());
  /* List<dynamic> header =
          incomeChartApiDataMap["income_statement"]["header"];
      header.removeAt(header.length - 1);
      debugPrint(header.toString());
      List<dynamic> total_revenue =
          incomeChartApiDataMap["income_statement"]["total_revenue"];
      total_revenue.removeAt(total_revenue.length - 1);
      debugPrint(total_revenue.toString());*/

// [2018, 2019, 2020, 2021, 2022, TTM]
// [7.55B, 8.58B, 7.88B, 8.84B, 16.33B, —]
  //
  /* List<dynamic> new_total_revenue = [];
      for (var e in total_revenue) {
        // debugPrint(e);
        List<String> c = e.split("");
        c.removeLast();
        debugPrint(c.join());
        // e = ;
        new_total_revenue.add(double.parse(c.join()));
        // e.last()
        // double.parse(e.replaceAll("B", ""));
        // c.toString());
      }
      // .map((e) => );
      // e = double.parse(e.replace("B", "")));
      // e.substring(0, 2)
      // ); replaceAll(houseNumber, '')
      debugPrint(new_total_revenue.toString());*/

  // debugPrint(total_revenue.toString());
  /*  for (var i = 0; i < header.length - 1; i++) {
        salesData1.add(SalesData(header[i], new_total_revenue[i]));
      }
      debugPrint(salesData1.toString());
      emit(GetIncomeChartApiDatawSuccessState());
    }).catchError((err) {
      debugPrint("getIncomeChartApiData error ::$err");
      emit(GetIncomeChartApiDatawErrorState(err));
    });*/
}

// //! Fetch   "balance_sheet_Chart ....................................................................................
//   void fetchBalanceSheetChartApiData(BuildContext context) {
//     emit(GetBalanceSheetChartApiDatawLoadingState());
//     //! req ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//     DioHelper.getData(
//       path: "/",
//       queryParameters: {"stock": "ABUK-1"},
//     ).then((value) {
//     //! getMap ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//       Map valueMap = jsonDecode(value.data);
//       //!  header..........................................................................
//       List<dynamic> header = valueMap["income_statement"]["header"];
//       header.removeAt(header.length - 1);
//       debugPrint(header.toString());

//       emit(GetBalanceSheetChartApiDatawSuccessState());
//     }).catchError((err) {
//       debugPrint("getBalanceSheetChartApiData error ::$err");

//       emit(GetBalanceSheetChartApiDatawErrorState(err));
//     });
//   }

//! Fetch StockInnerSector ..........................................................................................
//https://ou8m3oozn4.execute-api.ap-northeast-1.amazonaws.com/default/test?stock=Finance-2

//   List<StockModleSmall> allStockInnerSector = [];
//   void fetchStockInnerSector() {
//     emit(GetStockInnerSectorLoadingState());
//     DioHelper.getData(path: "/", queryParameters: {"stock": "Finance-2"})
//         .then((value) {
//       // debugPrint(value.data.toString());
//       // debugPrint(value.data.runtimeType.toString());
//       Map valueMap = jsonDecode(value.data);
//       debugPrint(valueMap.runtimeType.toString());
//       // debugPrint(valueMap.keys.last.toString()); //76

//       debugPrint(valueMap["1"][0]); //Symbol
//       debugPrint(valueMap["1"][2]); //Price
//       debugPrint(valueMap["1"][3]); //Change % 1D

//       for (var i = 1; i < 76; i++) {
//         //int.parse(valueMap.keys.last)
//         // valueMap["$i"][0]; //Symbol
//         // valueMap["$i"][2]; //Price
//         // valueMap["$i"][3]; //Change % 1D
//         StockModleSmall stockSmall = StockModleSmall(
//             symbol: valueMap[i.toString()][0],
//             price: valueMap[i.toString()][2],
//             change: valueMap[i.toString()][3]);
//         allStockInnerSector.add(stockSmall);
//         debugPrint("$i");
//       }
//       debugPrint(allStockInnerSector.length.toString());

//       emit(GetStockInnerSectorSuccessState());
//     }).catchError((err) {
//       emit(GetStockInnerSectorErrorState(err));
//     });
//   }
// }
/*
ignore: unnecessary_string_interpolations
      DioHelper.getData(url: '${arrowModle.ramz}', query: {}).then((value) {
        print(value.data.runtimeType);
        print(json.decode(value.data).runtimeType);
Navigator.of(context, rootNavigator: false).pushNamed(AppRoutes.arrowsDetailsRoute, arguments: value.data);
      }).catchError((err) {
        print("err getData");
      });
//  */
// The argument type 'List<SalesData> (where SalesData
//is defined in E:\5.Graduation project\2.Stock_project\Stock_2022-2023\app\lib\shared\cubit\cubit.dart)'
//can't be assigned to the parameter type 'List<SalesData> (where SalesData is defined in E:\5.Graduation project\2.Stock_project\Stock_2022-2023\app\lib\models\salesData_model.dart)'.
