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

//! StockApi .......................................
class GetStockApiDatawSuccessState extends AppStates {}

class GetStockApiDatawErrorState extends AppStates {
  final String err;
  GetStockApiDatawErrorState(this.err);
}

class GetStockApiDatawLoadingState extends AppStates {}

//!~> Add Arrow to fav
class AddArrowToFavSuccessState extends AppStates {}

class AddArrowToFollowSuccessState extends AppStates {}

class RemoveArrowToFavSuccessState extends AppStates {}

class RemoveArrowToFollowSuccessState extends AppStates {}

class AddArrowToFavExistState extends AppStates {}
