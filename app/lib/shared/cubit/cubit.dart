import 'package:app/models/sales_data_model.dart';
import 'package:app/models/stock_at_sector_model.dart';
import 'package:app/models/stock_chart_model.dart';
import 'package:app/models/stock_model.dart';
import 'package:app/models/user_model.dart';
import 'package:app/shared/cubit/states.dart';
import 'package:app/shared/network/remote/auth_helper.dart';
import 'package:app/shared/network/remote/dio_helper.dart';
import 'package:app/shared/network/remote/firestore_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:convert';

class SalesDataYear {
  SalesDataYear(this.year, this.sales);
  final DateTime year;
  final double sales;
}

class BarChart1 {
  final String name;
  final List<SalesData> data;
  BarChart1(this.name, this.data);
}

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
      emit(AuthLoginWithEmailAppErrorState(err.toString()));
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

//*~> fetchStocksAtSectors --------------------------------------------------------
  List<StockAtSectorModel> stocksAtSectors = [];
  void fetchStocksAtSectors({required String sectorName}) {
    emit(FetchStocksAtSectorLoadingState());
    DioHelper.getData(path: '/', queryParameters: {"stock": "$sectorName-2"})
        .then((value) {
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

//!~> fetchStocksAtSectors --------------------------------------------------------
  List<SalesDataYear> chartData = [];
  void fetchStockTimeline({required String ramz}) {
    emit(FetchStockTimelineLoadingState());
    DioHelper.getData(path: '$ramz/30').then((value) {
      debugPrint(value.data.runtimeType.toString());
      debugPrint(value.data["data"].toString());
      for (int i = 0; i < 30; i++) {
        chartData.add(SalesDataYear(DateTime.parse(value.data["data"][i][0]),
            value.data["data"][i][5]));
      }
      emit(FetchStockTimelineSuccessState());
    }).catchError((err) {
      emit(FetchStockTimelineErrorState(err.toString()));
    });
  }

//*~> Fetch stock Details..................................................................
  StockModelApi details = StockModelApi();
  void fetchDetails({required String ramz}) {
    emit(FetchDetailsLoadingState());
    DioHelper.getData(
            path: '/', queryParameters: {'stock': '$ramz-0'}) //'ABUK-0'
        .then((value) {
      // debugPrint(value.data);
      details = StockModelApi.fromJson(json.decode(value.data));
      debugPrint('details... ${details.ramz} ');
      // debugPrint(value.data.runtimeType.toString());
      // debugPrint(json.decode(value.data).runtimeType.toString());
      emit(FetchDetailsSuccessState());
    }).catchError((err) {
      debugPrint('error fetchDetsils ... $err ');
      emit(FetchDetailsErrorState(err.toString()));
    });
  }

//*~> Fetch Chart one by one (income_statement, balance_sheet, cash_flow, dividends, dividened_payout_history, revenue, earning)
  List<SalesData> incomeSalesData1 = [],
      incomeSalesData2 = [],
      incomeSalesData3 = [],
      incomeSalesData4 = [],
      incomeSalesData5 = [],
      balanceSheetSalesData1 = [],
      balanceSheetSalesData2 = [],
      cashFlowSalesData1 = [],
      cashFlowSalesData2 = [],
      cashFlowSalesData3 = [],
      divideData1 = [],
      divideData2 = [],
      revenueData1 = [],
      revenueData2 = [],
      earningData1 = [],
      earningData2 = [];

  late List<BarChart1> incomeBarChartData1 = [],
      balanceSheetBarChartData1 = [],
      cashFlowBarChartData1 = [],
      divideBarChartData1 = [],
      revenueBarChartData1 = [],
      earningBarChartData1 = [];

  void fetchChartsData({required String ramz}) {
    emit(FetchIncomeChartLoadingState());
    DioHelper.getData(path: '/', queryParameters: {
      "stock": "ABUK-1"
      // "$ramz-1"
    }).then((value) {
      // debugPrint(value.data.runtimeType.toString());debugPrint(jsonDecode(value.data).runtimeType.toString());

      var allData = StockChartModel.fromJson(jsonDecode(value.data));
      // debugPrint(allData.incomeStatement!.header.toString());
      // final endIndexIncomeStatementtotalRevenue =allData.incomeStatement!.totalRevenue![i].indexOf("B", 0);
//? Fetch Income Statement ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      for (int i = 0; i < allData.incomeStatement!.header!.length - 1; i++) {
        // Fetch arrays of data ...............................................................................................................................
        var valTotalRevenue = double.parse(
                allData.incomeStatement!.totalRevenue![i].substring(0,
                    allData.incomeStatement!.totalRevenue![i].indexOf("B", 0))),
            valGrossProfit = double.parse(allData.incomeStatement!.grossProfit![i].substring(
                0, allData.incomeStatement!.grossProfit![i].indexOf("B", 0))),
            valOperatingIncome = double.parse(
                allData.incomeStatement!.operatingIncome![i].substring(
                    0,
                    allData.incomeStatement!.operatingIncome![i]
                        .indexOf("B", 0))),
            valPretaxIncome =
                double.parse(allData.incomeStatement!.pretaxIncome![i].substring(0, allData.incomeStatement!.pretaxIncome![i].indexOf("B", 0))),
            valNetIncome = double.parse(allData.incomeStatement!.netIncome![i].substring(0, allData.incomeStatement!.netIncome![i].indexOf("B", 0)));
        // data arrays of data to SalesData...............................................................................................................................
        incomeSalesData1.add(
            SalesData(allData.incomeStatement!.header![i], valTotalRevenue));
        incomeSalesData2.add(
            SalesData(allData.incomeStatement!.header![i], valGrossProfit));
        incomeSalesData3.add(
            SalesData(allData.incomeStatement!.header![i], valOperatingIncome));
        incomeSalesData4.add(
            SalesData(allData.incomeStatement!.header![i], valPretaxIncome));
        incomeSalesData5
            .add(SalesData(allData.incomeStatement!.header![i], valNetIncome));

        debugPrint("${allData.incomeStatement!.header![i]} : $valTotalRevenue");
      }
      // Add to group...............................................................................................................................
      incomeBarChartData1 = [
        BarChart1('Total revenue', incomeSalesData1),
        BarChart1('Gross profit', incomeSalesData2),
        BarChart1('Operating income', incomeSalesData3),
        BarChart1('Pretax income', incomeSalesData4),
        BarChart1('Net income', incomeSalesData5),
      ];
      debugPrint("Income Statement.... Done!");
//? Fetch BalanceSheet ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

      for (int i = 0; i < allData.balanceSheet!.header!.length; i++) {
        // final endIndexBalanceSheettotalAssets =allData.balanceSheet!.totalAssets![i].indexOf("B", 0);
        // Fetch arrays of data ...............................................................................................................................
        var valTotalAssets = double.parse(allData.balanceSheet!.totalAssets![i]
                .substring(
                    0, allData.balanceSheet!.totalAssets![i].indexOf("B", 0))),
            valTotalLiabilities = double.parse(
                allData.balanceSheet!.totalLiabilities![i].substring(
                    0,
                    allData.balanceSheet!.totalLiabilities![i]
                        .indexOf("B", 0)));
        // data arrays of data to SalesData...............................................................................................................................
        balanceSheetSalesData1
            .add(SalesData(allData.balanceSheet!.header![i], valTotalAssets));
        balanceSheetSalesData2.add(
            SalesData(allData.balanceSheet!.header![i], valTotalLiabilities));
      }
      // Add to group...............................................................................................................................
      balanceSheetBarChartData1 = [
        BarChart1('Total assets', balanceSheetSalesData1),
        BarChart1('Total liabilities', balanceSheetSalesData2),
      ];
      debugPrint("BalanceSheet.... Done!");

//? Fetch dividends ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

      for (int i = 0; i < allData.dividends!.header!.length; i++) {
        // Fetch arrays of data ...............................................................................................................................
        var valDividensPerShare =
                double.parse(allData.dividends!.dividensPerShare![i]),
            valDividendYield =
                double.parse(allData.dividends!.dividendYield![i]);

        // data arrays of data to SalesData...............................................................................................................................
        divideData1
            .add(SalesData(allData.dividends!.header![i], valDividensPerShare));
        divideData2
            .add(SalesData(allData.dividends!.header![i], valDividendYield));
      }
      // Add to group...............................................................................................................................
      divideBarChartData1 = [
        BarChart1('Dividends per share', divideData1),
        // BarChart1('Total liabilities', divideData2),
      ];
      debugPrint("dividends.... Done!");

//? Fetch revenue ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

      /*    for (int i = 0; i < allData.revenue!.estimateR!.length; i++) {
        List<String> header = [
          "2015",
          "2016",
          "2017",
          "2018",
          "2019",
          "2020",
          "2021",
          "2022",
          "2023",
          "2024",
          "2025",
          "2026",
        ];
        // Fetch arrays of data ...............................................................................................................................
        var valReportedR = double.parse(allData.revenue!.estimateR![i] != "—"?
        allData.revenue!.reportedR![i]
                .substring(
                    0,
                    allData.balanceSheet!.totalLiabilities![i]
                        .indexOf("B", 0)): '0'),
            valEstimateR = double.parse(allData.revenue!.estimateR![i] != "—"
                ? allData.revenue!.estimateR![i].substring(0,
                    allData.balanceSheet!.totalLiabilities![i].indexOf("B", 0))
                : '0');

        // data arrays of data to SalesData...............................................................................................................................
        revenueData1.add(SalesData(header[i], valReportedR));
        revenueData2.add(SalesData(header[i], valEstimateR));
      }
      // Add to group...............................................................................................................................
      revenueBarChartData1 = [
        BarChart1('Reported', revenueData1),
        BarChart1('Estimate', revenueData2),
      ];

      debugPrint("revenue.... Done!");*/

//? Fetch estimateE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

      /*for (int i = 0; i < allData.earning!.estimateE!.length; i++) {
        List<String> header = [
          // 10 -> 12
          "2015",
          "2016",
          "2017",
          "2018",
          "2019",
          "2020",
          "2021",
          "2022",
          "2023",
          "2024",
          // "2025",
          // "2026",
        ];
        // Fetch arrays of data ...............................................................................................................................
        var valReportedE = double.parse(allData.revenue!.estimateR![i] != "—"
                ? allData.earning!.reportedE![i]
                : '0'),
            valEstimateE = double.parse(allData.revenue!.estimateR![i] != "—"
                ? allData.earning!.estimateE![i]
                : '0');

        // data arrays of data to SalesData...............................................................................................................................
        earningData1.add(SalesData(header[i], valReportedE));
        earningData2.add(SalesData(header[i], valEstimateE));
      }
      // Add to group...............................................................................................................................
      earningBarChartData1 = [
        BarChart1('Reported', earningData1),
        BarChart1('Estimate', earningData2),
      ];
      debugPrint("estimateE.... Done!");*/

// //********************************************************************************************
//       // "header":........................["2018","2019","2020","2021","2022","TTM"],
//       // Cash from operating activities....["2.40B","2.79B","2.42B","2.58B","9.85B","—"],CashOperating
//       // Cash from investing activities....["−1.13B","−1.56B","−260.53M","−701.23M","−4.65B","—"],CashInvesting
//       // Cash from financing activities....["−1.59B","−1.66B","−1.98B","−1.84B","−3.24B","—"],CashFinancing
      /* for (int i = 0; i < allData.cashFlow!.header!.length - 1; i++) {
        final endIndecCashFlowtoCashOperating =
            allData.cashFlow!.cashFromOperatingActivity![i].indexOf("B", 0);
        var valToCashOperating = double.parse(allData
            .cashFlow!.cashFromOperatingActivity![i]
            .substring(0, endIndecCashFlowtoCashOperating));

        final endIndecCashFlowCashInvesting =
            allData.cashFlow!.cashFromInvestingActivity![i].indexOf("B", 0);
        var valCashInvesting = double.parse(allData
            .cashFlow!.cashFromInvestingActivity![i]
            .substring(0, endIndecCashFlowCashInvesting));

        final endIndecCashFlowCashFinancing =
            allData.cashFlow!.cashFromFinancingActivity![i].indexOf("B", 0);
        var valoperatingIncome = double.parse(allData
            .cashFlow!.cashFromFinancingActivity![i]
            .substring(0, endIndecCashFlowCashFinancing));

        cashFlowSalesData1
            .add(SalesData(allData.cashFlow!.header![i], valToCashOperating));
        cashFlowSalesData2
            .add(SalesData(allData.cashFlow!.header![i], valCashInvesting));
        cashFlowSalesData3
            .add(SalesData(allData.cashFlow!.header![i], valoperatingIncome));
      }
      cashFlowBarChartData1 = [
        BarChart1('Cash from operating activities', cashFlowSalesData1),
        BarChart1('Cash from investing activities', cashFlowSalesData2),
        BarChart1('Cash from financing activities', cashFlowSalesData3),
      ];*/

      emit(FetchIncomeChartSuccessState());
    }).catchError((err) {
      debugPrint("error at fetchIncomeChart: $err");
      emit(FetchIncomeChartErrorState(err));
    });
  }
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
