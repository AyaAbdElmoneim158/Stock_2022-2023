//ToDo: AppStates-class.........................................................
abstract class AppStates {}

///~> AuthAppChange-class-------------------------------------------------------

class AppInitState implements AppStates {}

class AuthAppChangeEmailState implements AppStates {}

class AuthAppChangeEmailForgetState implements AppStates {}

class AuthAppChangeUserNameState implements AppStates {}

class AuthAppChangePhoneState implements AppStates {}

class AuthAppChangePasswordState implements AppStates {}

class AuthAppChangePasswordCState implements AppStates {}

class AuthAppChangestockNoState implements AppStates {}

class AuthAppChangestockPriceState implements AppStates {}

///~> AuthforgetPasswordApp-states----------------------------------------------
class AuthforgetPasswordAppSuccessState extends AppStates {}

class AuthforgetPasswordAppErrorState extends AppStates {
  final String err;
  AuthforgetPasswordAppErrorState(this.err);
}

class AuthforgetPasswordApploadingState extends AppStates {}

///~> AuthLoginWithEmail-states-------------------------------------------------
class AuthLoginWithEmailAppSuccessState extends AppStates {}

class AuthLoginWithEmailAppErrorState extends AppStates {
  final String err;
  AuthLoginWithEmailAppErrorState(this.err);
}

class AuthLoginWithEmailApploadingState extends AppStates {}

///~> AuthWithGoogleApp-states--------------------------------------------------
class AuthWithGoogleAppSuccessState extends AppStates {}

class AuthWithGoogleAppErrorState extends AppStates {
  final String err;
  AuthWithGoogleAppErrorState(this.err);
}

class AuthWithGoogleApploadingState extends AppStates {}

///~> AuthRegisterApp-states----------------------------------------------------
class AuthRegisterAppSuccessState extends AppStates {}

class AuthRegisterAppErrorState extends AppStates {
  final String err;
  AuthRegisterAppErrorState(this.err);
}

class AuthRegisterApploadingState extends AppStates {}

///~> AddArrow && RemoveArrow-states--------------------------------------------
class AddArrowToFavSuccessState extends AppStates {}

class AddArrowToFollowSuccessState extends AppStates {}

class RemoveArrowToFavSuccessState extends AppStates {}

class RemoveArrowToFollowSuccessState extends AppStates {}

class AddArrowToFavExistState extends AppStates {}

///~> GetStockApiData-states----------------------------------------------------
class GetStockApiDataSuccessState extends AppStates {}

class GetStockApiDataErrorState extends AppStates {
  final String err;
  GetStockApiDataErrorState(this.err);
}

class GetStockApiDataLoadingState extends AppStates {}

///~> FetchStocksAtSector-states------------------------------------------------
class FetchStocksAtSectorSuccessState extends AppStates {}

class FetchStocksAtSectorLoadingState extends AppStates {}

class FetchStocksAtSectorErrorState extends AppStates {
  final String err;
  FetchStocksAtSectorErrorState(this.err);
}

///~> FetchDetails-states-------------------------------------------------------
class FetchDetailsSuccessState extends AppStates {}

class FetchDetailsLoadingState extends AppStates {}

class FetchDetailsErrorState extends AppStates {
  final String err;
  FetchDetailsErrorState(this.err);
}

///~> FetchStockTimeline-states-------------------------------------------------
class FetchStockTimelineSuccessState extends AppStates {}

class FetchStockTimelineLoadingState extends AppStates {}

class FetchStockTimelineErrorState extends AppStates {
  final String err;
  FetchStockTimelineErrorState(this.err);
}

///~> FetchIncomeChart-states---------------------------------------------------
class FetchIncomeChartSuccessState extends AppStates {}

class FetchIncomeChartLoadingState extends AppStates {}

class FetchIncomeChartErrorState extends AppStates {
  final String err;
  FetchIncomeChartErrorState(this.err);
}

///~> FetchPridictionData-states------------------------------------------------
class FetchPridictionDataSuccessState extends AppStates {}

class FetchPridictionDataLoadingState extends AppStates {}

class FetchPridictionDataErrorState extends AppStates {
  final String err;
  FetchPridictionDataErrorState(this.err);
}
