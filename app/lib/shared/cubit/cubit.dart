import 'package:app/models/sector_model.dart';
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

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitState());
  static AppCubit get(context) => BlocProvider.of(context);
  final _service = FirestoreHelper.instance;
  final _fireStore = FirestoreHelper.instance;
  var user = AuthHelper.instance.currentUser;

  String userName = "";
  String email = "";
  String emailForget = "";

  String phone = "";
  String password = "";
  String confirmPassword = "";
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

//!~> changePhone ===========================================<
  void changePhone(String phoneValue) {
    phone = phoneValue;
    emit(AuthAppChangePhoneState());
  }

//!~> changePassword ===========================================<
  void changePassword(String passwordValue) {
    password = passwordValue;
    emit(AuthAppChangePasswordState());
  }

//!~> changePasswordC ===========================================<
  void changePasswordC(String passwordCValue) {
    confirmPassword = passwordCValue;
    emit(AuthAppChangePasswordCState());
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
        .then((value) {
      debugPrint(
          "login Success ....! :: $value"); // dfviIWpMuJPgz4eDoFmgFxTFnnP2
      emit(AuthLoginWithEmailAppSuccessState()); //value.uid)
    }).catchError((err) {
      debugPrint("login Error ....!");
      emit(AuthLoginWithEmailAppErrorState(err));
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

//!X~> registerWithEmail ===========================================<
  void registerWithEmail() {
    //! ToDo:: auth + firebase ...
    emit(AuthRegisterApploadingState());
    if (phone.length != 11) {
      emit(AuthNoPhoneErrorState());
    } else {
      password == confirmPassword
          ? AuthHelper.instance
              .signUpWithEmailAndPassword(email, password)
              .then((value) async {
              uid_ = value!.uid;
              UserModle userData = UserModle(
                email: email,
                name: userName,
                phone: phone,
                uId: value
                    .uid, //?? docmentIdFormLocationData(),// password: password
              );

              await _service.setData(
                path: 'users/$uid_',
                data: userData.toMap(),
              );
              //  final user =
              await FirebaseAuth.instance.currentUser
                  ?.updateDisplayName(userName);
              debugPrint(
                  "Register Email Success ....! ${value.email} :: ${value.uid} :: ${value.displayName}");
              emit(AuthRegisterAppSuccessState());
            }).catchError((err) {
              debugPrint("Register Email Error ....! $err");
              emit(AuthRegisterAppErrorState(err.toString()));
            })
          : emit(AuthcheckPasswordsErrorState());
    }
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

//! getStockDetails ============================================<
  var stockDetails;
  dynamic getStockDetails(String stockName) async {
    emit(GetStockApiDatawLoadingState());
    DioHelper.getData(
      path: "test/",
      queryParameters: {
        "stock": "abuk-0"
        // "$stockName-0"
      },
    ).then((value) {
      stockDetails = value.data;
      debugPrint("getAllStock sucess:: ${value.data}");
    }).catchError((err) {
      debugPrint("getAllStock error ::$err");
    });
  }

  Map<String, dynamic> stockApiDataMap = {};
  void getStockApiData(BuildContext context, String ramz) {
    emit(GetStockApiDatawLoadingState());
    // stockApiDataMap ={};
    print("Before $stockApiDataMap");
    DioHelper.getData(
      path: "test/",
      queryParameters: {
        //"abuk-0"
        "stock": "$ramz-0"
      },
    ).then((value) {
      // stockApiDataMap["id"] = docmentIdFormLocationData();
      stockApiDataMap["about"] = value.data["about"];
      stockApiDataMap["logo"] = value.data["logo"];
      stockApiDataMap["name"] = value.data["name"];
      stockApiDataMap["price"] = value.data["price"];
      stockApiDataMap["ramz"] = value.data["ramz"];
      stockApiDataMap["news"] = value.data["news"];
      print("After $stockApiDataMap");
      emit(GetStockApiDatawSuccessState());
    }).catchError((err) {
      debugPrint("getStockApiData error ::$err");
      emit(GetStockApiDatawErrorState(err));
    });
  }

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
  // !~> getAllSectors ====================================================<
  Stream<List<SectorModle>> getAllSectors() => _fireStore.collectionsStream(
      path: 'sectors/',
      builder: (data, documentId) => SectorModle.fromMap(data!, documentId));
  // !~>  getAllStockInnerEachSector ====================================================<
  Stream<List<StockModle>> getAllStockInnerEachSector({required String id}) =>
      _fireStore.collectionsStream(
          path: 'sectors/$id/stocks/',
          builder: (data, documentId) => StockModle.fromMap(data!, documentId));
}
/*
ignore: unnecessary_string_interpolations
      DioHelper.getData(url: '${arrowModle.ramz}', query: {}).then((value) {
        print(value.data.runtimeType);
        print(json.decode(value.data).runtimeType);
Navigator.of(context, rootNavigator: false).pushNamed(AppRoutes.arrowsDetailsRoute, arguments: value.data);
      }).catchError((err) {
        print("err getData");
      });
 */
