abstract class AppStates {}

class AppInitState implements AppStates {}

class AuthAppChangeEmailState implements AppStates {}

class AuthAppChangeEmailForgetState implements AppStates {}

class AuthAppChangeUserNameState implements AppStates {}

class AuthAppChangePhoneState implements AppStates {}

class AuthAppChangePasswordState implements AppStates {}

class AuthAppChangePasswordCState implements AppStates {}

class AuthAppChangestockNoState implements AppStates {}

class AuthAppChangestockPriceState implements AppStates {}

//
//!~> forgetPassword  =============================================================<
class AuthforgetPasswordAppSuccessState extends AppStates {}

class AuthforgetPasswordAppErrorState extends AppStates {
  final String err;
  AuthforgetPasswordAppErrorState(this.err);
}

class AuthforgetPasswordApploadingState extends AppStates {}

//? !~> AuthWithEmail Login =============================================================<
class AuthLoginWithEmailAppSuccessState extends AppStates {
  // final String uId;
  // AuthLoginWithEmailAppSuccessState(this.uId);
}

class AuthLoginWithEmailAppErrorState extends AppStates {
  final String err;
  AuthLoginWithEmailAppErrorState(this.err);
}

class AuthLoginWithEmailApploadingState extends AppStates {}

//? !~> AuthWithGoogle =============================================================<
class AuthWithGoogleAppSuccessState extends AppStates {}

class AuthWithGoogleAppErrorState extends AppStates {
  final String err;
  AuthWithGoogleAppErrorState(this.err);
}

class AuthWithGoogleApploadingState extends AppStates {}

//?~> LoginWithFacebook_states.....................................................
class AuthWithFacebookApploadingState implements AppStates {}

class AuthWithFacebookAppSuccessState implements AppStates {}

class AuthWithFacebookAppErrorState implements AppStates {
  final String err;
  AuthWithFacebookAppErrorState({
    required this.err,
  });
}

//!X~> AuthWithEmail Regisster =============================================================<
class AuthRegisterAppSuccessState extends AppStates {}

class AuthRegisterAppErrorState extends AppStates {
  final String err;
  AuthRegisterAppErrorState(this.err);
}

class AuthRegisterApploadingState extends AppStates {}

class AuthpasswordConfirmErrorState extends AppStates {}

class AuthNoPhoneErrorState extends AppStates {}

class AuthcheckPasswordsErrorState extends AppStates {}

// //! StockApi .......................................
// class GetStockApiDatawSuccessState extends AppStates {}

// class GetStockApiDatawErrorState extends AppStates {
//   final String err;
//   GetStockApiDatawErrorState(this.err);
// }

// class GetStockApiDatawLoadingState extends AppStates {}

//!~> Add Arrow to fav
class AddArrowToFavSuccessState extends AppStates {}

class AddArrowToFollowSuccessState extends AppStates {}

class RemoveArrowToFavSuccessState extends AppStates {}

class RemoveArrowToFollowSuccessState extends AppStates {}

class AddArrowToFavExistState extends AppStates {}

// //? !Income chart StockApi .......................................
// class GetIncomeChartApiDatawSuccessState extends AppStates {}

// class GetBalanceSheetChartApiDatawSuccessState extends AppStates {}

// class GetCashFlowChartApiDatawSuccessState extends AppStates {}

// //
// class GetIncomeChartApiDatawErrorState extends AppStates {
//   final String err;
//   GetIncomeChartApiDatawErrorState(this.err);
// }

// class GetIncomeChartApiDatawLoadingState extends AppStates {}

// //? !  Stock inner sectors Api .......................................
// class GetStockInnerSectorSuccessState extends AppStates {}

// class GetStockInnerSectorErrorState extends AppStates {
//   final String err;
//   GetStockInnerSectorErrorState(this.err);
// }

// class GetStockInnerSectorLoadingState extends AppStates {}

//! fetchStocksAtSector ---------------------------------------------------
class FetchStocksAtSectorSuccessState extends AppStates {}

class FetchStocksAtSectorLoadingState extends AppStates {}

class FetchStocksAtSectorErrorState extends AppStates {
  final String err;
  FetchStocksAtSectorErrorState(this.err);
}

//! StockApi .......................................
class GetStockApiDataSuccessState extends AppStates {}

class GetStockApiDataErrorState extends AppStates {
  final String err;
  GetStockApiDataErrorState(this.err);
}

class GetStockApiDataLoadingState extends AppStates {}
