import 'dart:async';
import 'dart:math';
import 'package:app/models/sales_data_model.dart';
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
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

// class SalesDataYear {
//   SalesDataYear(this.year, this.sales);
//   final DateTime year;
//   final double sales;
// }

// class BarChart1 {
//   final String name;
//   final List<SalesData> data;
//   BarChart1(this.name, this.data);
// }

///~> getDaysInBetween-fun------------------------------------------------------
List<DateTime> getDaysInBetween(DateTime startDate, DateTime endDate) {
  List<DateTime> days = [];
  for (int i = 0; i <= endDate.difference(startDate).inDays; i++) {
    days.add(startDate.add(Duration(days: i)));
  }
  return days;
}

//ToDo: AppCubit-class..........................................................
class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitState());
  static AppCubit get(context) => BlocProvider.of(context);

  ///~> variables-----------------------------------------------------------------
  final _service = FirestoreHelper.instance;
  final _fireStore = FirestoreHelper.instance;
  var user = AuthHelper.instance.currentUser;

  DateTime whatDate = DateTime.now().add(const Duration(days: 8));
  List<DateTime> days = getDaysInBetween(
      DateTime.now(), DateTime.now().add(const Duration(days: 8)));

  String testVal = "Test";
  String userName = "";
  String email = "";
  String emailForget = "";
  String password = "";
  String uid_ = "";
  bool saving = false;
  String stockNo = "0";
  String stockPrice = "0";

  ///~> changeStockNo-------------------------------------------------------------
  void changeStockNo(String stockNoValue) {
    stockNo = stockNoValue;
    emit(AuthAppChangestockNoState());
  }

  ///~> changeStockPrice----------------------------------------------------------
  void changeStockPrice(String stockPriceValue) {
    stockPrice = stockPriceValue;
    emit(AuthAppChangestockPriceState());
  }

  ///~> changeEmail---------------------------------------------------------------
  void changeEmail(String emailValue) {
    email = emailValue;
    emit(AuthAppChangeEmailState());
  }

  ///~> changeEmailForget---------------------------------------------------------
  void changeEmailForget(String emailValue) {
    emailForget = emailValue;
    emit(AuthAppChangeEmailForgetState());
  }

  ///~> changeUserName------------------------------------------------------------
  void changeUserName(String userNameValue) {
    userName = userNameValue;
    emit(AuthAppChangeUserNameState());
  }

  ///~> changePassword------------------------------------------------------------
  void changePassword(String passwordValue) {
    password = passwordValue;
    emit(AuthAppChangePasswordState());
  }

  ///~> forgetPassword-fun--------------------------------------------------------
  void forgetPassword() {
    emit(AuthforgetPasswordApploadingState());
    AuthHelper.instance.passwordReset(emailForget).then((value) {
      debugPrint("forgetPassword Success ....!");
      emit(AuthforgetPasswordAppSuccessState());
    }).catchError((err) {
      debugPrint("forgetPassword Error ....!");
      emit(AuthforgetPasswordAppErrorState(err));
    });
  }

  ///~> loginWithEmail-fun--------------------------------------------------------
  void loginWithEmail() {
    emit(AuthLoginWithEmailApploadingState());
    AuthHelper.instance
        .loginWithEmailAndPassword(email, password)
        .then((value) async {
      debugPrint("login Success ....! :: $value");
      emit(AuthLoginWithEmailAppSuccessState()); //value.uid)
    }).catchError((err) {
      debugPrint("login Error ....!");
      emit(AuthLoginWithEmailAppErrorState(err.toString()));
    });
  }

  ///~> signinWithEmail-fun-------------------------------------------------------
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

  ///~> loginWithGoogle-fun-------------------------------------------------------
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

  ///~> registerWithEmail-fun-----------------------------------------------------
  void registerWithEmail() {
    // auth + firebase ...
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

  ///~> addArrowToFollowingArrow-fun----------------------------------------------
  Future<void> addArrowToFollowingArrow(StockModle stockModle) async {
    _fireStore.setData(
        path: 'users/${user?.uid}/followingArrow/${stockModle.id}',
        data: stockModle.toMapFoll());
    emit(AddArrowToFollowSuccessState());
  }

  ///~> addArrowToFavoriteArrow-fun-----------------------------------------------
  Future<void> addArrowToFavoriteArrow(StockModle stockModle) async {
    _fireStore.setData(
      path: 'users/${user?.uid}/favoriteArrow/${stockModle.id}',
      data: stockModle.toMapFav(),
    );
    emit(AddArrowToFavSuccessState());
  }

  bool isFavoriteArrow(String ramz) {
    return true;
  }

  ///~> getFollowingArrows-fun----------------------------------------------------
  Stream<List<StockModle>> getFollowingArrows() => _fireStore.collectionsStream(
      path: 'users/${user?.uid}/followingArrow/',
      builder: (data, documentId) => StockModle.fromMap(data!, documentId));
  getFavData() {
    _fireStore.documentsStream(
      path: 'users/${user?.uid}/favoriteArrow/',
      builder: (data, documentId) => StockModle.fromMap(data!, documentId),
    );
  }

  ///~> getFavoriteArrows-fun-----------------------------------------------------
  Stream<List<StockModle>> getFavoriteArrows() {
    return _fireStore.collectionsStream(
        path: 'users/${user?.uid}/favoriteArrow/',
        builder: (data, documentId) => StockModle.fromMap(data!, documentId));
  }

  ///~> deleteFollowingArrow-fun--------------------------------------------------
  void deleteFollowingArrow({required id}) {
    _fireStore.deleteData(path: 'users/${user?.uid}/followingArrow/$id');
    emit(RemoveArrowToFollowSuccessState());
  }

  ///~> deleteFollowingArrow-fun--------------------------------------------------
  void deleteFavoriteArrow({required id}) {
    _fireStore.deleteData(path: 'users/${user?.uid}/favoriteArrow/$id');
    emit(RemoveArrowToFavSuccessState());
  }

  ///~> getPriceNo-fun------------------------------------------------------------
  List<String> priceNo = [];
  getPriceNo({required String id}) {
    Stream<StockModle> stockModle = _fireStore.documentsStream(
        path: 'users/${user?.uid}/followingArrow/$id',
        builder: (data, documentId) => StockModle.fromMap(data!, documentId));

    debugPrint(stockModle.firstWhere((element) {
      debugPrint(element.ramz.toString());
      priceNo.add(element.price);
      priceNo.add(element.stocksNo);
      return true;
    }).toString());
    //  return  ;
  }

  ///~> stocksAtFavStreamInt-fun--------------------------------------------------
  Future<int> stocksAtFavStreamInt({required String ramz}) {
    return _service
        .collectionsStream(
          path: 'users/${user?.uid}/favoriteArrow/',
          builder: (data, documentId) => StockModle.fromMap(data!, documentId),
          queryBuilder: (query) => query.where('ramz', isEqualTo: ramz),
        )
        .length;
  }

  ///~> stocksAtFollowStream-fun--------------------------------------------------
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

  /*List<BarChart> groupSalesDataIncomeChart = [];
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
  }*/

  ///~> fetchStocksAtSectors-fun--------------------------------------------------
  List<StockModle> stocksAtSectors = [];
  void fetchStocksAtSectors({required String sectorName}) {
    emit(FetchStocksAtSectorLoadingState());
    DioHelper.getData(path: '/', queryParameters: {"stock": "$sectorName-2"})
        .then((value) {
      stocksAtSectors = [];
      var allData = jsonDecode(value.data); //value.datalength
      debugPrint(allData.runtimeType.toString());
      for (int i = 1; i < allData.length; i++) {
        stocksAtSectors.add(StockModle(
          id: DateTime.now().toIso8601String(),
          ramz: allData["$i"][0],
          logo: allData["$i"][12],
          name: allData["$i"][1],
          change: allData["$i"][3],
          price: allData["$i"][2],
        ));
      }

      debugPrint("\nlen: ${stocksAtSectors.length}**************************");
      emit(FetchStocksAtSectorSuccessState());
    }).catchError((err) {
      debugPrint("error at fetchStocksAtSectors: $err");
      emit(FetchStocksAtSectorErrorState(err.toString()));
    });
  }

  ///~> fetchStocksAtSectorscat-fun-----------------------------------------------
  List<StockModle> stocksAtSectorscat = [];
  void fetchStocksAtSectorscat({required String sectorName}) {
    emit(FetchStocksAtSectorLoadingState());
    DioHelper.getData(path: '/', queryParameters: {"stock": "$sectorName-2"})
        .then((value) {
      stocksAtSectorscat = [];
      var allData = jsonDecode(value.data); //value.datalength
      debugPrint(allData.runtimeType.toString());
      for (int i = 1; i < allData.length; i++) {
        stocksAtSectorscat.add(StockModle(
          id: DateTime.now().toIso8601String(),
          ramz: allData["$i"][0],
          logo: allData["$i"][13],
          name: allData["$i"][1],
          change: allData["$i"][4],
          price: allData["$i"][3],
        ));
      }

      debugPrint(
          "\nlen: ${stocksAtSectorscat.length}**************************");
      emit(FetchStocksAtSectorSuccessState());
    }).catchError((err) {
      debugPrint("error at fetchStocksAtSectors: $err");
      emit(FetchStocksAtSectorErrorState(err.toString()));
    });
  }

  ///~> fetchStockTimeline--------------------------------------------------------
  List<SalesData> chartData = [];
  void fetchStockTimeline({required String ramz, required int period}) {
    //{required String ramz}
    chartData = [];
    emit(FetchStockTimelineLoadingState());
    http
        .get(Uri.parse(
      // 'https://scrap-29ek.onrender.com/stock/abuk/7',
      'https://scrap-29ek.onrender.com/stock/$ramz/$period',
    ))
        .then((value) {
      // debugPrint(value.body); //jsonDecode
      var data = jsonDecode(value.body);
      debugPrint(data.runtimeType.toString()); //jsonDecode
      for (int i = 0; i < period; i++) {
        chartData.add(SalesData(data["data"][i][0], data["data"][i][5]));
      }
      debugPrint(chartData.length.toString());
      emit(FetchStockTimelineSuccessState());
    }).catchError((err) {
      debugPrint(err.toString());
      emit(FetchStockTimelineErrorState(err.toString()));
    });

    //var
    /*DioHelper.getData(path: '$ramz/30').then((value) {
      debugPrint(value.data.runtimeType.toString());
      debugPrint(value.data["data"].toString());
      for (int i = 0; i < 30; i++) {
        chartData.add(SalesDataYear(DateTime.parse(value.data["data"][i][0]),
            value.data["data"][i][5]));
      }
      emit(FetchStockTimelineSuccessState());
    }).catchError((err) {
      emit(FetchStockTimelineErrorState(err.toString()));
    });*/
  }

  ///~> fetchDetails--------------------------------------------------------------
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

  ///~> fetchChartsData-----------------------------------------------------------
// Fetch Chart one by one (income_statement, balance_sheet, cash_flow, dividends, dividened_payout_history, revenue, earning)
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

  late List<BarChart> incomeBarChartData1 = [],
      balanceSheetBarChartData1 = [],
      cashFlowBarChartData1 = [],
      divideBarChartData1 = [],
      revenueBarChartData1 = [],
      earningBarChartData1 = [];

  void fetchChartsData({required String ramz}) {
    emit(FetchIncomeChartLoadingState());
    DioHelper.getData(path: '/', queryParameters: {
      "stock": "$ramz-1" // "ABUK-1"
    }).then((value) {
      StockChartModel3 allData =
          StockChartModel3.fromJson(jsonDecode(value.data));

      fetchIncomeStatement(allData: allData);
      fetchBalanceSheet(allData: allData);
      fetchDividends(allData: allData);
      fetchCashFlow(allData: allData);
      fetchRevenue(allData: allData);
      fetchEarning(allData: allData);

      emit(FetchIncomeChartSuccessState());
    }).catchError((err) {
      debugPrint("error at fetchIncomeChart: $err");
      emit(FetchIncomeChartErrorState(err.toString()));
    });
  }

  fetchIncomeStatement({required StockChartModel3 allData}) {
    /// "total_revenue", "gross_profit", "operating_income", "pretax_income","net_income"
    List<double> categoriesTotalRevenue =
        (allData.incomeStatement!.totalRevenue as List)
            .map((item) => item as double)
            .toList();

    List<double> categoriesGrossProfit =
        (allData.incomeStatement!.grossProfit as List)
            .map((item) => item as double)
            .toList();

    List<double> categoriesOperatingIncome =
        (allData.incomeStatement!.operatingIncome as List)
            .map((item) => item as double)
            .toList();

    List<double> categoriesPretaxIncome =
        (allData.incomeStatement!.pretaxIncome as List)
            .map((item) => item as double)
            .toList();

    List<double> categoriesNetIncome =
        (allData.incomeStatement!.netIncome as List)
            .map((item) => item as double)
            .toList();

    for (int i = 0; i < allData.incomeStatement!.header!.length; i++) {
      ///~>1 Fetch arrays of data ...............................................................................................................................
      var valTotalRevenue = categoriesTotalRevenue[i],
          valGrossProfit = categoriesGrossProfit[i],
          valOperatingIncome = categoriesOperatingIncome[i],
          valPretaxIncome = categoriesPretaxIncome[i],
          valNetIncome = categoriesNetIncome[i];

      ///~>2 data arrays of data to SalesData...............................................................................................................................
      incomeSalesData1
          .add(SalesData(allData.incomeStatement!.header![i], valTotalRevenue));
      incomeSalesData2
          .add(SalesData(allData.incomeStatement!.header![i], valGrossProfit));
      incomeSalesData3.add(
          SalesData(allData.incomeStatement!.header![i], valOperatingIncome));
      incomeSalesData4
          .add(SalesData(allData.incomeStatement!.header![i], valPretaxIncome));
      incomeSalesData5
          .add(SalesData(allData.incomeStatement!.header![i], valNetIncome));

      debugPrint("${allData.incomeStatement!.header![i]} : $valTotalRevenue");
    }

    ///~>3 Add to group...............................................................................................................................
    incomeBarChartData1 = [
      BarChart('Total_revenue', incomeSalesData1),
      BarChart('Gross_profit', incomeSalesData2),
      BarChart('Operating_income', incomeSalesData3),
      BarChart('Pretax_income', incomeSalesData4),
      BarChart('Net_income', incomeSalesData5),
    ];
    debugPrint("Income Statement.... Done!");
  }

  fetchBalanceSheet({required StockChartModel3 allData}) {
    /// "totalAssets", "totalLiabilities"
    List<double> categoriesTotalAssets =
        (allData.balanceSheet!.totalAssets as List)
            .map((item) => item as double)
            .toList();

    List<double> categoriesTotalLiabilities =
        (allData.balanceSheet!.totalLiabilities as List)
            .map((item) => item as double)
            .toList();

    for (int i = 0; i < allData.balanceSheet!.header!.length; i++) {
      ///1~> Fetch arrays of data ...............................................................................................................................
      var valTotalAssets = categoriesTotalAssets[i],
          valTotalLiabilities = categoriesTotalLiabilities[i];

      ///2~> data arrays of dat a to SalesData...............................................................................................................................
      balanceSheetSalesData1
          .add(SalesData(allData.balanceSheet!.header![i], valTotalAssets));
      balanceSheetSalesData2.add(
          SalesData(allData.balanceSheet!.header![i], valTotalLiabilities));
    }

    ///3~> Add to group...............................................................................................................................
    balanceSheetBarChartData1 = [
      BarChart('Total assets', balanceSheetSalesData1),
      BarChart('Total liabilities', balanceSheetSalesData2),
    ];
    debugPrint("BalanceSheet.... Done!");
  }

  fetchDividends({required StockChartModel3 allData}) {
    /// "dividens_per_share",  "dividend_yield"
    List<double> categoriesDividensPerShare =
        (allData.dividends!.dividensPerShare as List)
            .map((item) => item as double)
            .toList();

    List<double> categoriesDividendYield =
        (allData.dividends!.dividendYield as List)
            .map((item) => item as double)
            .toList();

    for (int i = 0; i < allData.dividends!.header!.length; i++) {
      ///~>1 Fetch arrays of data ...............................................................................................................................
      var valDividensPerShare = categoriesDividensPerShare[i],
          valDividendYield = categoriesDividendYield[i];

      ///~>2 data arrays of data to SalesData...............................................................................................................................
      divideData1
          .add(SalesData(allData.dividends!.header![i], valDividensPerShare));
      divideData2
          .add(SalesData(allData.dividends!.header![i], valDividendYield));
    }

    ///~>3 Add to group...............................................................................................................................
    divideBarChartData1 = [
      BarChart('Dividends per share', divideData1),
    ];
    debugPrint("dividends.... Done!");
  }

  fetchCashFlow({required StockChartModel3 allData}) {
    /// cashFromFinancingActivity, cashFromInvestingActivity ,cashFromOperatingActivity
    List<double> categoriesCashFromFinancingActivity =
        (allData.cashFlow!.cashFromFinancingActivity as List)
            .map((item) => item as double)
            .toList();

    List<double> categoriesCashFromInvestingActivity =
        (allData.cashFlow!.cashFromInvestingActivity as List)
            .map((item) => item as double)
            .toList();

    List<double> categoriesCashFromOperatingActivity =
        (allData.cashFlow!.cashFromOperatingActivity as List)
            .map((item) => item as double)
            .toList();

    for (int i = 0; i < allData.cashFlow!.header!.length - 1; i++) {
      ///~>1 Fetch arrays of data ...............................................................................................................................
      var valToCashOperating = categoriesCashFromOperatingActivity[i];
      var valCashInvesting = categoriesCashFromInvestingActivity[i];
      var valCashFromFinancing = categoriesCashFromFinancingActivity[i];

      ///~>2 data arrays of data to SalesData...............................................................................................................................
      cashFlowSalesData1
          .add(SalesData(allData.cashFlow!.header![i], valToCashOperating));
      cashFlowSalesData2
          .add(SalesData(allData.cashFlow!.header![i], valCashInvesting));
      cashFlowSalesData3
          .add(SalesData(allData.cashFlow!.header![i], valCashFromFinancing));
    }

    ///~>3 Add to group...............................................................................................................................
    cashFlowBarChartData1 = [
      BarChart('Cash from operating activities', cashFlowSalesData1),
      BarChart('Cash from investing activities', cashFlowSalesData2),
      BarChart('Cash from financing activities', cashFlowSalesData3),
    ];
  }

  fetchRevenue({required StockChartModel3 allData}) {
    /// "reported_R", "estimate_R"
    List<double> categoriesEstimateR = (allData.revenue!.estimateR as List)
        .map((item) => item as double)
        .toList();

    List<double> categoriesReportedR = (allData.revenue!.reportedR as List)
        .map((item) => item as double)
        .toList();

    for (int i = 0; i < allData.revenue!.headerR!.length; i++) {
      ///~>1 Fetch arrays of data ...............................................................................................................................
      var valEstimateR = categoriesEstimateR[i],
          valReportedR = categoriesReportedR[i];

      ///~>2 data arrays of data to SalesData...............................................................................................................................
      revenueData1.add(SalesData(allData.revenue!.headerR![i], valEstimateR));
      revenueData2.add(SalesData(allData.revenue!.headerR![i], valReportedR));

      ///~>3 Add to group...............................................................................................................................
      revenueBarChartData1 = [
        BarChart('Reported_R', revenueData2),
        BarChart('Estimate_R', revenueData1),
      ];

      debugPrint("revenue.... Done!");
    }
  }

  fetchEarning({required StockChartModel3 allData}) {
    /// "reported_E", "estimate_E"
    List<double> categoriesEstimateE = (allData.earning!.estimateE as List)
        .map((item) => item as double)
        .toList();

    List<double> categoriesReportedE = (allData.earning!.reportedE as List)
        .map((item) => item as double)
        .toList();

    for (int i = 0; i < allData.revenue!.headerR!.length; i++) {
      ///~>1 Fetch arrays of data ...............................................................................................................................
      var valEstimateE = categoriesEstimateE[i],
          valReportedE = categoriesReportedE[i];

      ///~>2 data arrays of data to SalesData...............................................................................................................................
      earningData1.add(SalesData(allData.revenue!.headerR![i], valEstimateE));
      earningData2.add(SalesData(allData.revenue!.headerR![i], valReportedE));

      ///~>3 Add to group...............................................................................................................................
      earningBarChartData1 = [
        BarChart('Reported_E', earningData1),
        BarChart('Estimate_E', earningData2),
      ];

      debugPrint("revenue.... Done!");
    }
  }

  ///~> getData & getDataTime-----------------------------------------------------
  //1-> Create Stream Controler
  StockModelApi dataModel = StockModelApi();
  StreamController<StockModelApi> streamController = StreamController();

//2-> Get Data From Api
  Future<void> getData({required String ramz}) async {
    var url = Uri.parse(
        "https://20mccck65d.execute-api.ap-northeast-1.amazonaws.com/?stock=$ramz-0");
    final res = await http.get(url);
    final dataBody = json.decode(res.body);
    dataModel = StockModelApi.fromJson(dataBody);
    streamController.sink.add(dataModel);
    debugPrint("data: ${dataModel.stockMainApi!.stockPrice.toString()}");
  }

  Timer getDataTime({required String ramz}) {
    getData(ramz: ramz);
    return Timer.periodic(const Duration(minutes: 5), (timer) {
      getData(ramz: ramz);
    });
  }

  ///~> fetchPridictionData-----------------------------------------------------
  List<SalesData> chartData2 = [];
  List<dynamic> dataPridiction = [];
  void fetchPridictionData({required String ramz}) {
    days =
        getDaysInBetween(DateTime.now().add(const Duration(days: 1)), whatDate);
    chartData2 = [];
    dataPridiction = [];
    emit(FetchPridictionDataLoadingState());
    http
        .get(Uri.parse(
            'https://arima-y7ya.onrender.com/stock/$ramz/${days.length}'))
        .then((value) {
      dataPridiction = jsonDecode(value.body);
      debugPrint(dataPridiction.toString());
      debugPrint(dataPridiction.runtimeType.toString());

      days = getDaysInBetween(
          DateTime.now().add(const Duration(days: 1)), whatDate);
      for (int i = 1; i < days.length; i++) {
        chartData2.add(
            SalesData(DateFormat.yMMMEd().format(days[i]), dataPridiction[i]));
      }
      emit(FetchPridictionDataSuccessState());
    }).catchError((err) {
      emit(FetchPridictionDataErrorState(err.toString()));

      debugPrint(err.toString());
    });
  }
}
