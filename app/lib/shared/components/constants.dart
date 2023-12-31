// flutter build ios --release  , flutter build apk --release
// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app/models/sector_model.dart';
import 'package:app/shared/styles/colors.dart';

String key = "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";
/*
Top 10 recommended stocks (30 day predictions):
IRAX (predicted 30 day return: 1047.49, MSE: 19.90, RMSE: 4.46, MAE: 2.51, R2: 1.00)
MIPH (predicted 30 day return: 198.68, MSE: 0.92, RMSE: 0.96, MAE: 0.44, R2: 1.00)
MFPC (predicted 30 day return: 179.50, MSE: 0.25, RMSE: 0.50, MAE: 0.32, R2: 1.00)
WCDF (predicted 30 day return: 148.00, MSE: 0.96, RMSE: 0.98, MAE: 0.47, R2: 1.00)
UEFM (predicted 30 day return: 145.00, MSE: 0.68, RMSE: 0.82, MAE: 0.42, R2: 1.00)
EDFM (predicted 30 day return: 139.98, MSE: 0.54, RMSE: 0.73, MAE: 0.42, R2: 1.00)
AXPH (predicted 30 day return: 135.21, MSE: 0.56, RMSE: 0.75, MAE: 0.45, R2: 1.00)
ORAS (predicted 30 day return: 102.02, MSE: 0.17, RMSE: 0.41, MAE: 0.30, R2: 1.00)
GSSC (predicted 30 day return: 91.20, MSE: 0.53, RMSE: 0.73, MAE: 0.27, R2: 1.00)
OCPH (predicted 30 day return: 90.00, MSE: 0.51, RMSE: 0.72, MAE: 0.27, R2: 1.00)
 */

/*
large_cap
large_cap,small_cap,
largest_employers,
high_dividend,
highest_net_income,
highest_cash,
top_gainers,
biggest_loser,
most_active,
unusual_volume,
most_volatile,
high_beta,
best_performing,
highest_revenue,
most_expensive,
penny_stocks,
overbought,
oversold,
alltime_high,
alltime_low,
52_week_high,
52_week_low 
 */

/*
*/
// String totalRevenue = lang ? 'إجمالي الإيرادات' :'total_revenue';
List graphsTrans = [
  {
    'income_statement': 'بيانات الدخل',
    'total_revenue': 'إجمالي الإيرادات',
    'cost_of_goods_sold': 'تكلفه السلع المباعه',
    'gross_profit': 'الربح الإجمالي',
    'operating_expenses': 'مصاريف التشغيل',
    'operating_income': 'دخل التشغيل',
    'nonOperating_income': 'الدخل غير التشغيلي',
    'pretax_income': 'الدخل قبل الضرائب',
    'equity_in_earnings': 'حقوق الملكية في الأرباح',
    'taxes': 'الضرائب',
    'nonControllingMinority_interest': 'حقوق الأقلية غير المسيطرة',
    'after_tax_other_income_expense': 'الدخل/المصروفات الأخرى بعد الضريبة',
    'net_income_before_discontinued_operations':
        'صافي الدخل قبل العمليات المتوقفة',
    'discontinued_operations': 'العمليات المتوقفة',
    'net_income': 'صافي الدخل',
    'dilution_adjustment': 'تعديل التخفيف',
    'preferred_dividends': 'توزيعات أرباح الأسهم الممتازة',
    'diluted_net_income_available_to_common_stockholders':
        'صافي الدخل المخفف المتاح للمساهمين العاديين',
    'basic_EPS': 'ربحية السهم الأساسية',
    'diluted_EPS': 'ربحية السهم المخففة',
    'average_basic_shares_outstanding': 'متوسط الأسهم الأساسية القائمة',
    'diluted_shares_outstanding': 'الأسهم المخففة القائمة',
    'EBITDA': 'الأرباح قبل خصم ضرائب الفائدة والاستهلاك والتخفيف',
    'EBIT': 'النمو السنوي(EBIT)',
    'total_operating_expenses': 'إجمالي النفقات التشغيلية'
  },
  {
    'balance_sheet': 'بيان الموازنه',
    'total_assets': 'إجمالي الأصول',
    'total_liabilities': 'إجمالي المطلوبات',
    'total_equity': 'إجمالي حقوق المساهمين',
    'total_liabilities_and_shareholders': 'إجمالي المطلوبات وحقوق المساهمين',
    'total_debt': 'إجمالي المديونية',
    'net_debt': 'صافي الدين',
    'book_value_per_share': 'القيمة الدفترية للسهم'
  },
  {
    'cash_flow': 'التدفقات النقديه',
    'cash_from_operating_activity': 'العائد النقدي من الأنشطة التشغيلية',
    'cash_from_investing_activity': 'العائد النقدي من الأنشطة الاستثمارية',
    'cash_from_financing_activity': 'العائد النقدي من الأنشطة المالية',
    'free_cash_flow': 'التدفق النقدي الحر'
  },
  {
    'dividends': 'ارباح',
    'dividens_per_share': 'توزيعات الأرباح لكل سهم (سنة مالية)',
    'dividend_yield': 'عائد توزيعات الأرباح (السنة المالية) %',
    'payout_ratio': 'نسبة الدفع (السنة المالية) %'
  },
  {
    'earning': 'العائد لكل سهم',
    'reported_E': 'مُبلّغ عنه',
    'estimate_E': 'المتوقع',
    'surprise_E': 'مفاجأة'
  },
  {
    'revenue': 'الايرادات',
    'reported_R': 'مُبلّغ عنه',
    'estimate_R': 'المتوقع',
    'surprise_R': 'المتوقع'
  },
];

//!~> getMessageFromErrorCode...................................................
String getMessageFromErrorCode({required errorCode}) {
  switch (errorCode) {
//? signInWithEmailAndPassword -------------------------------------------------
    //* case 'wrong-password': return '';
    //* case 'invalid-email': return '';
    //* case 'user-disabled': return '';
    //* case 'user-not-found': return '';

//? createUserWithEmailAndPassword -------------------------------------------------
    //* case 'email-already-in-use': return '';
    // case 'invalid-email': return '';
    //* case 'operation-not-allowed': return '';
    //* case 'weak-password': return '';

//? signInWithCredential -------------------------------------------------
    //* case 'account-exists-with-different-credential': return '';
    //* case 'invalid-credential': return '';
    // case 'operation-not-allowed': return '';
    // case 'user-disabled': return '';
    // case 'user-not-found': return '';
    // case 'wrong-password': return '';
    //* case 'invalid-verification-code': return '';
    //* case 'invalid-verification-id': return '';

//? eauthenticateWithCredential -------------------------------------------------
    //* case 'user-mismatch': return '';
    // case 'user-not-found': return '';
    // case 'invalid-credential': return '';
    // case 'invalid-email': return '';
    // case 'wrong-password': return '';
    // case 'invalid-verification-code': return '';
    // case 'invalid-verification-id': return '';

//? signInWithAuthProvider -------------------------------------------------
    // case 'user-disabled': return '';

//? signInAnonymously -------------------------------------------------
    // case 'operation-not-allowed': return '';

//? signInWithEmailLink -------------------------------------------------
    //* case 'expired-action-code': return '';
    // case 'invalid-email': return '';
    // case 'user-disabled': return '';

    case "ERROR_EMAIL_ALREADY_IN_USE":
    case "account-exists-with-different-credential":
    case "email-already-in-use":
      return Constants.case1;
    case "ERROR_WRONG_PASSWORD":
    case "wrong-password":
      return Constants.case2;
    case "ERROR_USER_NOT_FOUND":
    case "user-not-found":
      return Constants.case3;
    case "ERROR_USER_DISABLED":
    case "user-disabled":
      return Constants.case4;
    case "ERROR_TOO_MANY_REQUESTS":
    case "operation-not-allowed":
      return Constants.case5;
    case "ERROR_OPERATION_NOT_ALLOWED":
      return Constants.case6;
    case "ERROR_INVALID_EMAIL":
    case "invalid-email":
      return Constants.case7;

    default:
      return Constants.case8;
  }
}

class Category {
  String categoryAr;
  String categoryEn;
  Category({
    required this.categoryAr,
    required this.categoryEn,
  });
}

List<Category> fackCategory = [
  Category(categoryAr: 'الشركات العملاقة', categoryEn: 'large_cap'),
  Category(categoryAr: 'الشركات الصغيرة', categoryEn: 'small_cap'),
  Category(categoryAr: 'أكبر المشغلين', categoryEn: 'largest_employers'),
  Category(
      categoryAr: 'أعلى عائد لتوزيعات الأرباح', categoryEn: 'high_dividend'),
  Category(categoryAr: 'أعلى صافي دخل', categoryEn: 'highest_net_income'),
  Category(categoryAr: 'أعلى نقدية', categoryEn: 'highest_cash'),
  Category(categoryAr: 'الأكثر ارتفاعًا', categoryEn: 'top_gainers'),
  Category(categoryAr: 'أكبر الخاسرين', categoryEn: 'biggest_loser'),
  Category(categoryAr: 'الأكثر نشاطًا', categoryEn: 'most_active'),
  Category(categoryAr: 'زخم غير اعتيادي', categoryEn: 'unusual_volume'),
  Category(categoryAr: 'الأكثر تذبذبًا', categoryEn: 'most_volatile'),
  Category(categoryAr: 'بيتا عالية', categoryEn: 'high_beta'),
  Category(categoryAr: 'الأفضل أداءً', categoryEn: 'best_performing'),
  Category(categoryAr: 'أكبر الإيرادات', categoryEn: 'highest_revenue'),
  Category(categoryAr: 'الأعلى سعراً', categoryEn: 'most_expensive'),
  Category(categoryAr: 'الأسهم المنخفضة السعر', categoryEn: 'penny_stocks'),
  Category(categoryAr: 'تشبع شرائي', categoryEn: 'overbought'),
  Category(categoryAr: 'تشبع بيعي', categoryEn: 'oversold'),
  Category(categoryAr: 'أعلى سعر على الإطلاق', categoryEn: 'alltime_high'),
  Category(categoryAr: 'الأكثر إنخفاضا على الإطلاق', categoryEn: 'alltime_low'),
  Category(
      categoryAr: 'أقصى ارتفاع للسعر خلال 52 أسبوع',
      categoryEn: '52_week_high'),
  Category(
      categoryAr: 'أدنى مستوى للسعر خلال 52 أسبوع', categoryEn: '52_week_low'),
];

bool lang = true;
bool theme = true;
String docmentIdFormLocationData() => DateTime.now().toIso8601String();

abstract class Constants {
  static String incomeStatement = !lang ? 'income_statement' : 'بيانات الدخل';
  static String totalRevenue = lang ? 'إجمالي الإيرادات' : 'total_revenue';
  static String netIncome = !lang ? 'net_income' : 'صافي الدخل';
  static String pretaxIncome = !lang ? 'pretax_income' : 'الدخل قبل الضرائب';
  static String operatingIncome = !lang ? 'operating_income' : 'دخل التشغيل';
  static String grossProfit = !lang ? 'gross_profit' : 'الربح الإجمالي';

  static String balanceSheet = !lang ? 'balance_sheet' : 'بيان الموازنه';
  static String totalAssets = !lang ? 'total_assets' : 'إجمالي الأصول';
  static String totalLiabilities =
      !lang ? 'total_liabilities' : 'إجمالي المطلوبات';

  static String dividends = !lang ? 'dividends' : 'ارباح';
  static String dividensPerShare =
      !lang ? 'dividens_per_share' : 'توزيعات الأرباح لكل سهم (سنة مالية)';

  static String cashFlow = !lang ? 'cash_flow' : 'التدفقات النقديه';
  static String cashFromOperatingActivity = !lang
      ? 'cash_from_operating_activity'
      : 'العائد النقدي من الأنشطة التشغيلية';
  static String cashFromInvestingActivity = !lang
      ? 'cash_from_investing_activity'
      : 'العائد النقدي من الأنشطة الاستثمارية';
  static String cashFromFinancingActivity = !lang
      ? 'cash_from_financing_activity'
      : 'العائد النقدي من الأنشطة المالية';

  static String earning = !lang ? 'earning' : 'العائد لكل سهم';
  static String reportedE = !lang ? 'reported_E' : '_مُبلّغ عنه';
  static String estimateE = !lang ? 'estimate_E' : 'المتوقع';

  static String revenue = !lang ? 'revenue' : 'الايرادات';
  static String reportedR = !lang ? 'reported_R' : 'مُبلّغ عنه';
  static String estimateR = !lang ? 'estimate_R' : 'المتوقع';

  ///---------------------------------------------------
  static String err = lang ? 'حدث خطأ' : 'Error..!';
  static String success = lang ? 'تم نجاح العملية' : 'Successful..!';
  static String checkEmail =
      lang ? "تحقق من بريدك الإلكتروني" : "Check your Email ";
  static String successSign = lang
      ? "Registration proccess has been successful"
      : "تم عمليه التسجيل بنجاح";
  // ----------------
  static String noInternet =
      lang ? 'لا يوجد اتصال بالإنترنت' : 'no internet connection';
  //? Handel-error-firbase ****************************************************************
  // message: getMessageFromErrorCode(errorCode: state.err),

  static String case1 = lang
      ? "البريد الإلكتروني مستخدم بالفعل. انتقل إلى صفحة تسجيل الدخول."
      : "Email already used. Go to login page.";
  static String case2 = lang
      ? "تركيبة خاطئة بين البريد الإلكتروني وكلمة المرور."
      : "Wrong email/password combination.";
  static String case3 = lang
      ? "لم يتم العثور على مستخدم بهذا البريد الإلكتروني."
      : "No user found with this email.";
  static String case4 = lang ? "المستخدم معطل" : "User disabled.";
  static String case5 = lang
      ? "هناك عدد كبير جدًا من الطلبات لتسجيل الدخول إلى هذا الحساب."
      : "Too many requests to log into this account.";
  static String case6 = lang
      ? "خطأ في الخادم ، يرجى المحاولة مرة أخرى في وقت لاحق."
      : "Server error, please try again later.";
  static String case7 =
      lang ? "عنوان البريد الإلكتروني غير صالح." : "Email address is invalid.";
  static String case8 = lang
      ? "فشل تسجيل الدخول. يرجى المحاولة مرة أخرى."
      : "Login failed. Please try again.";
  static List<Map<String, dynamic>> onboaringData = [
    {
      'image':
          'https://cdn3d.iconscout.com/3d/premium/thumb/stock-market-profit-8268826-6594786.png',
      // 'https://cdn3d.iconscout.com/3d/premium/thumb/stock-research-7252794-5914997.png',
      // 'https://ouch-cdn2.icons8.com/yIxQmzj1OHH3S9AiIgelaTGdpj3wApWqSqFh80arSEA/rs:fit:784:828/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9wbmcvMTMx/L2NmOGIzZmY4LWRh/YjEtNDdiMS1hZGQ4/LWFkMTUwZTQwNzIx/NC5wbmc.png',
      'text': onboardingText1,
      'textColor': AppColors.textColor,
      'btnColor': AppColors.secondColor,
    },
    {
      'image':
          'https://cdn3d.iconscout.com/3d/premium/thumb/stock-market-growth-8268827-6594787.png',
      // 'https://cdn3d.iconscout.com/3d/premium/thumb/stock-market-investment-5768786-4833583.png',
      //'https://ouch-cdn2.icons8.com/oEXWmNUZgj3vd_T5XSJe2dTB1GFWIBeJ1QEqRWw76O8/rs:fit:784:748/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9wbmcvMzM1/L2Q3MjMyYzJlLTk0/NTMtNDUzMC1iZTEx/LWQ2MDZiN2RjYmFm/Yy5wbmc.png',
      'text': onboardingText2,
      'textColor': AppColors.whiteColor,
      'btnColor': AppColors.whiteColor //,
    },
    {
      'image':
          'https://cdn3d.iconscout.com/3d/premium/thumb/trade-graph-6780336-5580788.png',
      // 'https://cdn3d.iconscout.com/3d/premium/thumb/stock-exchange-6020107-4974984.png',
      //'https://ouch-cdn2.icons8.com/g8bZd-d4qiYuomOBWh3x61II6HlK8Ir2zp_a2cFTcCA/rs:fit:784:784/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9wbmcvNDI4/LzdjMjEyYjgzLTg0/NjQtNDQzMS04NzAz/LTNkNzk1YmUyMzli/MC5wbmc.png',
      'text': onboardingText3,
      'textColor': AppColors.whiteColor,
      'btnColor': AppColors.firstColor,
    }
  ];

  static const double roundCorner = 0.03;
  static const double padding = 0.04;
  static const double sizedBox = 0.05;
//!~> AppAssets: ============================================================<
  static const String onboardingImg1 =
      "https://cdn3d.iconscout.com/3d/premium/thumb/stock-analytics-5233669-4379879.png?f=avif";
  static const String onboardingImg2 =
      "https://cdn3d.iconscout.com/3d/premium/thumb/stock-analytics-5233669-4379879.png?f=avif";
  static const String onboardingImg3 =
      "https://cdn3d.iconscout.com/3d/premium/thumb/stock-candlestick-chart-analysis-5233673-4379883.png?f=avif";
  static const String forgetPasswordWithEmailImg = "";
  static const String forgetPasswordWithPhoneImg = "";
  static const String forgetPasswordCredentialsImg = "";
  static const String forgetPasswordUpdatedImg = "";

//!~> AppStrings: =====================================<
  static String splashText = lang
      ? " وفر واستثمر في اكبر الشركات "
      : "Save and invest in the largest companies";
  static String onboardingText1 = lang
      ? "معانا البورصه اسهل واضمن حتي وان لم يكن لديك خبره سابقه"
      : "With us, the stock market is easier and more secure, even if you do not have previous experience.";
  static String onboardingText2 = lang
      ? "ترشيح افضل 5 اسهم ستزداد في الفتره القادمه"
      : "The nomination of the best 5 stocks will increase in the coming period";
  static String onboardingText3 = lang
      ? "تحليل كامل لكل سهم علي مدار خمس سنوات سابقه"
      : "A full analysis of each stock over the past five years";
  static String getStartedBtn = lang ? "Get started" : "البدء";
  static String nextBtn = lang ? "Next" : "التالي";
  static String loginTitle = lang ? " تسجيل الدخول " : " sign in ";
  static String loginBtn = lang ? "تسجيل الدخول" : " sign in";
  static String googleText =
      lang ? "الدخول بايميل جوجل" : "  Sign in with google";
  static String passedHere = lang ? "اضغط هنا" : "press here";
  static String toRegister =
      lang ? " ليس لديك حساب؟   " : " Don't have an account? ";
  static String toLogin = lang ? "لديك حساب بالفعل؟ " : " Have an account? ";
  static String register = lang ? "تسجل حساب جديد" : "Register a new account";
  static String registerBtn = lang ? " تسجل الحساب " : "account register";

  static String nameFeild = lang ? "اسم المستخدم" : "User Name";
  static String enterNameFeild =
      lang ? " قم بادخال اسم المستخدم " : "Enter User Name";
  static String emailFeild = lang ? "الايميل" : "Email";
  static String phoneFeild = lang ? "الهاتف" : "Phone";
  static String passwordFeild = lang ? "كلمة المرور" : "Password";
  static String confirmPasswordFeild =
      lang ? "تأكيد كلمة المرور" : "Confirm Password";
  static String nameFeildAlert =
      lang ? "الرجاء أدخل اسم المستخدم" : "Please enter your username";
  static String emailFeildAlert =
      lang ? "الرجاء أدخل الايميل" : "Please enter your email";
  static String phoneFeildAlert =
      lang ? "الرجاء أدخل كلمة المرور" : "Please enter the phone";
  static String passwordFeildAlert =
      lang ? "الرجاء أدخل كلمة المرور" : "please Enter password";
  static String confirmPasswordFeildAlert =
      lang ? "الرجاء تأكيد كلمة المرور" : "Please confirm the password";
  static String forgetPasswordSelection =
      lang ? "قم بالاختيار" : "Make a selection";
  static String forgetPasswordSelectionDes = lang
      ? "حدد تفاصيل الاتصال التي يجب أن نستخدمها لإعادة تعيين كلمة المرور الخاصة بك؟"
      : "Specify the contact details we should use to reset your password?";
  static String forgetPasswordWithEmail =
      lang ? "هل نسيت كلمة السر " : "Forgot your password ? ";
  static String forgetPasswordWithEmailDes = lang
      ? "تقديم البريد الإلكتروني لحسابك أثناء رغبتك في إعادة تعيين كلمة المرور الخاصة بك !"
      : "Provide your account email when you want to reset your password!";
  static String forgetPasswordWithPhone = lang ? "تَحَقّق" : "Verification";
  static String forgetPasswordWithPhoneDes = lang
      ? "أدخل كلمة المرور لمرة واحدة المرسلة على +20"
      : "enter one time password sent on +20";
  static String forgetPasswordWithPhoneBtn =
      lang ? "التحقق من كود" : "verify code";
  static String forgetPasswordCredentials =
      lang ? "أوراق اعتماد جديدة" : "New credentials";
  static String forgetPasswordCredentialsDes = lang
      ? "تم التحقق من هويتك! أدخل كلمة المرور الجديدة الخاصة بك"
      : "Your identity has been verified! Put in your new password";
  static String forgetPasswordBtnUpdate = lang ? "تحديث" : "update";
  static String forgetPasswordBtnNext = lang ? "التالي" : "Next";
  static String forgetPasswordUpdated =
      lang ? "تم تحديث كلمة المرور" : "Password has been updated";
  static String forgetPasswordUpdatedDes = lang
      ? "لقد تم تحديث كلمة السر الخاصة بك"
      : "your password has been updated";

//!~> Details data: =====================================<
  static String stockNoLabel = lang ? "عدد الاسهم" : 'Enter stock number';
  static String stockNoAlart =
      lang ? "قم بادخال عدد الاسهم" : 'Enter stock number';

  static String stockPriceLabel =
      lang ? "سعر السهم الواحد " : 'Enter stock price';
  static String stockPriceAlart =
      lang ? "قم بادخال سعر الاسهم" : 'Enter stock price';
  static String stockFollow = lang ? "متابعة" : "Follow";
  static String about = lang ? "نبذه" : "About";
  static String news = lang ? "الاخبار" : "News";

  static String home = lang ? "الرئيسيه" : "Home";
  static String search = lang ? "استكشاف" : "Search";
  static String recommend = lang ? "ترشيحات" : "Recommend";
  static String bookmark = lang ? "المفضلات" : "Bookmark";
  static String searchHere = lang ? "ابحث هنا" : "Search Here";

  static String carouselText1 = lang
      ? "معانا البورصه اسهل واضمن حتي وان لم يكن لديك خبره سابقه"
      : "With us, the stock market is easier and more secure, even if you do not have previous experience.";
  static String carouselText2 = lang
      ? "ترشيح افضل 10 اسهم ستزداد في الفتره القادمه"
      : "The nomination of the best 10 stocks will increase in the coming period";
  static String carouselText3 = lang
      ? "تحليل كامل لكل سهم علي مدار خمس سنوات سابقه"
      : "A full analysis of each stock over the past five years";

  static String carouselImage1 =
      'https://cdn3d.iconscout.com/3d/premium/thumb/stock-analytics-5233669-4379879.png';
  static String carouselImage2 =
      'https://cdn3d.iconscout.com/3d/premium/thumb/stock-analysis-5233674-4379884.png';
  static String carouselImage3 =
      'https://cdn3d.iconscout.com/3d/premium/thumb/stock-candlestick-chart-analysis-5233673-4379883.png';

  static List<Map<String, dynamic>> carouselData = [
    {
      'image': carouselImage1,
      'text': carouselText1,
    },
    {
      'image': carouselImage2,
      'text': carouselText2,
    },
    {
      'image': carouselImage3,
      'text': carouselText3,
    }
  ];

  static String resetPassword = lang
      ? 'اعاده تعين كلمه المرور الخاصه بيك'
      : "reset your password".toUpperCase();
  static String reset = lang ? 'اعاده تعين' : "Reset".toUpperCase();

  static String backHome = lang ? 'العوده الي الرئسية' : 'Back to home';
  static String loginSuccess =
      lang ? "النجاح في تسجيل الدخول" : "Login Success";
//!~> EndPoints: =====================================<
  static const String baseUrl = "https://scrap-29ek.onrender.com/stock/";
}

String trans({required String enWord}) {
  var i = 0;
  for (i; enWord != enArTrns["eng"]![i]; i++) {}
  return enArTrns["ar"]![i];
}

Map<String, List> enArTrns = {
  "eng": [
    "THE EGYPTIAN MODERN EDUCATION SYSTEMS",
    "RAYA CONTACT CENTER",
    "SUES CANAL COMPANY FOR TECHNOLOGY SETTLING",
    "TRANSOCEANS TOURS",
    "TELECOM EGYPT",
    "ORASCOM INVESTMENT HOLDING",
    "GHARBIA ISLAMIC HOUSING DEVELOPMENT",
    "HELIOPOLIS HOUSING",
    "ORIENTAL WEAVERS",
    "RUBEX INTERNATIONAL FOR PLASTIC AND ACRYLIC MANUFACTURING",
    "THIQAH FOR BUSSINESS ADMINISTRATION AND DEVELOPMENT",
    "THE ARAB DAIRY PRODUCTS CO. ARAB DAIRY - PANDA",
    "AJWA FOR FOOD INDUSTRIES COMPANY EGYPT",
    "CAIRO OILS & SOAP",
    "ARABIAN FOOD INDUSTRIES DOMTY",
    "DICE SPORT & CASUAL WEAR",
    "EASTERN COMPANY",
    "EAST DELTA FLOUR MILLS",
    "EDITA FOOD INDUSTRIES S.A.E",
    "ISMAILIA NATIONAL FOOD INDUSTRIES",
    "JUHAYNA FOOD INDUSTRIES",
    "EL NASR CLOTHES & TEXTILES (KABO)",
    "OBOUR LAND FOR FOOD INDUSTRIES",
    "CAIRO EDUCATIONAL SERVICES",
    "CAIRO FOR INVESTMENT AND REAL ESTATE DEVELOPMENT",
    "EGYPTIAN SATELLITES (NILESAT)",
    "EL WADI FOR INTERNATIONAL AND INVESTEMENT DEVELOPMENT",
    "GOLDEN COAST COMPANY",
    "MISR HOTELS",
    "MARSA MARSA ALAM FOR TOURISM DEVELOPMENT",
    "EGYPTIAN MEDIA PRODUCTION CITY",
    "PYRAMISA HOTELS",
    "SHARM DREAMS CO. FOR TOURISM INVESTMENT",
    "EL SHAMS PYRAMIDS FOR HOTELS& TOURISTIC PROJECTS",
    "TAALEEM MANAGEMENT SERVICES",
    "BARBARY INVESTMENT GROUP ( BIG)",
    "GB CORP",
    "GMC GROUP FOR INDUSTRIAL COMMERCIAL & FINANCIAL INVESTMENTS",
    "INTERNATIONAL BUSINESS CORPORATION FOR TRADING AND AGENCIES",
    "INTERNATIONAL COMPANY FOR MEDICAL INDUSTRIES -ICMI",
    "IBNSINA PHARMA",
    "M.B ENGINEERING",
    "MISR KUWAIT INVESTMENT & TRADING CO.",
    "MM GROUP FOR INDUSTRY AND INTERNATIONAL TRADE",
    "SAMAD MISR -EGYFERT",
    "EL ARABIA ENGINEERING INDUSTRIES",
    "ALEXANDRIA MINERAL OILS COMPANY",
    "GENERAL COMPANY FOR LAND RECLAMATION,DEVELOPMENT & RECONSTRU",
    "ARAB CO. FOR ASSET MANAGEMENT AND DEVELOPMENT",
    "ABU DHABI ISLAMIC BANK- EGYPT",
    "ARAB DEVELOPMENT & REAL ESTATE INVESTMENT",
    "EL AHLI INVESTMENT AND DEVELOPMENT",
    "AMER GROUP HOLDING",
    "ARAB MOLTAKA INVESTMENTS CO",
    "ALEXANDRIA NATIONAL COMPANY FOR FINANCIAL INVESTMENT",
    "ARAB DEVELOPERS HOLDING",
    "EGYPTIAN REAL ESTATE GROUP",
    "ASPIRE CAPITAL HOLDING FOR FINANCIAL INVESTMENTS",
    "AL TAWFEEK LEASING COMPANY-A.T.LEASE",
    "B INVESTMENTS HOLDING",
    "BELTON FINANCIAL HOLDING",
    "SUEZ CANAL BANK S.A.E",
    "QALA FOR FINANCIAL INVESTMENTS",
    "GULF CANADIAN REAL ESTATE INVESTMENT CO.",
    "CI CAPITAL HOLDING FOR FINANCIAL INVESTMENTS",
    "CREDIT AGRICOLE EGYPT",
    "CONTACT FINANCIAL HOLDING",
    "COMMERCIAL INTERNATIONAL BANK (EGYPT)",
    "COPPER FOR COMMERCIAL INVESTMENT & REAL ESTATE DEVELOPMENT",
    "DEVELOPMENT & ENGINEERING CONSULTANTS",
    "DELTA CONSTRUCTION & REBUILDING",
    "DELTA INSURANCE",
    "EL ARABIA FOR LAND RECLAMATION",
    "EGYPTIAN ARABIAN(THEMAR)COMP. FOR SECURITIES&BONDS BROK. EAC",
    "OSOOL ESB SECURITIES BROKERAGE",
    "EGYPTIAN GULF BANK",
    "EGYPTIANS HOUSING DEVELOPMENT & RECONSTRUCTION",
    "EGYPTIANS FOR INVESTMENT & URBAN DEVELOPMENT",
    "EGYPTIAN KUWAITI HOLDING",
    "EGYPTIAN KUWAITI HOLDING-EGP",
    "EL KAHERA HOUSING",
    "EL SHAMS HOUSING & URBANIZATION",
    "EMAAR MISR FOR DEVELOPMENT",
    "EL OROUBA SECURITIES BROKERAGE",
    "EXPORT DEVELOPMENT BANK OF EGYPT (EDBE)",
    "FAISAL ISLAMIC BANK OF EGYPT - IN EGP",
    "FAISAL ISLAMIC BANK OF EGYPT - IN US DOLLARS",
    "FIRST INVESTMENT COMPANY AND REAL ESTATE DEVELOPMENT",
    "GOLDEN PYRAMIDS PLAZA",
    "GRAND INVESTMENT CAPITAL",
    "HOUSING & DEVELOPMENT BANK",
    "EGYPTIAN FINANCIAL GROUP-HERMES HOLDING COMPANY",
    "INTERNATIONAL CO FOR INVESTMENT & DEVELOPMENT",
    "INTERNATIONAL COMPANY FOR LEASING (INCOLEASE)",
    "ISMAILIA DEVELOPMENT AND REAL ESTATE CO",
    "AL KHAIR RIVER FOR DEVELOPMENT AGRICULTURAL INVESTMENT&ENVIR",
    "EL KAHERA EL WATANIA INVESTMENT",
    "EGYPTIAN GULF MARSEILIA FOR REAL ESTATE INVESTMENT",
    "MENA TOURISTIC & REAL ESTATE INVESTMENT",
    "MEDINET NASR HOUSING",
    "MOHANDES INSURANCE",
    "NAEEM HOLDING",
    "NATIONAL HOUSING FOR PROFESSIONAL SYNDICATES",
    "EL OBOUR REAL ESTATE INVESTMENT",
    "SIX OF OCTOBER DEVELOPMENT & INVESTMENT (SODIC)",
    "ODIN INVESTMENTS",
    "ORASCOM FINANCIAL HOLDING",
    "ORASCOM DEVELOPMENT EGYPT",
    "PALM HILLS DEVELOPMENT COMPANY",
    "PIONEERS PROPERTIES FOR URBAN DEVELOPMENT(PREDCO)",
    "PRIME HOLDING",
    "QATAR NATIONAL BANK ALAHLY",
    "REACAP FINANCIAL INVESTMENTS",
    "ROWAD TOURISM (AL ROWAD)",
    "ARAB REAL ESTATE INVESTMENT CO.-ALICO",
    "REMCO FOR TOURISTIC VILLAGES CONSTRUCTION",
    "SOCIETE ARABE INTERNATIONALE DE BANQUE S.A.E.",
    "AL BARAKA BANK EGYPT",
    "SAUDI EGYPTIAN INVESTMENT & FINANCE",
    "TANMIYA FOR REAL ESTATE INVESTMENT",
    "T M G HOLDING",
    "UNITED HOUSING & DEVELOPMENT",
    "UTOPIA",
    "ZAHRAA MAADI INVESTMENT & DEVELOPMENT",
    "ALEXANDRIA NEW MEDICAL CENTER",
    "CLEOPATRA HOSPITAL COMPANY",
    "INTEGRATED DIAGNOSTICS HOLDINGS PLC",
    "NOZHA INTERNATIONAL HOSPITAL",
    "SPEED MEDICAL",
    "UNION PHARMACIST COMPANY FOR MEDICAL SERVICES AND INVESTMENT",
    "ARAB PHARMACEUTICALS",
    "ALEXANDRIA PHARMACEUTICALS",
    "GLAXO SMITH KLINE",
    "CAIRO PHARMACEUTICALS",
    "MACRO GROUP PHARMACEUTICALS -MACRO CAPITAL",
    "MINAPHARM PHARMACEUTICALS",
    "MEMPHIS PHARMACEUTICALS",
    "EL-NILE CO. FOR PHARMACEUTICALS AND CHEMICAL INDUSTRIES",
    "OCTOBER PHARMA",
    "EGYPTIAN INTERNATIONAL PHARMACEUTICALS (EIPICO)",
    "TENTH OF RAMADAN PHARMACEUTICAL INDUSTRIES&DIAGNOSTIC-RAMEDA",
    "SABAA INTERNATIONAL COMPANY FOR PHARMACEUTICAL AND CHEMICAL",
    "ARABIA INVESTMENTS HOLDING",
    "THE EGYPTIAN COMPANY FOR CONSTRUCTION DEVELOPMENT-LIFT SLAB",
    "AL FANAR CONTRACTING CONSTRUCTION TRADE IMPORT AND EXPORT CO",
    "GIZA GENERAL CONTRACTING",
    "INDUSTRIAL & ENGINEERING ENTERPRISES CO.",
    "MARIDIVE & OIL SERVICES",
    "NASR COMPANY FOR CIVIL WORKS",
    "NATIONAL DRILLING",
    "ORASCOM CONSTRUCTION PLC",
    "ELSAEED CONTRACTING& REAL ESTATE INVESTMENT COMPANY SCCD",
    "WADI KOM OMBO LAND RECLAMATION",
    "EGYPTIANS REAL ESTATE FUND CERTIFICATES",
    "ARAB ALUMINUM",
    "ARABIAN CEMENT COMPANY",
    "ASEK COMPANY FOR MINING - ASCOM",
    "MISR NATIONAL STEEL - ATAQA",
    "EGYPT ALUMINUM",
    "EZZ STEEL",
    "EL EZZ ALDEKHELA STEEL - ALEXANDRIA",
    "EGYPTIAN IRON & STEEL",
    "IRON AND STEEL FOR MINES AND QUARRIES",
    "MISR BENI SUEF CEMENT",
    "MISR CEMENT (QENA)",
    "MISR INTERCONTINENTAL FOR GRANITE & MARBLE (EGY-STON)",
    "CERAMIC & PORCELAIN",
    "SINAI CEMENT",
    "SOUTH VALLEY CEMENT",
    "ABOU KIR FERTILIZERS",
    "ARAB COTTON GINNING",
    "ATLAS FOR INVESTMENT AND FOOD INDUSTRIES",
    "ARAB POLVARA SPINNING & WEAVING CO.",
    "EL BADR INVESTMENT AND DEVELOPMENT BID",
    "MIDDLE EGYPT FLOUR MILLS",
    "DELTA FOR PRINTING & PACKAGING",
    "EGYPTIAN FINANCIAL & INDUSTRIAL",
    "EGYPTIAN CHEMICAL INDUSTRIES (KIMA)",
    "EL NASR FOR MANUFACTURING AGRICULTURAL CROPS",
    "EGYPT FOR POULTRY",
    "EL AHRAM CO. FOR PRINTING AND PACKING",
    "FERCHEM MISR CO. FOR FERTILLIZERS & CHEMICALS",
    "GOLDEN TEXTILES & CLOTHES WOOL",
    "INTERNATIONAL COMPANY FOR FERTILIZERS & CHEMICALS",
    "INTERNATIONAL AGRICULTURAL PRODUCTS",
    "ISMAILIA MISR POULTRY",
    "KAFR EL ZAYAT PESTICIDES",
    "MIDDLE EAST GLASS MANUFACTURING",
    "MEDICAL PACKAGING COMPANY",
    "MISR FRETILIZERS PRODUCTION COMPANY - MOPCO",
    "MISR CHEMICAL INDUSTRIES",
    "NORTH CAIRO MILLS",
    "MISR OILS & SOAP",
    "MANSOURAH POULTRY",
    "NORTHERN UPPER EGYPT DEVELOPMENT & AGRICULTURAL PRODUCTION",
    "PAINT & CHEMICALS INDUSTRIES (PACHIN)",
    "CAIRO POULTRY",
    "RAKTA PAPER MANUFACTURING",
    "REKAZ FINANCIAL HOLDING",
    "SOUTH CAIRO & GIZA MILLS & BAKERIES",
    "SIDI KERIR PETROCHEMICALS - SIDPEC",
    "SHARKIA NATIONAL FOOD",
    "ALEXANDRIA SPINNING & WEAVING (SPINALEX)",
    "DELTA SUGAR",
    "UPPER EGYPT FLOUR MILLS",
    "UNIVERSAL FOR PAPER AND PACKAGING MATERIALS (UNIPACK",
    "MIDDLE & WEST DELTA FLOUR MILLS",
    "EXTRACTED OILS",
    "ACROW MISR",
    "ARAB VALVES COMPANY",
    "THE ARAB CERAMIC CO.- CERAMICA REMAS",
    "EL EZZ PORCELAIN (GEMMA)",
    "ELECTRO CABLE EGYPT",
    "ENGINEERING INDUSTRIES (ICON)",
    "GADWA FOR INDUSTRIAL DEVELOPMENT",
    "INTEGRATED ENGINEERING GROUP S.A.E",
    "LECICO EGYPT",
    "PHARAOH TECH FOR CONTROL AND COMMUNICATION SYSTEMS",
    "ELSWEDY ELECTRIC",
    "ALEXANDRIA FLOUR MILLS",
    "AL ARAFA FOR INVESTMENT AND CONSULTANCIES",
    "GENERAL SILOS & STORAGE",
    "MISR DUTY FREE SHOPS",
    "AL MOASHER FOR PROGRAMMING AND INFORMATION DISSEMINATION",
    "E-FINANCE FOR DIGITAL AND FINANCIAL INVESTMENTS",
    "FAWRY FOR BANKING TECHNOLOGY AND ELECTRONIC PAYMENT",
    "RAYA HOLDING FOR FINANCIAL INVESTMENTS",
    "VERTIKA FOR INDUSTRY & TRADE",
    "ALEXANDRIA CONTAINERS AND GOODS",
    "CANAL SHIPPING AGENCIES",
    "EGYPTIAN TRANSPORT (EGYTRANS)",
    "UNITED ARAB SHIPPING",
    "NATURAL GAS & MINING PROJECT (EGYPT GAS)",
    "EGYPTIAN FOR TOURISM RESORTS",
    "EGYPTIAN KUWAITI HOLDING"
  ],
  "ar": [
    "\u0627\u0644\u0645\u0635\u0631\u064a\u0629 \u0644\u0646\u0638\u0645 \u0627\u0644\u062a\u0639\u0644\u064a\u0645 \u0627\u0644\u062d\u062f\u064a\u062b\u0629 \u0634 \u0645 \u0645 ",
    "\u0631\u0627\u064a\u0629 \u0644\u062e\u062f\u0645\u0627\u062a \u0645\u0631\u0627\u0643\u0632 \u0627\u0644\u0627\u062a\u0635\u0627\u0644\u0627\u062a ",
    "\u0642\u0646\u0627\u0629 \u0627\u0644\u0633\u0648\u064a\u0633 \u0644\u062a\u0648\u0637\u064a\u0646 \u0627\u0644\u062a\u0643\u0646\u0648\u0644\u0648\u062c\u064a\u0627 ",
    "\u0639\u0628\u0631 \u0627\u0644\u0645\u062d\u064a\u0637\u0627\u062a \u0644\u0644\u0633\u064a\u0627\u062d\u0629 ",
    "\u0627\u0644\u0645\u0635\u0631\u064a\u0629 \u0644\u0644\u0627\u062a\u0635\u0627\u0644\u0627\u062a ",
    "\u0623\u0648\u0631\u0627\u0633\u0643\u0648\u0645 \u0644\u0644\u0627\u0633\u062a\u062b\u0645\u0627\u0631 \u0627\u0644\u0642\u0627\u0628\u0636\u0629 ",
    "\u0627\u0644\u063a\u0631\u0628\u064a\u0629 \u0627\u0644\u0627\u0633\u0644\u0627\u0645\u064a\u0629 \u0644\u0644\u062a\u0646\u0645\u064a\u0629 \u0627\u0644\u0639\u0645\u0631\u0627\u0646\u064a\u0629 ",
    "\u0645\u0635\u0631 \u0627\u0644\u062c\u062f\u064a\u062f\u0629 \u0644\u0644\u0627\u0633\u0643\u0627\u0646 \u0648\u0627\u0644\u062a\u0639\u0645\u064a\u0631 ",
    "\u0627\u0644\u0646\u0633\u0627\u062c\u0648\u0646 \u0627\u0644\u0634\u0631\u0642\u064a\u0648\u0646 \u0644\u0644\u0633\u062c\u0627\u062f ",
    "\u0631\u0648\u0628\u0643\u0633 \u0627\u0644\u0639\u0627\u0644\u0645\u064a\u0647 \u0644\u062a\u0635\u0646\u064a\u0639 \u0627\u0644\u0628\u0644\u0627\u0633\u062a\u064a\u0643 \u0648\u0627\u0644\u0627\u0643\u0631\u064a\u0644\u0643 ",
    "\u062b\u0642\u0629 \u0644\u0625\u062f\u0627\u0631\u0629 \u0627\u0644\u0623\u0639\u0645\u0627\u0644 \u0648\u0627\u0644\u062a\u0646\u0645\u064a\u0629 ",
    "\u0627\u0644\u0639\u0631\u0628\u064a\u0629 \u0644\u0645\u0646\u062a\u062c\u0627\u062a \u0627\u0644\u0623\u0644\u0628\u0627\u0646\" \u0622\u0631\u0627\u0628 \u062f\u064a\u0631\u0649 - \u0628\u0627\u0646\u062f\u0627\" ",
    "\u0645\u062c\u0645\u0648\u0639\u0629 \u0627\u062c\u0648\u0627\u0621 \u0644\u0644\u0635\u0646\u0627\u0639\u0627\u062a \u0627\u0644\u063a\u0630\u0627\u0626\u064a\u0629 - \u0645\u0635\u0631 ",
    "\u0627\u0644\u0642\u0627\u0647\u0631\u0629 \u0644\u0644\u0632\u064a\u0648\u062a \u0648\u0627\u0644\u0635\u0627\u0628\u0648\u0646 ",
    "\u0627\u0644\u0635\u0646\u0627\u0639\u0627\u062a \u0627\u0644\u063a\u0630\u0627\u0626\u064a\u0629 \u0627\u0644\u0639\u0631\u0628\u064a\u0629 ",
    "\u062f\u0627\u064a\u0633 \u0644\u0644\u0645\u0644\u0627\u0628\u0633 \u0627\u0644\u062c\u0627\u0647\u0632\u0629 ",
    "\u0627\u0644\u0634\u0631\u0642\u064a\u0629 \u0627\u064a\u0633\u062a\u0631\u0646 \u0643\u0648\u0645\u0628\u0627\u0646\u064a ",
    "\u0645\u0637\u0627\u062d\u0646 \u0634\u0631\u0642 \u0627\u0644\u062f\u0644\u062a\u0627 ",
    "\u0627\u064a\u062f\u064a\u062a\u0627 \u0644\u0644\u0635\u0646\u0627\u0639\u0627\u062a \u0627\u0644\u063a\u0630\u0627\u0626\u064a\u0629 \u0634 \u0645 \u0645 ",
    "\u0627\u0644\u0627\u0633\u0645\u0627\u0639\u064a\u0644\u064a\u0629 \u0627\u0644\u0648\u0637\u0646\u064a\u0629 \u0644\u0644\u0635\u0646\u0627\u0639\u0627\u062a \u0627\u0644\u063a\u0630\u0627\u0626\u064a\u0629 ",
    "\u062c\u0647\u064a\u0646\u0629 \u0644\u0644\u0635\u0646\u0627\u0639\u0627\u062a \u0627\u0644\u063a\u0630\u0627\u0626\u064a\u0629 \u0634 \u0645 \u0645 ",
    "\u0627\u0644\u0646\u0635\u0631 \u0644\u0644\u0645\u0644\u0627\u0628\u0633 \u0648\u0627\u0644\u0645\u0646\u0633\u0648\u062c\u0627\u062a ",
    "\u0639\u0628\u0648\u0631 \u0644\u0627\u0646\u062f \u0644\u0644\u0635\u0646\u0627\u0639\u0627\u062a \u0627\u0644\u063a\u0630\u0627\u0626\u064a\u0629 ",
    "\u0627\u0644\u0642\u0627\u0647\u0631\u0629 \u0644\u0644\u062e\u062f\u0645\u0627\u062a \u0627\u0644\u062a\u0639\u0644\u064a\u0645\u064a\u0629 ",
    "\u0627\u0644\u0642\u0627\u0647\u0631\u0629 \u0644\u0644\u0625\u0633\u062a\u062b\u0645\u0627\u0631 \u0648\u0627\u0644\u062a\u0646\u0645\u064a\u0629 \u0627\u0644\u0639\u0642\u0627\u0631\u064a\u0629 ",
    "\u0627\u0644\u0645\u0635\u0631\u064a\u0629 \u0644\u0644\u0623\u0642\u0645\u0627\u0631 \u0627\u0644\u0635\u0646\u0627\u0639\u064a\u0629 \u0634 \u0645 \u0645 ",
    "\u0627\u0644\u0648\u0627\u062f\u064a \u0627\u0644\u0639\u0627\u0644\u0645\u064a\u0629 \u0644\u0644\u0627\u0633\u062a\u062b\u0645\u0627\u0631 \u0648\u0627\u0644\u062a\u0646\u0645\u064a\u0629 ",
    "\u062c\u0648\u0644\u062f\u0646 \u0643\u0648\u0633\u062a \u0627\u0644\u0633\u062e\u0646\u0629 \u0644\u0644\u0627\u0633\u062a\u062b\u0645\u0627\u0631 \u0627\u0644\u0633\u064a\u0627\u062d\u0649 ",
    "\u0645\u0635\u0631 \u0644\u0644\u0641\u0646\u0627\u062f\u0642 ",
    "\u0645\u0631\u0633\u0649 \u0645\u0631\u0633\u0649 \u0639\u0644\u0645 \u0644\u0644\u062a\u0646\u0645\u064a\u0629 \u0627\u0644\u0633\u064a\u0627\u062d\u064a\u0629 \u0634 \u0645 \u0645 ",
    "\u0627\u0644\u0645\u0635\u0631\u064a\u0647 \u0644\u0645\u062f\u064a\u0646\u0629 \u0627\u0644\u0627\u0646\u062a\u0627\u062c \u0627\u0644\u0627\u0639\u0644\u0627\u0645\u0649 \u0634 \u0645 \u0645 ",
    "\u0628\u064a\u0631\u0627\u0645\u064a\u0632\u0627 \u0644\u0644\u0641\u0646\u0627\u062f\u0642 \u0648\u0627\u0644\u0642\u0631\u0649 \u0627\u0644\u0633\u064a\u0627\u062d\u064a\u0629 ",
    "\u0634\u0627\u0631\u0645 \u062f\u0631\u064a\u0645\u0632 \u0644\u0644\u0627\u0633\u062a\u062b\u0645\u0627\u0631 \u0627\u0644\u0633\u064a\u0627\u062d\u0649 \u0634 \u0645 \u0645 ",
    "\u0627\u0644\u0634\u0645\u0633 \u0628\u064a\u0631\u0627\u0645\u064a\u062f\u0632 \u0644\u0644\u0641\u0646\u0627\u062f\u0642 \u0648\u0627\u0644\u0645\u0646\u0634\u0623\u062a \u0627\u0644\u0633\u064a\u0627\u062d\u064a\u0629 \u0634 \u0645 \u0645 ",
    "\u062a\u0639\u0644\u064a\u0645 \u0644\u062e\u062f\u0645\u0627\u062a \u0627\u0644\u0625\u062f\u0627\u0631\u0629 ",
    "\u0628\u0649 \u0627\u0649 \u062c\u0649 \u0644\u0644\u062a\u062c\u0627\u0631\u0629 \u0648\u0627\u0644\u0627\u0633\u062a\u062b\u0645\u0627\u0631 ",
    "\u062c\u0649 \u0628\u0649 \u0627\u0648\u062a\u0648 \u0643\u0648\u0631\u0628\u0648\u0631\u064a\u0634\u0646 ",
    "\u0645\u062c\u0645\u0648\u0639\u0629 \u062c\u0649 \u0625\u0645 \u0633\u0649 \u0644\u0644\u0627\u0633\u062a\u062b\u0645\u0627\u0631\u0627\u062a \u0627\u0644\u0635\u0646\u0627\u0639\u064a\u0629 \u0648\u0627\u0644\u062a\u062c\u0627\u0631\u064a\u0629 \u0648\u0627\u0644\u0645\u0627\u0644\u064a\u0629 ",
    "\u0627\u0646\u062a\u0631\u0646\u0627\u0634\u064a\u0648\u0646\u0627\u0644 \u0628\u0632\u0646\u064a\u0633 \u0643\u0648\u0631\u0628\u0648\u0631\u064a\u0634\u0646 \u0644\u0644\u062a\u062c\u0627\u0631\u0629 \u0648\u0627\u0644\u062a\u0648\u0643\u064a\u0644\u0627\u062a \u0627\u0644\u062a\u062c\u0627\u0631\u064a\u0629 ",
    "\u0627\u0644\u062f\u0648\u0644\u064a\u0629 \u0644\u0644\u0635\u0646\u0627\u0639\u0627\u062a \u0627\u0644\u0637\u0628\u064a\u0629 ",
    "\u0627\u0628\u0646 \u0633\u064a\u0646\u0627 \u0641\u0627\u0631\u0645\u0627 ",
    "\u0625\u0645 \u0628\u064a \u0644\u0644\u0647\u0646\u062f\u0633\u0629 \u0648\u0627\u0644\u0645\u0642\u0627\u0648\u0644\u0627\u062a ",
    "\u0627\u0644\u0645\u0635\u0631\u064a\u0629 \u0627\u0644\u0643\u0648\u064a\u062a\u064a\u0629 \u0644\u0644\u0627\u0633\u062a\u062b\u0645\u0627\u0631 \u0648\u0627\u0644\u062a\u062c\u0627\u0631\u0629 ",
    "\u0627\u0645.\u0627\u0645 \u062c\u0631\u0648\u0628 \u0644\u0644\u0635\u0646\u0627\u0639\u0629 \u0648\u0627\u0644\u062a\u062c\u0627\u0631\u0629 \u0627\u0644\u0639\u0627\u0644\u0645\u064a\u0629 ",
    "\u0633\u0645\u0627\u062f \u0645\u0635\u0631 ",
    "\u0627\u0644\u0639\u0631\u0628\u064a\u0629 \u0644\u0644\u0635\u0646\u0627\u0639\u0627\u062a \u0627\u0644\u0647\u0646\u062f\u0633\u064a\u0629 ",
    "\u0627\u0644\u0627\u0633\u0643\u0646\u062f\u0631\u064a\u0629 \u0644\u0644\u0632\u064a\u0648\u062a \u0627\u0644\u0645\u0639\u062f\u0646\u064a\u0629 ",
    "\u0627\u0644\u0639\u0627\u0645\u0629 \u0644\u0627\u0633\u062a\u0635\u0644\u0627\u062d \u0627\u0644\u0623\u0631\u0627\u0636\u064a \u0648\u0627\u0644\u062a\u0646\u0645\u064a\u0629 \u0648\u0627\u0644\u062a\u0639\u0645\u064a\u0631 ",
    "\u0627\u0644\u0634\u0631\u0643\u0629 \u0627\u0644\u0639\u0631\u0628\u064a\u0629 \u0644\u0625\u062f\u0627\u0631\u0629 \u0648\u062a\u0637\u0648\u064a\u0631 \u0627\u0644\u0623\u0635\u0648\u0644 ",
    "\u0645\u0635\u0631\u0641 \u0623\u0628\u0648 \u0638\u0628\u064a \u0627\u0644\u0625\u0633\u0644\u0627\u0645\u064a - \u0645\u0635\u0631 ",
    "\u0623\u0631\u0627\u0628 \u0644\u0644\u062a\u0646\u0645\u064a\u0629 \u0648 \u0627\u0644\u0627\u0633\u062a\u062b\u0645\u0627\u0631 \u0627\u0644\u0639\u0642\u0627\u0631\u064a ",
    "\u0627\u0644\u0627\u0647\u0644\u064a \u0644\u0644\u062a\u0646\u0645\u064a\u0629 \u0648\u0627\u0644\u0627\u0633\u062a\u062b\u0645\u0627\u0631 ",
    "\u0645\u062c\u0645\u0648\u0639\u0629 \u0639\u0627\u0645\u0631 \u0627\u0644\u0642\u0627\u0628\u0636\u0629 \u0634 \u0645 \u0645 ",
    "\u0627\u0644\u0645\u0644\u062a\u0642\u0649 \u0627\u0644\u0639\u0631\u0628\u064a \u0644\u0644\u0627\u0633\u062a\u062b\u0645\u0627\u0631\u0627\u062a ",
    "\u0627\u0644\u0627\u0633\u0643\u0646\u062f\u0631\u064a\u0629 \u0627\u0644\u0648\u0637\u0646\u064a\u0629 \u0644\u0644\u0627\u0633\u062a\u062b\u0645\u0627\u0631\u0627\u062a \u0627\u0644\u0645\u0627\u0644\u064a\u0629 ",
    "\u0627\u0644\u0645\u0637\u0648\u0631\u0648\u0646 \u0627\u0644\u0639\u0631\u0628 \u0627\u0644\u0642\u0627\u0628\u0636\u0629 ",
    "\u0627\u0644\u0645\u062c\u0645\u0648\u0639\u0629 \u0627\u0644\u0645\u0635\u0631\u064a\u0629 \u0627\u0644\u0639\u0642\u0627\u0631\u064a\u0629 ",
    "\u0627\u0633\u0628\u0627\u064a\u0631 \u0643\u0627\u0628\u064a\u062a\u0627\u0644 \u0627\u0644\u0642\u0627\u0628\u0636\u0629 \u0644\u0644\u0627\u0633\u062a\u062b\u0645\u0627\u0631\u0627\u062a \u0627\u0644\u0645\u0627\u0644\u064a\u0629 ",
    "\u0627\u0644\u062a\u0648\u0641\u064a\u0642 \u0644\u0644\u062a\u0623\u062c\u064a\u0631 \u0627\u0644\u062a\u0645\u0648\u064a\u0644\u064a ",
    "\u0628\u064a \u0625\u0646\u0641\u0633\u062a\u0645\u0646\u062a\u0633 \u0627\u0644\u0642\u0627\u0628\u0636\u0629 ",
    "\u0628\u0644\u062a\u0648\u0646 \u0627\u0644\u0645\u0627\u0644\u064a\u0629 \u0627\u0644\u0642\u0627\u0628\u0636\u0629 ",
    "\u0628\u0646\u0643 \u0642\u0646\u0627\u0629 \u0627\u0644\u0633\u0648\u064a\u0633 ",
    "\u0627\u0644\u0642\u0644\u0639\u0629 \u0644\u0644\u0627\u0633\u062a\u062b\u0645\u0627\u0631\u0627\u062a \u0627\u0644\u0645\u0627\u0644\u064a\u0629 \u0634 \u0645 \u0645 ",
    "\u0627\u0644\u062e\u0644\u064a\u062c\u064a\u0629 \u0627\u0644\u0643\u0646\u062f\u064a\u0629 \u0644\u0644\u0627\u0633\u062a\u062b\u0645\u0627\u0631 \u0627\u0644\u0639\u0642\u0627\u0631\u064a \u0627\u0644\u0639\u0631\u0628\u064a ",
    "\u0633\u064a \u0627\u064a \u0643\u0627\u0628\u064a\u062a\u0627\u0644 \u0627\u0644\u0642\u0627\u0628\u0636\u0629 \u0644\u0644\u0627\u0633\u062a\u062b\u0645\u0627\u0631\u0627\u062a \u0627\u0644\u0645\u0627\u0644\u064a\u0629 ",
    "\u0643\u0631\u064a\u062f\u064a \u0623\u062c\u0631\u064a\u0643\u0648\u0644 - \u0645\u0635\u0631 ",
    "\u0643\u0648\u0646\u062a\u0643\u062a \u0627\u0644\u0645\u0627\u0644\u064a\u0629 \u0627\u0644\u0642\u0627\u0628\u0636\u0629 ",
    "\u0627\u0644\u0628\u0646\u0643 \u0627\u0644\u062a\u062c\u0627\u0631\u064a \u0627\u0644\u062f\u0648\u0644\u064a - \u0645\u0635\u0631 ",
    "\u0643\u0648\u0628\u0631 \u0644\u0644\u0627\u0633\u062a\u062b\u0645\u0627\u0631 \u0627\u0644\u062a\u062c\u0627\u0631\u064a \u0648\u0627\u0644\u062a\u0637\u0648\u064a\u0631 \u0627\u0644\u0639\u0642\u0627\u0631\u064a ",
    "\u0627\u0644\u062a\u0639\u0645\u064a\u0631 \u0648\u0627\u0644\u0627\u0633\u062a\u0634\u0627\u0631\u0627\u062a \u0627\u0644\u0647\u0646\u062f\u0633\u064a\u0629 \u0634 \u0645 \u0645 ",
    "\u062f\u0644\u062a\u0627 \u0644\u0644\u0625\u0646\u0634\u0627\u0621 \u0648\u0627\u0644\u062a\u0639\u0645\u064a\u0631 \u0634 \u0645 \u0645 ",
    "\u0627\u0644\u062f\u0644\u062a\u0627 \u0644\u0644\u062a\u0623\u0645\u064a\u0646 ",
    "\u0627\u0644\u0639\u0631\u0628\u064a\u0629 \u0644\u0627\u0633\u062a\u0635\u0644\u0627\u062d \u0627\u0644\u0627\u0631\u0627\u0636\u064a \u0634 \u062a \u0645 \u0645 ",
    "EAC \u0627\u0644\u0645\u0635\u0631\u064a\u0629 \u0627\u0644\u0639\u0631\u0628\u064a\u0629 ",
    "\u0627\u0635\u0648\u0644 \u0625\u0649 \u0625\u0633 \u0628\u0649 \u0644\u0644\u0648\u0633\u0627\u0637\u0629 \u0641\u064a \u0627\u0644\u0627\u0648\u0631\u0627\u0642 \u0627\u0644\u0645\u0627\u0644\u064a\u0629 ",
    "\u0627\u0644\u0628\u0646\u0643 \u0627\u0644\u0645\u0635\u0631\u064a \u0627\u0644\u062e\u0644\u064a\u062c\u064a ",
    "\u0627\u0644\u0645\u0635\u0631\u064a\u064a\u0646 \u0644\u0644\u0627\u0633\u0643\u0627\u0646 \u0648\u0627\u0644\u062a\u0646\u0645\u064a\u0629 \u0648\u0627\u0644\u062a\u0639\u0645\u064a\u0631 \u0634 \u0645 \u0645 ",
    "\u0627\u0644\u0645\u0635\u0631\u064a\u064a\u0646 \u0644\u0644\u0627\u0633\u062a\u062b\u0645\u0627\u0631 \u0648 \u0627\u0644\u062a\u0646\u0645\u064a\u0629 \u0627\u0644\u0639\u0645\u0631\u0627\u0646\u064a\u0629 \u0634 \u0645 \u0645 ",
    "\u0627\u0644\u0642\u0627\u0647\u0631\u0629 \u0644\u0644\u0627\u0633\u0643\u0627\u0646 \u0648\u0627\u0644\u062a\u0639\u0645\u064a\u0631 ",
    "\u0627\u0644\u0634\u0645\u0633 \u0644\u0644\u0627\u0633\u0643\u0627\u0646 \u0648 \u0627\u0644\u062a\u0639\u0645\u064a\u0631 \u0634 \u0645 \u0645 ",
    "\u0625\u0639\u0645\u0627\u0631 \u0645\u0635\u0631 \u0644\u0644\u062a\u0646\u0645\u064a\u0629 \u0634.\u0645.\u0645 ",
    "\u0627\u0644\u0639\u0631\u0648\u0628\u0629 \u0644\u0644\u0633\u0645\u0633\u0631\u0629 \u0641\u0649 \u0627\u0644\u0623\u0648\u0631\u0627\u0642 \u0627\u0644\u0645\u0627\u0644\u064a\u0629 \u0634 \u0645 \u0645 ",
    "\u0627\u0644\u0628\u0646\u0643 \u0627\u0644\u0645\u0635\u0631\u064a \u0644\u062a\u0646\u0645\u064a\u0629 \u0627\u0644\u0635\u0627\u062f\u0631\u0627\u062a ",
    "\u0628\u0646\u0643 \u0641\u064a\u0635\u0644 \u0627\u0644\u0625\u0633\u0644\u0627\u0645\u064a \u0627\u0644\u0645\u0635\u0631\u064a ",
    "\u0628\u0646\u0643 \u0641\u064a\u0635\u0644 \u0627\u0644\u0625\u0633\u0644\u0627\u0645\u064a \u0627\u0644\u0645\u0635\u0631\u064a ",
    "\u0627\u0644\u0623\u0648\u0644\u0649 \u0644\u0644\u0627\u0633\u062a\u062b\u0645\u0627\u0631 \u0648\u0627\u0644\u062a\u0646\u0645\u064a\u0629 \u0627\u0644\u0639\u0642\u0627\u0631\u064a\u0629 ",
    "\u062c\u0648\u0644\u062f\u0646 \u0628\u064a\u0631\u0627\u0645\u064a\u062f\u0632 \u0628\u0644\u0627\u0632\u0627 ",
    "\u062c\u0631\u0627\u0646\u062f \u0627\u0646\u0641\u0633\u062a\u0645\u0646\u062a \u0627\u0644\u0642\u0627\u0628\u0636\u0629 \u0644\u0644\u0627\u0633\u062a\u062b\u0645\u0627\u0631\u0627\u062a \u0627\u0644\u0645\u0627\u0644\u064a\u0629 \u0634 \u0645 \u0645 ",
    "\u0628\u0646\u0643 \u0627\u0644\u062a\u0639\u0645\u064a\u0631 \u0648\u0627\u0644\u0627\u0633\u0643\u0627\u0646 ",
    "\u0627\u0644\u0645\u062c\u0645\u0648\u0639\u0647 \u0627\u0644\u0645\u0627\u0644\u064a\u0647 \u0647\u064a\u0631\u0645\u0633 \u0627\u0644\u0642\u0627\u0628\u0636\u0647 ",
    "\u0627\u0644\u0639\u0627\u0644\u0645\u064a\u0629 \u0644\u0644\u0627\u0633\u062a\u062b\u0645\u0627\u0631 \u0648\u0627\u0644\u062a\u0646\u0645\u064a\u0629 ",
    "\u0627\u0644\u062f\u0648\u0644\u064a\u0629 \u0644\u0644\u062a\u0623\u062c\u064a\u0631 \u0627\u0644\u062a\u0645\u0648\u064a\u0644\u064a ",
    "\u0627\u0644\u0627\u0633\u0645\u0627\u0639\u064a\u0644\u064a\u0629 \u0627\u0644\u062c\u062f\u064a\u062f\u0629 \u0644\u0644\u062a\u0637\u0648\u064a\u0631 \u0648\u0627\u0644\u062a\u0646\u0645\u064a\u0629 \u0627\u0644\u0639\u0645\u0631\u0627\u0646\u064a\u0629 ",
    "\u0646\u0647\u0631 \u0627\u0644\u062e\u064a\u0631 \u0644\u0644\u062a\u0646\u0645\u064a\u0629 \u0648\u0627\u0644\u0623\u0633\u062a\u062b\u0645\u0627\u0631 \u0627\u0644\u0632\u0631\u0627\u0639\u0649 \u0648\u0627\u0644\u062e\u062f\u0645\u0627\u062a \u0627\u0644\u0628\u064a\u0626\u064a\u0629 ",
    "\u0627\u0644\u0642\u0627\u0647\u0631\u0629 \u0627\u0644\u0648\u0637\u0646\u064a\u0629 \u0644\u0644\u0627\u0633\u062a\u062b\u0645\u0627\u0631 \u0648\u0627\u0644\u0627\u0648\u0631\u0627\u0642 \u0627\u0644\u0645\u0627\u0644\u064a\u0629 ",
    "\u0645\u0631\u0633\u064a\u0644\u064a\u0627 \u0627\u0644\u0645\u0635\u0631\u064a\u0629 \u0627\u0644\u062e\u0644\u064a\u062c\u064a\u0629 \u0644\u0644\u0627\u0633\u062a\u062b\u0645\u0627\u0631 \u0627\u0644\u0639\u0642\u0627\u0631\u0649 ",
    "\u0645\u064a\u0646\u0627 \u0644\u0644\u0627\u0633\u062a\u062b\u0645\u0627\u0631 \u0627\u0644\u0633\u064a\u0627\u062d\u064a \u0648\u0627\u0644\u0639\u0642\u0627\u0631\u064a ",
    "\u0645\u062f\u064a\u0646\u0629 \u0646\u0635\u0631 \u0644\u0644\u0627\u0633\u0643\u0627\u0646 \u0648\u0627\u0644\u062a\u0639\u0645\u064a\u0631 ",
    "\u0627\u0644\u0645\u0647\u0646\u062f\u0633 \u0644\u0644\u062a\u0623\u0645\u064a\u0646 ",
    "\u0627\u0644\u0646\u0639\u064a\u0645 \u0627\u0644\u0642\u0627\u0628\u0636\u0629 \u0644\u0644\u0627\u0633\u062a\u062b\u0645\u0627\u0631\u0627\u062a ",
    "\u0627\u0644\u0648\u0637\u0646\u064a\u0629 \u0644\u0644\u0627\u0633\u0643\u0627\u0646 \u0644\u0644\u0646\u0642\u0627\u0628\u0627\u062a \u0627\u0644\u0645\u0647\u0646\u064a\u0629 ",
    "\u0627\u0644\u0639\u0628\u0648\u0631 \u0644\u0644\u0627\u0633\u062a\u062b\u0645\u0627\u0631 \u0627\u0644\u0639\u0642\u0627\u0631\u0649 ",
    "\u0627\u0644\u0633\u0627\u062f\u0633 \u0645\u0646 \u0627\u0643\u062a\u0648\u0628\u0631 \u0644\u0644\u062a\u0646\u0645\u064a\u0629 \u0648\u0627\u0644\u0627\u0633\u062a\u062b\u0645\u0627\u0631 ",
    "\u0623\u0648\u062f\u0646 \u0644\u0644\u0627\u0633\u062a\u062b\u0645\u0627\u0631\u0627\u062a \u0627\u0644\u0645\u0627\u0644\u064a\u0629 ",
    "\u0627\u0648\u0631\u0627\u0633\u0643\u0648\u0645 \u0627\u0644\u0645\u0627\u0644\u064a\u0629 \u0627\u0644\u0642\u0627\u0628\u0636\u0629 ",
    "\u0627\u0648\u0631\u0627\u0633\u0643\u0648\u0645 \u0644\u0644\u062a\u0646\u0645\u064a\u0629 \u0645\u0635\u0631 ",
    "\u0628\u0627\u0644\u0645 \u0647\u064a\u0644\u0632 \u0644\u0644\u062a\u0639\u0645\u064a\u0631 \u0634 \u0645 \u0645 ",
    "\u0628\u0627\u064a\u0648\u0646\u064a\u0631\u0632 \u0628\u0631\u0648\u0628\u0631\u062a\u064a\u0632 \u0644\u0644\u062a\u0646\u0645\u064a\u0629 \u0627\u0644\u0639\u0645\u0631\u0627\u0646\u064a\u0629 ",
    "\u0628\u0631\u0627\u064a\u0645 \u0627\u0644\u0642\u0627\u0628\u0636\u0629 \u0644\u0644\u0627\u0633\u062a\u062b\u0645\u0627\u0631\u0627\u062a \u0627\u0644\u0645\u0627\u0644\u064a\u0629 ",
    "\u0628\u0646\u0643 \u0642\u0637\u0631 \u0627\u0644\u0648\u0637\u0646\u064a \u0627\u0644\u0627\u0647\u0644\u064a ",
    "\u0631\u064a\u0643\u0627\u0628 \u0644\u0644\u0627\u0633\u062a\u062b\u0645\u0627\u0631\u0627\u062a \u0627\u0644\u0645\u0627\u0644\u064a\u0629 ",
    "\u0631\u0648\u0627\u062f \u0627\u0644\u0633\u064a\u0627\u062d\u0629 ",
    "\u0627\u0644\u0627\u0633\u062a\u062b\u0645\u0627\u0631 \u0627\u0644\u0639\u0642\u0627\u0631\u064a \u0627\u0644\u0639\u0631\u0628\u064a ",
    "\u0631\u0645\u0643\u0648 \u0644\u0627\u0646\u0634\u0627\u0621 \u0627\u0644\u0642\u0631\u0649 \u0627\u0644\u0633\u064a\u0627\u062d\u064a\u0629 ",
    "\u0628\u0646\u0643 \u0627\u0644\u0634\u0631\u0643\u0629 \u0627\u0644\u0645\u0635\u0631\u0641\u064a\u0629 \u0627\u0644\u0639\u0631\u0628\u064a\u0629 \u0627\u0644\u062f\u0648\u0644\u064a\u0629 \u0634\u0631\u0643\u0629 \u0645\u0633\u0627\u0647\u0645\u0629 \u0645\u0635\u0631\u064a\u0629 ",
    "\u0628\u0646\u0643 \u0627\u0644\u0628\u0631\u0643\u0629 - \u0645\u0635\u0631 ",
    "\u0627\u0644\u0633\u0639\u0648\u062f\u064a\u0629 \u0627\u0644\u0645\u0635\u0631\u064a\u0629 \u0644\u0644\u0627\u0633\u062a\u062b\u0645\u0627\u0631 \u0648\u0627\u0644\u062a\u0645\u0648\u064a\u0644 ",
    "\u062a\u0646\u0645\u064a\u0629 \u0644\u0644\u0627\u0633\u062a\u062b\u0645\u0627\u0631 \u0627\u0644\u0639\u0642\u0627\u0631\u064a ",
    "\u0645\u062c\u0645\u0648\u0639\u0629 \u0637\u0644\u0639\u062a \u0645\u0635\u0637\u0641\u0649 \u0627\u0644\u0642\u0627\u0628\u0636\u0629 ",
    "\u0627\u0644\u0645\u062a\u062d\u062f\u0629 \u0644\u0644\u0627\u0633\u0643\u0627\u0646 \u0648\u0627\u0644\u062a\u0639\u0645\u064a\u0631 ",
    "\u064a\u0648\u062a\u0648\u0628\u064a\u0627 \u0644\u0644\u0627\u0633\u062a\u062b\u0645\u0627\u0631 \u0627\u0644\u0639\u0642\u0627\u0631\u064a \u0648\u0627\u0644\u0633\u064a\u0627\u062d\u064a ",
    "\u0632\u0647\u0631\u0627\u0621 \u0627\u0644\u0645\u0639\u0627\u062f\u064a \u0644\u0644\u0627\u0633\u062a\u062b\u0645\u0627\u0631 \u0648\u0627\u0644\u062a\u0639\u0645\u064a\u0631 ",
    "\u0627\u0644\u0627\u0633\u0643\u0646\u062f\u0631\u064a\u0629 \u0644\u0644\u062e\u062f\u0645\u0627\u062a \u0627\u0644\u0637\u0628\u064a\u0629 \u0627\u0644\u0645\u0631\u0643\u0632 \u0627\u0644\u0637\u0628\u064a \u0627\u0644\u062c\u062f\u064a\u062f - \u0627\u0644\u0625\u0633\u0643\u0646\u062f\u0631\u064a\u0629 \u0634.\u0645.\u0645 ",
    "\u0634\u0631\u0643\u0629 \u0645\u0633\u062a\u0634\u0641\u0649 \u0643\u0644\u064a\u0648\u0628\u0627\u062a\u0631\u0627 ",
    "\u0627\u0646\u062a\u062c\u0631\u064a\u062a\u064a\u062f \u062f\u064a\u0627\u062c\u0646\u0648\u0633\u062a\u0643\u0633 \u0647\u0648\u0644\u062f\u064a\u0646\u062c\u0632 \u0628\u0649 \u0627\u0644 \u0633\u0649 ",
    "\u0645\u0633\u062a\u0634\u0641\u0649 \u0627\u0644\u0646\u0632\u0647\u0647 \u0627\u0644\u062f\u0648\u0644\u064a \u0634 \u0645 \u0645 ",
    "\u0634\u0631\u0643\u0629 \u0633\u0628\u064a\u062f \u0645\u064a\u062f\u064a\u0643\u0627\u0644 ",
    "\u0627\u0644\u0627\u062a\u062d\u0627\u062f \u0627\u0644\u0635\u064a\u062f\u0644\u0649 \u0644\u0644\u062e\u062f\u0645\u0627\u062a \u0627\u0644\u0637\u0628\u064a\u0629 \u0648\u0627\u0644\u0627\u0633\u062a\u062b\u0645\u0627\u0631 ",
    "\u0627\u0644\u0639\u0631\u0628\u064a\u0629 \u0644\u0644\u0623\u062f\u0648\u064a\u0629 \u0648\u0627\u0644\u0635\u0646\u0627\u0639\u0627\u062a \u0627\u0644\u0643\u064a\u0645\u0627\u0648\u064a\u0629 ",
    "\u0627\u0644\u0627\u0633\u0643\u0646\u062f\u0631\u064a\u0629 \u0644\u0644\u0627\u062f\u0648\u064a\u0629 \u0648\u0627\u0644\u0635\u0646\u0627\u0639\u0627\u062a \u0627\u0644\u0643\u064a\u0645\u0627\u0648\u064a\u0629 ",
    "\u062c\u0644\u0627\u0643\u0633\u0648 \u0633\u0645\u064a\u062b\u0643\u0644\u0627\u064a\u0646 ",
    "\u0627\u0644\u0642\u0627\u0647\u0631\u0629 \u0644\u0644\u0627\u062f\u0648\u064a\u0629 \u0648\u0627\u0644\u0635\u0646\u0627\u0639\u0627\u062a \u0627\u0644\u0643\u064a\u0645\u0627\u0648\u064a\u0629 ",
    "\u0645\u0627\u0643\u0631\u0648 \u062c\u0631\u0648\u0628 \u0644\u0644\u0645\u0633\u062a\u062d\u0636\u0631\u0627\u062a \u0627\u0644\u0637\u0628\u064a\u0629 - \u0645\u0627\u0643\u0631\u0648 \u0643\u0627\u0628\u064a\u062a\u0627\u0644 ",
    "\u0645\u064a\u0646\u0627 \u0641\u0627\u0631\u0645 \u0644\u0644\u0623\u062f\u0648\u064a\u0629 \u0648\u0627\u0644\u0635\u0646\u0627\u0639\u0627\u062a \u0627\u0644\u0643\u064a\u0645\u0627\u0648\u064a\u0629 ",
    "\u0645\u0645\u0641\u064a\u0633 \u0644\u0644\u0627\u062f\u0648\u064a\u0629 \u0648\u0627\u0644\u0635\u0646\u0627\u0639\u0627\u062a \u0627\u0644\u0643\u064a\u0645\u0627\u0648\u064a\u0629 ",
    "\u0627\u0644\u0646\u064a\u0644 \u0644\u0644\u0627\u062f\u0648\u064a\u0629 \u0648\u0627\u0644\u0635\u0646\u0627\u0639\u0627\u062a \u0627\u0644\u0643\u064a\u0645\u0627\u0648\u064a\u0629 - \u0627\u0644\u0646\u064a\u0644 ",
    "\u0627\u0643\u062a\u0648\u0628\u0631 \u0641\u0627\u0631\u0645\u0627 \u0634 \u0645 \u0645 ",
    "\u0627\u0644\u0645\u0635\u0631\u064a\u0629 \u0627\u0644\u062f\u0648\u0644\u064a\u0629 \u0644\u0644\u0635\u0646\u0627\u0639\u0627\u062a \u0627\u0644\u062f\u0648\u0627\u0626\u064a\u0629 ",
    "\u0627\u0644\u0639\u0627\u0634\u0631 \u0645\u0646 \u0631\u0645\u0636\u0627\u0646 \u0644\u0644\u0635\u0646\u0627\u0639\u0627\u062a \u0627\u0644\u062f\u0648\u0627\u0626\u064a\u0629 \u0648\u0627\u0644\u0645\u0633\u062a\u062d\u0636\u0631\u0627\u062a \u0627\u0644\u062a\u0634\u062e\u064a\u0635\u064a\u0629 ",
    "\u0633\u0628\u0623 \u0627\u0644\u062f\u0648\u0644\u064a\u0629 \u0644\u0644\u0623\u062f\u0648\u064a\u0629 \u0648\u0627\u0644\u0635\u0646\u0627\u0639\u0627\u062a \u0627\u0644\u0643\u064a\u0645\u0627\u0648\u064a\u0629 ",
    "\u0627\u0631\u0627\u0628\u064a\u0627 \u0627\u0646\u0641\u0633\u062a\u0645\u0646\u062a\u0633 \u0647\u0648\u0644\u062f\u0646\u062c ",
    "\u0627\u0644\u0645\u0635\u0631\u064a\u0629 \u0644\u062a\u0637\u0648\u064a\u0631 \u0635\u0646\u0627\u0639\u0629 \u0627\u0644\u0628\u0646\u0627\u0621 ",
    "\u0627\u0644\u0641\u0646\u0627\u0631 \u0644\u0644\u0645\u0642\u0627\u0648\u0644\u0627\u062a \u0627\u0644\u0639\u0645\u0648\u0645\u064a\u0629 \u0648\u0627\u0644\u0625\u0646\u0634\u0627\u0621\u0627\u062a \u0648\u0627\u0644\u062a\u062c\u0627\u0631\u0629 \u0648\u0627\u0644\u0627\u0633\u062a\u064a\u0631\u0627\u062f \u0648\u0627\u0644\u062a\u0635\u062f\u064a\u0631 ",
    "\u0627\u0644\u062c\u064a\u0632\u0629 \u0627\u0644\u0639\u0627\u0645\u0629 \u0644\u0644\u0645\u0642\u0627\u0648\u0644\u0627\u062a \u0648\u0627\u0644\u0627\u0633\u062a\u062b\u0645\u0627\u0631 \u0627\u0644\u0639\u0642\u0627\u0631\u0649 \u0634 \u0645 \u0645 ",
    "\u0627\u0644\u0645\u0634\u0631\u0648\u0639\u0627\u062a \u0627\u0644\u0635\u0646\u0627\u0639\u064a\u0629 \u0648\u0627\u0644\u0647\u0646\u062f\u0633\u064a\u0629 ",
    "\u0627\u0644\u062e\u062f\u0645\u0627\u062a \u0627\u0644\u0645\u0644\u0627\u062d\u064a\u0629 \u0648\u0627\u0644\u0628\u062a\u0631\u0648\u0644\u064a\u0629 ",
    "\u0627\u0644\u0646\u0635\u0631 \u0644\u0644\u0623\u0639\u0645\u0627\u0644 \u0627\u0644\u0645\u062f\u0646\u064a\u0629 ",
    "\u0627\u0644\u062d\u0641\u0631 \u0627\u0644\u0648\u0637\u0646\u064a\u0629 ",
    "\u0623\u0648\u0631\u0627\u0633\u0643\u0648\u0645 \u0643\u0648\u0646\u0633\u062a\u0631\u0627\u0643\u0634\u0648\u0646 \u0628\u064a \u0627\u0644 \u0633\u064a ",
    "\u0627\u0644\u0635\u0639\u064a\u062f \u0627\u0644\u0639\u0627\u0645\u0629 \u0644\u0644\u0645\u0642\u0627\u0648\u0644\u0627\u062a \u0648\u0627\u0644\u0627\u0633\u062a\u062b\u0645\u0627\u0631 \u0627\u0644\u0639\u0642\u0627\u0631\u064a ",
    "\u0648\u0627\u062f\u064a \u0643\u0648\u0645 \u0627\u0645\u0628\u0648 \u0644\u0627\u0633\u062a\u0635\u0644\u0627\u062d \u0627\u0644\u0627\u0631\u0627\u0636\u064a ",
    "\u0635\u0646\u062f\u0648\u0642 \u0627\u0644\u0645\u0635\u0631\u064a\u064a\u0646 \u0644\u0644\u0627\u0633\u062a\u062b\u0645\u0627\u0631 \u0627\u0644\u0639\u0642\u0627\u0631\u064a ",
    "\u0627\u0644\u0627\u0644\u0648\u0645\u0646\u064a\u0648\u0645 \u0627\u0644\u0639\u0631\u0628\u064a\u0629 ",
    "\u0627\u0644\u0639\u0631\u0628\u064a\u0629 \u0644\u0644\u0623\u0633\u0645\u0646\u062a ",
    "\u0627\u0633\u064a\u0643 \u0644\u0644\u062a\u0639\u062f\u064a\u0646 ",
    "\u0645\u0635\u0631 \u0627\u0644\u0648\u0637\u0646\u064a\u0629 \u0644\u0644\u0635\u0644\u0628 \u0634 \u0645 \u0645 ",
    "\u0645\u0635\u0631 \u0644\u0644\u0627\u0644\u0648\u0645\u0646\u064a\u0648\u0645 ",
    "\u062d\u062f\u064a\u062f \u0639\u0632 \u0634 \u0645 \u0645 ",
    "\u0627\u0644\u0639\u0632 \u0627\u0644\u062f\u062e\u064a\u0644\u0629 \u0644\u0644\u0635\u0644\u0628 - \u0627\u0644\u0627\u0633\u0643\u0646\u062f\u0631\u064a\u0629 ",
    "\u0627\u0644\u062d\u062f\u064a\u062f \u0648\u0627\u0644\u0635\u0644\u0628 \u0627\u0644\u0645\u0635\u0631\u064a\u0629 ",
    "\u0627\u0644\u062d\u062f\u064a\u062f \u0648\u0627\u0644\u0635\u0644\u0628 \u0644\u0644\u0645\u0646\u0627\u062c\u0645 \u0648\u0627\u0644\u0645\u062d\u0627\u062c\u0631 ",
    "\u0645\u0635\u0631 \u0628\u0646\u0649 \u0633\u0648\u064a\u0641 \u0644\u0644\u0623\u0633\u0645\u0646\u062a ",
    "\u0645\u0635\u0631 \u0644\u0644\u0623\u0633\u0645\u0646\u062a - \u0642\u0646\u0627 ",
    "\u0645\u0635\u0631 \u0627\u0646\u062a\u0631\u0643\u0648\u0646\u062a\u0646\u0646\u062a\u0627\u0644 \u0644\u0635\u0646\u0627\u0639\u0629 \u0627\u0644\u062c\u0631\u0627\u0646\u064a\u062a \u0648\u0627\u0644\u0631\u062e\u0627\u0645 ",
    "\u0627\u0644\u0639\u0627\u0645\u0629 \u0644\u0645\u0646\u062a\u062c\u0627\u062a \u0627\u0644\u062e\u0632\u0641 \u0648\u0627\u0644\u0635\u064a\u0646\u064a ",
    "\u0627\u0633\u0645\u0646\u062a \u0633\u064a\u0646\u0627\u0621 ",
    "\u062c\u0646\u0648\u0628 \u0627\u0644\u0648\u0627\u062f\u064a \u0644\u0644\u0627\u0633\u0645\u0646\u062a \u0634 \u0645 \u0645 ",
    "\u0623\u0628\u0648 \u0642\u064a\u0631 \u0644\u0644\u0627\u0633\u0645\u062f\u0629 \u0648 \u0627\u0644\u0635\u0646\u0627\u0639\u0627\u062a \u0627\u0644\u0643\u064a\u0645\u0627\u0648\u064a\u0629 ",
    "\u0627\u0644\u0639\u0631\u0628\u064a\u0629 \u0644\u062d\u0644\u064a\u062c \u0627\u0644\u0623\u0642\u0637\u0627\u0646 ",
    "\u0627\u0637\u0644\u0633 \u0644\u0644\u0627\u0633\u062a\u062b\u0645\u0627\u0631 \u0648\u0627\u0644\u0635\u0646\u0627\u0639\u0627\u062a \u0627\u0644\u063a\u0630\u0627\u0626\u064a\u0629 ",
    "\u0627\u0644\u0639\u0631\u0628\u064a\u0629 \u0648\u0628\u0648\u0644\u0641\u0627\u0631\u0627 \u0644\u0644\u063a\u0632\u0644 \u0648\u0627\u0644\u0646\u0633\u064a\u062c ",
    "\u0628\u064a \u0627\u064a \u062f\u064a \u2013 \u0627\u0644\u0628\u062f\u0631 \u0644\u0644\u0627\u0633\u062a\u062b\u0645\u0627\u0631 \u0648\u0627\u0644\u062a\u0646\u0645\u064a\u0629 ",
    "\u0645\u0637\u0627\u062d\u0646 \u0645\u0635\u0631 \u0627\u0644\u0648\u0633\u0637\u0649 ",
    "\u062f\u0644\u062a\u0627 \u0644\u0644\u0637\u0628\u0627\u0639\u0629 \u0648\u0627\u0644\u062a\u063a\u0644\u064a\u0641 ",
    "\u0627\u0644\u0645\u0627\u0644\u064a\u0629 \u0648\u0627\u0644\u0635\u0646\u0627\u0639\u064a\u0629 \u0627\u0644\u0645\u0635\u0631\u064a\u0629 \u0634 \u0645 \u0645 ",
    "\u0627\u0644\u0635\u0646\u0627\u0639\u0627\u062a \u0627\u0644\u0643\u064a\u0645\u0627\u0648\u064a\u0629 \u0627\u0644\u0645\u0635\u0631\u064a\u0629 ",
    "\u0627\u0644\u0646\u0635\u0631 \u0644\u062a\u0635\u0646\u064a\u0639 \u0627\u0644\u062d\u0627\u0635\u0644\u0627\u062a \u0627\u0644\u0632\u0631\u0627\u0639\u064a\u0629 \u0634 \u0645 \u0645 ",
    "\u0627\u0644\u0645\u0635\u0631\u064a\u0629 \u0644\u0644\u062f\u0648\u0627\u062c\u0646 ",
    "\u0627\u0644\u0627\u0647\u0631\u0627\u0645 \u0644\u0644\u0637\u0628\u0627\u0639\u0629 \u0648\u0627\u0644\u062a\u063a\u0644\u064a\u0641 ",
    "\u0641\u064a\u0631\u0643\u064a\u0645 \u0645\u0635\u0631 \u0644\u0644\u0627\u0633\u0645\u062f\u0629 \u0648\u0627\u0644\u0643\u064a\u0645\u0627\u0648\u064a\u0627\u062a ",
    "\u062c\u0648\u0644\u062f\u0646 \u062a\u0643\u0633 \u0644\u0644\u0627\u0635\u0648\u0627\u0641 ",
    "\u0627\u0644\u062f\u0648\u0644\u064a\u0629 \u0644\u0644\u0623\u0633\u0645\u062f\u0629 \u0648\u0627\u0644\u0643\u064a\u0645\u0627\u0648\u064a\u0627\u062a ",
    "\u0627\u0644\u062f\u0648\u0644\u064a\u0629 \u0644\u0644\u0645\u062d\u0627\u0635\u064a\u0644 \u0627\u0644\u0632\u0631\u0627\u0639\u064a\u0629 ",
    "\u0627\u0644\u0627\u0633\u0645\u0627\u0639\u064a\u0644\u064a\u0629 \u0645\u0635\u0631 \u0644\u0644\u062f\u0648\u0627\u062c\u0646 ",
    "\u0643\u0641\u0631 \u0627\u0644\u0632\u064a\u0627\u062a \u0644\u0644\u0645\u0628\u064a\u062f\u0627\u062a \u0648\u0627\u0644\u0643\u064a\u0645\u0627\u0648\u064a\u0627\u062a ",
    "\u0627\u0644\u0634\u0631\u0642 \u0627\u0644\u0623\u0648\u0633\u0637 \u0644\u0635\u0646\u0627\u0639\u0629 \u0627\u0644\u0632\u062c\u0627\u062c \u0634 \u0645 \u0645 ",
    "\u0627\u0644\u0639\u0628\u0648\u0627\u062a \u0627\u0644\u0637\u0628\u064a\u0629 \u0634 \u0645 \u0645 ",
    "\u0645\u0635\u0631 \u0644\u0625\u0646\u062a\u0627\u062c \u0627\u0644\u0623\u0633\u0645\u062f\u0629 \u0634 \u0645 \u0645 ",
    "\u0645\u0635\u0631 \u0644\u0635\u0646\u0627\u0639\u0629 \u0627\u0644\u0643\u064a\u0645\u0627\u0648\u064a\u0627\u062a ",
    "\u0645\u0637\u0627\u062d\u0646 \u0648\u0645\u062e\u0627\u0628\u0632 \u0634\u0645\u0627\u0644 \u0627\u0644\u0642\u0627\u0647\u0631\u0629 ",
    "\u0645\u0635\u0631 \u0644\u0644\u0632\u064a\u0648\u062a \u0648\u0627\u0644\u0635\u0627\u0628\u0648\u0646 ",
    "\u0627\u0644\u0645\u0646\u0635\u0648\u0631\u0629 \u0644\u0644\u062f\u0648\u0627\u062c\u0646 ",
    "\u0634\u0645\u0627\u0644 \u0627\u0644\u0635\u0639\u064a\u062f \u0644\u0644\u062a\u0646\u0645\u064a\u0629 \u0648\u0627\u0644\u0627\u0646\u062a\u0627\u062c \u0627\u0644\u0632\u0631\u0627\u0639\u0649 ",
    "\u0627\u0644\u0628\u0648\u064a\u0627\u062a \u0648\u0627\u0644\u0635\u0646\u0627\u0639\u0627\u062a \u0627\u0644\u0643\u064a\u0645\u0627\u0648\u064a\u0629 ",
    "\u0627\u0644\u0642\u0627\u0647\u0631\u0629 \u0644\u0644\u062f\u0648\u0627\u062c\u0646 ",
    "\u0627\u0644\u0639\u0627\u0645\u0629 \u0644\u0635\u0646\u0627\u0639\u0629 \u0627\u0644\u0648\u0631\u0642 ",
    "\u0631\u0643\u0627\u0632 \u0627\u0644\u0642\u0627\u0628\u0636\u0629 \u0644\u0644\u0627\u0633\u062a\u062b\u0645\u0627\u0631 ",
    "\u0645\u0637\u0627\u062d\u0646 \u0648\u0645\u062e\u0627\u0628\u0632 \u062c\u0646\u0648\u0628 \u0627\u0644\u0642\u0627\u0647\u0631\u0629 \u0648\u0627\u0644\u062c\u064a\u0632\u0629 ",
    "\u0633\u064a\u062f\u0649 \u0643\u0631\u064a\u0631 \u0644\u0644\u0628\u062a\u0631\u0648\u0643\u064a\u0645\u0627\u0648\u064a\u0627\u062a - \u0633\u064a\u062f\u0628\u0643 ",
    "\u0627\u0644\u0634\u0631\u0642\u064a\u0629 \u0627\u0644\u0648\u0637\u0646\u064a\u0629 \u0644\u0644\u0627\u0645\u0646 \u0627\u0644\u063a\u0630\u0627\u0626\u064a ",
    "\u0627\u0644\u0627\u0633\u0643\u0646\u062f\u0631\u064a\u0629 \u0644\u0644\u063a\u0632\u0644 \u0648 \u0627\u0644\u0646\u0633\u064a\u062c ",
    "\u0627\u0644\u062f\u0644\u062a\u0627 \u0644\u0644\u0633\u0643\u0631 ",
    "\u0645\u0637\u0627\u062d\u0646 \u0645\u0635\u0631 \u0627\u0644\u0639\u0644\u064a\u0627 ",
    "\u064a\u0648\u0646\u064a\u0641\u0631\u0633\u0627\u0644 \u0644\u0635\u0646\u0627\u0639\u0629 \u0645\u0648\u0627\u062f \u0627\u0644\u062a\u0639\u0628\u0626\u0629 \u0648\u0627\u0644\u062a\u063a\u0644\u064a\u0641 \u0648\u0627\u0644\u0648\u0631\u0642 ",
    "\u0645\u0637\u0627\u062d\u0646 \u0648\u0633\u0637 \u0648\u063a\u0631\u0628 \u0627\u0644\u062f\u0644\u062a\u0627 ",
    "\u0627\u0644\u0632\u064a\u0648\u062a \u0627\u0644\u0645\u0633\u062a\u062e\u0644\u0635\u0629 \u0648\u0645\u0646\u062a\u062c\u0627\u062a\u0647\u0627 ",
    "\u0627\u0643\u0631\u0648 \u0645\u0635\u0631 \u0644\u0644\u0634\u062f\u0627\u062a \u0648\u0627\u0644\u0633\u0642\u0627\u0644\u0627\u062a \u0627\u0644\u0645\u0639\u062f\u0646\u064a\u0629 ",
    "\u0627\u0644\u0639\u0631\u0628\u064a\u0629 \u0644\u0644\u0645\u062d\u0627\u0628\u0633 \u0634 \u0645 \u0645 ",
    "\u0627\u0644\u0639\u0631\u0628\u064a\u0629 \u0644\u0644\u062e\u0632\u0641 \u0633\u064a\u0631\u0627\u0645\u064a\u0643\u0627 -\u0631\u064a\u0645\u0627\u0633 ",
    "\u0627\u0644\u0639\u0632 \u0644\u0644\u0633\u064a\u0631\u0627\u0645\u064a\u0643 \u0648\u0627\u0644\u0628\u0648\u0631\u0633\u0644\u064a\u0646 ",
    "\u0627\u0644\u0643\u0627\u0628\u0644\u0627\u062a \u0627\u0644\u0643\u0647\u0631\u0628\u0627\u0626\u064a\u0629 \u0627\u0644\u0645\u0635\u0631\u064a\u0629 ",
    "\u0627\u0644\u0635\u0646\u0627\u0639\u0627\u062a \u0627\u0644\u0647\u0646\u062f\u0633\u064a\u0629 \u0627\u0644\u0645\u0639\u0645\u0627\u0631\u064a\u0629 \u0644\u0644\u0627\u0646\u0634\u0627\u0621 \u0648 \u0627\u0644\u062a\u0639\u0645\u064a\u0631 ",
    "\u062c\u062f\u0648\u0649 \u0644\u0644\u062a\u0646\u0645\u064a\u0629 \u0627\u0644\u0635\u0646\u0627\u0639\u064a\u0629 ",
    "\u0627\u0644\u0645\u062c\u0645\u0648\u0639\u0629 \u0627\u0644\u0645\u062a\u0643\u0627\u0645\u0644\u0629 \u0644\u0644\u0627\u0639\u0645\u0627\u0644 \u0627\u0644\u0647\u0646\u062f\u0633\u064a\u0629 \u0634 \u0645 \u0645 ",
    "\u0644\u064a\u0633\u064a\u0643\u0648 - \u0645\u0635\u0631 ",
    "\u0641\u0627\u0631\u0648\u062a\u0643 \u0644\u0627\u0646\u0638\u0645\u0629 \u0627\u0644\u062a\u062d\u0643\u0645 \u0648\u0627\u0644\u0627\u062a\u0635\u0627\u0644\u0627\u062a ",
    "\u0627\u0644\u0633\u0648\u064a\u062f\u064a \u0627\u0644\u064a\u0643\u062a\u0631\u064a\u0643 \u0634 \u0645 \u0645 ",
    "\u0645\u0637\u0627\u062d\u0646 \u0648\u0645\u062e\u0627\u0628\u0632 \u0627\u0644\u0625\u0633\u0643\u0646\u062f\u0631\u064a\u0629 ",
    "\u0627\u0644\u0639\u0631\u0641\u0629 \u0644\u0644\u0627\u0633\u062a\u062b\u0645\u0627\u0631\u0627\u062a \u0648 \u0627\u0644\u0627\u0633\u062a\u0634\u0627\u0631\u0627\u062a ",
    "\u0627\u0644\u0639\u0627\u0645\u0629 \u0644\u0644\u0635\u0648\u0627\u0645\u0639 \u0648\u0627\u0644\u062a\u062e\u0632\u064a\u0646 ",
    "\u0645\u0635\u0631 \u0644\u0644\u0627\u0633\u0648\u0627\u0642 \u0627\u0644\u062d\u0631\u0629 ",
    "\u0627\u0644\u0645\u0624\u0634\u0631 \u0644\u0644\u0628\u0631\u0645\u062c\u064a\u0627\u062a \u0648\u0646\u0634\u0631 \u0627\u0644\u0645\u0639\u0644\u0648\u0645\u0627\u062a ",
    "\u0627\u064a \u0641\u0627\u064a\u0646\u0627\u0646\u0633 \u0644\u0644\u0627\u0633\u062a\u062b\u0645\u0627\u0631\u0627\u062a \u0627\u0644\u0645\u0627\u0644\u064a\u0629 \u0648\u0627\u0644\u0631\u0642\u0645\u064a\u0629 ",
    "\u0641\u0648\u0631\u064a \u0644\u062a\u0643\u0646\u0648\u0644\u0648\u062c\u064a\u0627 \u0627\u0644\u0628\u0646\u0648\u0643 \u0648\u0627\u0644\u0645\u062f\u0641\u0648\u0639\u0627\u062a \u0627\u0644\u0627\u0644\u0643\u062a\u0631\u0648\u0646\u064a\u0629 \u0634.\u0645.\u0645 ",
    "\u0631\u0627\u064a\u0629 \u0627\u0644\u0642\u0627\u0628\u0636\u0629 \u0644\u0644\u0627\u0633\u062a\u062b\u0645\u0627\u0631\u0627\u062a \u0627\u0644\u0645\u0627\u0644\u064a\u0629 ",
    "\u0641\u0631\u062a\u064a\u0643\u0627 \u0644\u0644\u0635\u0646\u0627\u0639\u0629 \u0648\u0627\u0644\u062a\u062c\u0627\u0631\u0629 ",
    "\u0627\u0644\u0627\u0633\u0643\u0646\u062f\u0631\u064a\u0629 \u0644\u062a\u062f\u0627\u0648\u0644 \u0627\u0644\u062d\u0627\u0648\u064a\u0627\u062a \u0648\u0627\u0644\u0628\u0636\u0627\u0626\u0639 ",
    "\u0627\u0644\u0642\u0646\u0627\u0629 \u0644\u0644\u062a\u0648\u0643\u064a\u0644\u0627\u062a \u0627\u0644\u0645\u0644\u0627\u062d\u064a\u0629 ",
    "\u0627\u0644\u0645\u0635\u0631\u064a\u0629 \u0644\u062e\u062f\u0645\u0627\u062a \u0627\u0644\u0646\u0642\u0644 ",
    "\u0627\u0644\u0639\u0631\u0628\u064a\u0629 \u0627\u0644\u0645\u062a\u062d\u062f\u0629 \u0644\u0644\u0634\u062d\u0646 \u0648\u0627\u0644\u062a\u0641\u0631\u064a\u063a ",
    "\u063a\u0627\u0632 \u0645\u0635\u0631 ",
    "\u0627\u0644\u0645\u0635\u0631\u064a\u0629 \u0644\u0644\u0645\u0646\u062a\u062c\u0639\u0627\u062a \u0627\u0644\u0633\u064a\u0627\u062d\u064a\u0629 \u0634 \u0645 \u0645 ",
    "\u0627\u0644\u0642\u0627\u0628\u0636\u0629 \u0627\u0644\u0645\u0635\u0631\u064a\u0629 \u0627\u0644\u0643\u0648\u064a\u062a\u064a\u0629"
  ]
};

Map<String, String> transs = {
  "THE EGYPTIAN MODERN EDUCATION SYSTEMS":
      "\u0627\u0644\u0645\u0635\u0631\u064a\u0629 \u0644\u0646\u0638\u0645 \u0627\u0644\u062a\u0639\u0644\u064a\u0645 \u0627\u0644\u062d\u062f\u064a\u062b\u0629 \u0634 \u0645 \u0645 ",
  "RAYA CONTACT CENTER":
      "\u0631\u0627\u064a\u0629 \u0644\u062e\u062f\u0645\u0627\u062a \u0645\u0631\u0627\u0643\u0632 \u0627\u0644\u0627\u062a\u0635\u0627\u0644\u0627\u062a ",
  "SUES CANAL COMPANY FOR TECHNOLOGY SETTLING":
      "\u0642\u0646\u0627\u0629 \u0627\u0644\u0633\u0648\u064a\u0633 \u0644\u062a\u0648\u0637\u064a\u0646 \u0627\u0644\u062a\u0643\u0646\u0648\u0644\u0648\u062c\u064a\u0627 ",
  "TRANSOCEANS TOURS":
      "\u0639\u0628\u0631 \u0627\u0644\u0645\u062d\u064a\u0637\u0627\u062a \u0644\u0644\u0633\u064a\u0627\u062d\u0629 ",
  "TELECOM EGYPT":
      "\u0627\u0644\u0645\u0635\u0631\u064a\u0629 \u0644\u0644\u0627\u062a\u0635\u0627\u0644\u0627\u062a ",
  "ORASCOM INVESTMENT HOLDING":
      "\u0623\u0648\u0631\u0627\u0633\u0643\u0648\u0645 \u0644\u0644\u0627\u0633\u062a\u062b\u0645\u0627\u0631 \u0627\u0644\u0642\u0627\u0628\u0636\u0629 ",
  "GHARBIA ISLAMIC HOUSING DEVELOPMENT":
      "\u0627\u0644\u063a\u0631\u0628\u064a\u0629 \u0627\u0644\u0627\u0633\u0644\u0627\u0645\u064a\u0629 \u0644\u0644\u062a\u0646\u0645\u064a\u0629 \u0627\u0644\u0639\u0645\u0631\u0627\u0646\u064a\u0629 ",
  "HELIOPOLIS HOUSING":
      "\u0645\u0635\u0631 \u0627\u0644\u062c\u062f\u064a\u062f\u0629 \u0644\u0644\u0627\u0633\u0643\u0627\u0646 \u0648\u0627\u0644\u062a\u0639\u0645\u064a\u0631 ",
  "ORIENTAL WEAVERS":
      "\u0627\u0644\u0646\u0633\u0627\u062c\u0648\u0646 \u0627\u0644\u0634\u0631\u0642\u064a\u0648\u0646 \u0644\u0644\u0633\u062c\u0627\u062f ",
  "RUBEX INTERNATIONAL FOR PLASTIC AND ACRYLIC MANUFACTURING":
      "\u0631\u0648\u0628\u0643\u0633 \u0627\u0644\u0639\u0627\u0644\u0645\u064a\u0647 \u0644\u062a\u0635\u0646\u064a\u0639 \u0627\u0644\u0628\u0644\u0627\u0633\u062a\u064a\u0643 \u0648\u0627\u0644\u0627\u0643\u0631\u064a\u0644\u0643 ",
  "THIQAH FOR BUSSINESS ADMINISTRATION AND DEVELOPMENT":
      "\u062b\u0642\u0629 \u0644\u0625\u062f\u0627\u0631\u0629 \u0627\u0644\u0623\u0639\u0645\u0627\u0644 \u0648\u0627\u0644\u062a\u0646\u0645\u064a\u0629 ",
  "THE ARAB DAIRY PRODUCTS CO. ARAB DAIRY - PANDA":
      "\u0627\u0644\u0639\u0631\u0628\u064a\u0629 \u0644\u0645\u0646\u062a\u062c\u0627\u062a \u0627\u0644\u0623\u0644\u0628\u0627\u0646\" \u0622\u0631\u0627\u0628 \u062f\u064a\u0631\u0649 - \u0628\u0627\u0646\u062f\u0627\" ",
  "AJWA FOR FOOD INDUSTRIES COMPANY EGYPT":
      "\u0645\u062c\u0645\u0648\u0639\u0629 \u0627\u062c\u0648\u0627\u0621 \u0644\u0644\u0635\u0646\u0627\u0639\u0627\u062a \u0627\u0644\u063a\u0630\u0627\u0626\u064a\u0629 - \u0645\u0635\u0631 ",
  "CAIRO OILS & SOAP":
      "\u0627\u0644\u0642\u0627\u0647\u0631\u0629 \u0644\u0644\u0632\u064a\u0648\u062a \u0648\u0627\u0644\u0635\u0627\u0628\u0648\u0646 ",
  "ARABIAN FOOD INDUSTRIES DOMTY":
      "\u0627\u0644\u0635\u0646\u0627\u0639\u0627\u062a \u0627\u0644\u063a\u0630\u0627\u0626\u064a\u0629 \u0627\u0644\u0639\u0631\u0628\u064a\u0629 ",
  "DICE SPORT & CASUAL WEAR":
      "\u062f\u0627\u064a\u0633 \u0644\u0644\u0645\u0644\u0627\u0628\u0633 \u0627\u0644\u062c\u0627\u0647\u0632\u0629 ",
  "EASTERN COMPANY":
      "\u0627\u0644\u0634\u0631\u0642\u064a\u0629 \u0627\u064a\u0633\u062a\u0631\u0646 \u0643\u0648\u0645\u0628\u0627\u0646\u064a ",
  "EAST DELTA FLOUR MILLS":
      "\u0645\u0637\u0627\u062d\u0646 \u0634\u0631\u0642 \u0627\u0644\u062f\u0644\u062a\u0627 ",
  "EDITA FOOD INDUSTRIES S.A.E":
      "\u0627\u064a\u062f\u064a\u062a\u0627 \u0644\u0644\u0635\u0646\u0627\u0639\u0627\u062a \u0627\u0644\u063a\u0630\u0627\u0626\u064a\u0629 \u0634 \u0645 \u0645 ",
  "ISMAILIA NATIONAL FOOD INDUSTRIES":
      "\u0627\u0644\u0627\u0633\u0645\u0627\u0639\u064a\u0644\u064a\u0629 \u0627\u0644\u0648\u0637\u0646\u064a\u0629 \u0644\u0644\u0635\u0646\u0627\u0639\u0627\u062a \u0627\u0644\u063a\u0630\u0627\u0626\u064a\u0629 ",
  "JUHAYNA FOOD INDUSTRIES":
      "\u062c\u0647\u064a\u0646\u0629 \u0644\u0644\u0635\u0646\u0627\u0639\u0627\u062a \u0627\u0644\u063a\u0630\u0627\u0626\u064a\u0629 \u0634 \u0645 \u0645 ",
  "EL NASR CLOTHES & TEXTILES (KABO)":
      "\u0627\u0644\u0646\u0635\u0631 \u0644\u0644\u0645\u0644\u0627\u0628\u0633 \u0648\u0627\u0644\u0645\u0646\u0633\u0648\u062c\u0627\u062a ",
  "OBOUR LAND FOR FOOD INDUSTRIES":
      "\u0639\u0628\u0648\u0631 \u0644\u0627\u0646\u062f \u0644\u0644\u0635\u0646\u0627\u0639\u0627\u062a \u0627\u0644\u063a\u0630\u0627\u0626\u064a\u0629 ",
  "CAIRO EDUCATIONAL SERVICES":
      "\u0627\u0644\u0642\u0627\u0647\u0631\u0629 \u0644\u0644\u062e\u062f\u0645\u0627\u062a \u0627\u0644\u062a\u0639\u0644\u064a\u0645\u064a\u0629 ",
  "CAIRO FOR INVESTMENT AND REAL ESTATE DEVELOPMENT":
      "\u0627\u0644\u0642\u0627\u0647\u0631\u0629 \u0644\u0644\u0625\u0633\u062a\u062b\u0645\u0627\u0631 \u0648\u0627\u0644\u062a\u0646\u0645\u064a\u0629 \u0627\u0644\u0639\u0642\u0627\u0631\u064a\u0629 ",
  "EGYPTIAN SATELLITES (NILESAT)":
      "\u0627\u0644\u0645\u0635\u0631\u064a\u0629 \u0644\u0644\u0623\u0642\u0645\u0627\u0631 \u0627\u0644\u0635\u0646\u0627\u0639\u064a\u0629 \u0634 \u0645 \u0645 ",
  "EL WADI FOR INTERNATIONAL AND INVESTEMENT DEVELOPMENT":
      "\u0627\u0644\u0648\u0627\u062f\u064a \u0627\u0644\u0639\u0627\u0644\u0645\u064a\u0629 \u0644\u0644\u0627\u0633\u062a\u062b\u0645\u0627\u0631 \u0648\u0627\u0644\u062a\u0646\u0645\u064a\u0629 ",
  "GOLDEN COAST COMPANY":
      "\u062c\u0648\u0644\u062f\u0646 \u0643\u0648\u0633\u062a \u0627\u0644\u0633\u062e\u0646\u0629 \u0644\u0644\u0627\u0633\u062a\u062b\u0645\u0627\u0631 \u0627\u0644\u0633\u064a\u0627\u062d\u0649 ",
  "MISR HOTELS":
      "\u0645\u0635\u0631 \u0644\u0644\u0641\u0646\u0627\u062f\u0642 ",
  "MARSA MARSA ALAM FOR TOURISM DEVELOPMENT":
      "\u0645\u0631\u0633\u0649 \u0645\u0631\u0633\u0649 \u0639\u0644\u0645 \u0644\u0644\u062a\u0646\u0645\u064a\u0629 \u0627\u0644\u0633\u064a\u0627\u062d\u064a\u0629 \u0634 \u0645 \u0645 ",
  "EGYPTIAN MEDIA PRODUCTION CITY":
      "\u0627\u0644\u0645\u0635\u0631\u064a\u0647 \u0644\u0645\u062f\u064a\u0646\u0629 \u0627\u0644\u0627\u0646\u062a\u0627\u062c \u0627\u0644\u0627\u0639\u0644\u0627\u0645\u0649 \u0634 \u0645 \u0645 ",
  "PYRAMISA HOTELS":
      "\u0628\u064a\u0631\u0627\u0645\u064a\u0632\u0627 \u0644\u0644\u0641\u0646\u0627\u062f\u0642 \u0648\u0627\u0644\u0642\u0631\u0649 \u0627\u0644\u0633\u064a\u0627\u062d\u064a\u0629 ",
  "SHARM DREAMS CO. FOR TOURISM INVESTMENT":
      "\u0634\u0627\u0631\u0645 \u062f\u0631\u064a\u0645\u0632 \u0644\u0644\u0627\u0633\u062a\u062b\u0645\u0627\u0631 \u0627\u0644\u0633\u064a\u0627\u062d\u0649 \u0634 \u0645 \u0645 ",
  "EL SHAMS PYRAMIDS FOR HOTELS& TOURISTIC PROJECTS":
      "\u0627\u0644\u0634\u0645\u0633 \u0628\u064a\u0631\u0627\u0645\u064a\u062f\u0632 \u0644\u0644\u0641\u0646\u0627\u062f\u0642 \u0648\u0627\u0644\u0645\u0646\u0634\u0623\u062a \u0627\u0644\u0633\u064a\u0627\u062d\u064a\u0629 \u0634 \u0645 \u0645 ",
  "TAALEEM MANAGEMENT SERVICES":
      "\u062a\u0639\u0644\u064a\u0645 \u0644\u062e\u062f\u0645\u0627\u062a \u0627\u0644\u0625\u062f\u0627\u0631\u0629 ",
  "BARBARY INVESTMENT GROUP ( BIG)":
      "\u0628\u0649 \u0627\u0649 \u062c\u0649 \u0644\u0644\u062a\u062c\u0627\u0631\u0629 \u0648\u0627\u0644\u0627\u0633\u062a\u062b\u0645\u0627\u0631 ",
  "GB CORP":
      "\u062c\u0649 \u0628\u0649 \u0627\u0648\u062a\u0648 \u0643\u0648\u0631\u0628\u0648\u0631\u064a\u0634\u0646 ",
  "GMC GROUP FOR INDUSTRIAL COMMERCIAL & FINANCIAL INVESTMENTS":
      "\u0645\u062c\u0645\u0648\u0639\u0629 \u062c\u0649 \u0625\u0645 \u0633\u0649 \u0644\u0644\u0627\u0633\u062a\u062b\u0645\u0627\u0631\u0627\u062a \u0627\u0644\u0635\u0646\u0627\u0639\u064a\u0629 \u0648\u0627\u0644\u062a\u062c\u0627\u0631\u064a\u0629 \u0648\u0627\u0644\u0645\u0627\u0644\u064a\u0629 ",
  "INTERNATIONAL BUSINESS CORPORATION FOR TRADING AND AGENCIES":
      "\u0627\u0646\u062a\u0631\u0646\u0627\u0634\u064a\u0648\u0646\u0627\u0644 \u0628\u0632\u0646\u064a\u0633 \u0643\u0648\u0631\u0628\u0648\u0631\u064a\u0634\u0646 \u0644\u0644\u062a\u062c\u0627\u0631\u0629 \u0648\u0627\u0644\u062a\u0648\u0643\u064a\u0644\u0627\u062a \u0627\u0644\u062a\u062c\u0627\u0631\u064a\u0629 ",
  "INTERNATIONAL COMPANY FOR MEDICAL INDUSTRIES -ICMI":
      "\u0627\u0644\u062f\u0648\u0644\u064a\u0629 \u0644\u0644\u0635\u0646\u0627\u0639\u0627\u062a \u0627\u0644\u0637\u0628\u064a\u0629 ",
  "IBNSINA PHARMA":
      "\u0627\u0628\u0646 \u0633\u064a\u0646\u0627 \u0641\u0627\u0631\u0645\u0627 ",
  "M.B ENGINEERING":
      "\u0625\u0645 \u0628\u064a \u0644\u0644\u0647\u0646\u062f\u0633\u0629 \u0648\u0627\u0644\u0645\u0642\u0627\u0648\u0644\u0627\u062a ",
  "MISR KUWAIT INVESTMENT & TRADING CO.":
      "\u0627\u0644\u0645\u0635\u0631\u064a\u0629 \u0627\u0644\u0643\u0648\u064a\u062a\u064a\u0629 \u0644\u0644\u0627\u0633\u062a\u062b\u0645\u0627\u0631 \u0648\u0627\u0644\u062a\u062c\u0627\u0631\u0629 ",
  "MM GROUP FOR INDUSTRY AND INTERNATIONAL TRADE":
      "\u0627\u0645.\u0627\u0645 \u062c\u0631\u0648\u0628 \u0644\u0644\u0635\u0646\u0627\u0639\u0629 \u0648\u0627\u0644\u062a\u062c\u0627\u0631\u0629 \u0627\u0644\u0639\u0627\u0644\u0645\u064a\u0629 ",
  "SAMAD MISR -EGYFERT": "\u0633\u0645\u0627\u062f \u0645\u0635\u0631 ",
  "EL ARABIA ENGINEERING INDUSTRIES":
      "\u0627\u0644\u0639\u0631\u0628\u064a\u0629 \u0644\u0644\u0635\u0646\u0627\u0639\u0627\u062a \u0627\u0644\u0647\u0646\u062f\u0633\u064a\u0629 ",
  "ALEXANDRIA MINERAL OILS COMPANY":
      "\u0627\u0644\u0627\u0633\u0643\u0646\u062f\u0631\u064a\u0629 \u0644\u0644\u0632\u064a\u0648\u062a \u0627\u0644\u0645\u0639\u062f\u0646\u064a\u0629 ",
  "GENERAL COMPANY FOR LAND RECLAMATION,DEVELOPMENT & RECONSTRU":
      "\u0627\u0644\u0639\u0627\u0645\u0629 \u0644\u0627\u0633\u062a\u0635\u0644\u0627\u062d \u0627\u0644\u0623\u0631\u0627\u0636\u064a \u0648\u0627\u0644\u062a\u0646\u0645\u064a\u0629 \u0648\u0627\u0644\u062a\u0639\u0645\u064a\u0631 ",
  "ARAB CO. FOR ASSET MANAGEMENT AND DEVELOPMENT":
      "\u0627\u0644\u0634\u0631\u0643\u0629 \u0627\u0644\u0639\u0631\u0628\u064a\u0629 \u0644\u0625\u062f\u0627\u0631\u0629 \u0648\u062a\u0637\u0648\u064a\u0631 \u0627\u0644\u0623\u0635\u0648\u0644 ",
  "ABU DHABI ISLAMIC BANK- EGYPT":
      "\u0645\u0635\u0631\u0641 \u0623\u0628\u0648 \u0638\u0628\u064a \u0627\u0644\u0625\u0633\u0644\u0627\u0645\u064a - \u0645\u0635\u0631 ",
  "ARAB DEVELOPMENT & REAL ESTATE INVESTMENT":
      "\u0623\u0631\u0627\u0628 \u0644\u0644\u062a\u0646\u0645\u064a\u0629 \u0648 \u0627\u0644\u0627\u0633\u062a\u062b\u0645\u0627\u0631 \u0627\u0644\u0639\u0642\u0627\u0631\u064a ",
  "EL AHLI INVESTMENT AND DEVELOPMENT":
      "\u0627\u0644\u0627\u0647\u0644\u064a \u0644\u0644\u062a\u0646\u0645\u064a\u0629 \u0648\u0627\u0644\u0627\u0633\u062a\u062b\u0645\u0627\u0631 ",
  "AMER GROUP HOLDING":
      "\u0645\u062c\u0645\u0648\u0639\u0629 \u0639\u0627\u0645\u0631 \u0627\u0644\u0642\u0627\u0628\u0636\u0629 \u0634 \u0645 \u0645 ",
  "ARAB MOLTAKA INVESTMENTS CO":
      "\u0627\u0644\u0645\u0644\u062a\u0642\u0649 \u0627\u0644\u0639\u0631\u0628\u064a \u0644\u0644\u0627\u0633\u062a\u062b\u0645\u0627\u0631\u0627\u062a ",
  "ALEXANDRIA NATIONAL COMPANY FOR FINANCIAL INVESTMENT":
      "\u0627\u0644\u0627\u0633\u0643\u0646\u062f\u0631\u064a\u0629 \u0627\u0644\u0648\u0637\u0646\u064a\u0629 \u0644\u0644\u0627\u0633\u062a\u062b\u0645\u0627\u0631\u0627\u062a \u0627\u0644\u0645\u0627\u0644\u064a\u0629 ",
  "ARAB DEVELOPERS HOLDING":
      "\u0627\u0644\u0645\u0637\u0648\u0631\u0648\u0646 \u0627\u0644\u0639\u0631\u0628 \u0627\u0644\u0642\u0627\u0628\u0636\u0629 ",
  "EGYPTIAN REAL ESTATE GROUP":
      "\u0627\u0644\u0645\u062c\u0645\u0648\u0639\u0629 \u0627\u0644\u0645\u0635\u0631\u064a\u0629 \u0627\u0644\u0639\u0642\u0627\u0631\u064a\u0629 ",
  "ASPIRE CAPITAL HOLDING FOR FINANCIAL INVESTMENTS":
      "\u0627\u0633\u0628\u0627\u064a\u0631 \u0643\u0627\u0628\u064a\u062a\u0627\u0644 \u0627\u0644\u0642\u0627\u0628\u0636\u0629 \u0644\u0644\u0627\u0633\u062a\u062b\u0645\u0627\u0631\u0627\u062a \u0627\u0644\u0645\u0627\u0644\u064a\u0629 ",
  "AL TAWFEEK LEASING COMPANY-A.T.LEASE":
      "\u0627\u0644\u062a\u0648\u0641\u064a\u0642 \u0644\u0644\u062a\u0623\u062c\u064a\u0631 \u0627\u0644\u062a\u0645\u0648\u064a\u0644\u064a ",
  "B INVESTMENTS HOLDING":
      "\u0628\u064a \u0625\u0646\u0641\u0633\u062a\u0645\u0646\u062a\u0633 \u0627\u0644\u0642\u0627\u0628\u0636\u0629 ",
  "BELTON FINANCIAL HOLDING":
      "\u0628\u0644\u062a\u0648\u0646 \u0627\u0644\u0645\u0627\u0644\u064a\u0629 \u0627\u0644\u0642\u0627\u0628\u0636\u0629 ",
  "SUEZ CANAL BANK S.A.E":
      "\u0628\u0646\u0643 \u0642\u0646\u0627\u0629 \u0627\u0644\u0633\u0648\u064a\u0633 ",
  "QALA FOR FINANCIAL INVESTMENTS":
      "\u0627\u0644\u0642\u0644\u0639\u0629 \u0644\u0644\u0627\u0633\u062a\u062b\u0645\u0627\u0631\u0627\u062a \u0627\u0644\u0645\u0627\u0644\u064a\u0629 \u0634 \u0645 \u0645 ",
  "GULF CANADIAN REAL ESTATE INVESTMENT CO.":
      "\u0627\u0644\u062e\u0644\u064a\u062c\u064a\u0629 \u0627\u0644\u0643\u0646\u062f\u064a\u0629 \u0644\u0644\u0627\u0633\u062a\u062b\u0645\u0627\u0631 \u0627\u0644\u0639\u0642\u0627\u0631\u064a \u0627\u0644\u0639\u0631\u0628\u064a ",
  "CI CAPITAL HOLDING FOR FINANCIAL INVESTMENTS":
      "\u0633\u064a \u0627\u064a \u0643\u0627\u0628\u064a\u062a\u0627\u0644 \u0627\u0644\u0642\u0627\u0628\u0636\u0629 \u0644\u0644\u0627\u0633\u062a\u062b\u0645\u0627\u0631\u0627\u062a \u0627\u0644\u0645\u0627\u0644\u064a\u0629 ",
  "CREDIT AGRICOLE EGYPT":
      "\u0643\u0631\u064a\u062f\u064a \u0623\u062c\u0631\u064a\u0643\u0648\u0644 - \u0645\u0635\u0631 ",
  "CONTACT FINANCIAL HOLDING":
      "\u0643\u0648\u0646\u062a\u0643\u062a \u0627\u0644\u0645\u0627\u0644\u064a\u0629 \u0627\u0644\u0642\u0627\u0628\u0636\u0629 ",
  "COMMERCIAL INTERNATIONAL BANK (EGYPT)":
      "\u0627\u0644\u0628\u0646\u0643 \u0627\u0644\u062a\u062c\u0627\u0631\u064a \u0627\u0644\u062f\u0648\u0644\u064a - \u0645\u0635\u0631 ",
  "COPPER FOR COMMERCIAL INVESTMENT & REAL ESTATE DEVELOPMENT":
      "\u0643\u0648\u0628\u0631 \u0644\u0644\u0627\u0633\u062a\u062b\u0645\u0627\u0631 \u0627\u0644\u062a\u062c\u0627\u0631\u064a \u0648\u0627\u0644\u062a\u0637\u0648\u064a\u0631 \u0627\u0644\u0639\u0642\u0627\u0631\u064a ",
  "DEVELOPMENT & ENGINEERING CONSULTANTS":
      "\u0627\u0644\u062a\u0639\u0645\u064a\u0631 \u0648\u0627\u0644\u0627\u0633\u062a\u0634\u0627\u0631\u0627\u062a \u0627\u0644\u0647\u0646\u062f\u0633\u064a\u0629 \u0634 \u0645 \u0645 ",
  "DELTA CONSTRUCTION & REBUILDING":
      "\u062f\u0644\u062a\u0627 \u0644\u0644\u0625\u0646\u0634\u0627\u0621 \u0648\u0627\u0644\u062a\u0639\u0645\u064a\u0631 \u0634 \u0645 \u0645 ",
  "DELTA INSURANCE":
      "\u0627\u0644\u062f\u0644\u062a\u0627 \u0644\u0644\u062a\u0623\u0645\u064a\u0646 ",
  "EL ARABIA FOR LAND RECLAMATION":
      "\u0627\u0644\u0639\u0631\u0628\u064a\u0629 \u0644\u0627\u0633\u062a\u0635\u0644\u0627\u062d \u0627\u0644\u0627\u0631\u0627\u0636\u064a \u0634 \u062a \u0645 \u0645 ",
  "EGYPTIAN ARABIAN(THEMAR)COMP. FOR SECURITIES&BONDS BROK. EAC":
      "EAC \u0627\u0644\u0645\u0635\u0631\u064a\u0629 \u0627\u0644\u0639\u0631\u0628\u064a\u0629 ",
  "OSOOL ESB SECURITIES BROKERAGE":
      "\u0627\u0635\u0648\u0644 \u0625\u0649 \u0625\u0633 \u0628\u0649 \u0644\u0644\u0648\u0633\u0627\u0637\u0629 \u0641\u064a \u0627\u0644\u0627\u0648\u0631\u0627\u0642 \u0627\u0644\u0645\u0627\u0644\u064a\u0629 ",
  "EGYPTIAN GULF BANK":
      "\u0627\u0644\u0628\u0646\u0643 \u0627\u0644\u0645\u0635\u0631\u064a \u0627\u0644\u062e\u0644\u064a\u062c\u064a ",
  "EGYPTIANS HOUSING DEVELOPMENT & RECONSTRUCTION":
      "\u0627\u0644\u0645\u0635\u0631\u064a\u064a\u0646 \u0644\u0644\u0627\u0633\u0643\u0627\u0646 \u0648\u0627\u0644\u062a\u0646\u0645\u064a\u0629 \u0648\u0627\u0644\u062a\u0639\u0645\u064a\u0631 \u0634 \u0645 \u0645 ",
  "EGYPTIANS FOR INVESTMENT & URBAN DEVELOPMENT":
      "\u0627\u0644\u0645\u0635\u0631\u064a\u064a\u0646 \u0644\u0644\u0627\u0633\u062a\u062b\u0645\u0627\u0631 \u0648 \u0627\u0644\u062a\u0646\u0645\u064a\u0629 \u0627\u0644\u0639\u0645\u0631\u0627\u0646\u064a\u0629 \u0634 \u0645 \u0645 ",
  "EL KAHERA HOUSING":
      "\u0627\u0644\u0642\u0627\u0647\u0631\u0629 \u0644\u0644\u0627\u0633\u0643\u0627\u0646 \u0648\u0627\u0644\u062a\u0639\u0645\u064a\u0631 ",
  "EL SHAMS HOUSING & URBANIZATION":
      "\u0627\u0644\u0634\u0645\u0633 \u0644\u0644\u0627\u0633\u0643\u0627\u0646 \u0648 \u0627\u0644\u062a\u0639\u0645\u064a\u0631 \u0634 \u0645 \u0645 ",
  "EMAAR MISR FOR DEVELOPMENT":
      "\u0625\u0639\u0645\u0627\u0631 \u0645\u0635\u0631 \u0644\u0644\u062a\u0646\u0645\u064a\u0629 \u0634.\u0645.\u0645 ",
  "EL OROUBA SECURITIES BROKERAGE":
      "\u0627\u0644\u0639\u0631\u0648\u0628\u0629 \u0644\u0644\u0633\u0645\u0633\u0631\u0629 \u0641\u0649 \u0627\u0644\u0623\u0648\u0631\u0627\u0642 \u0627\u0644\u0645\u0627\u0644\u064a\u0629 \u0634 \u0645 \u0645 ",
  "EXPORT DEVELOPMENT BANK OF EGYPT (EDBE)":
      "\u0627\u0644\u0628\u0646\u0643 \u0627\u0644\u0645\u0635\u0631\u064a \u0644\u062a\u0646\u0645\u064a\u0629 \u0627\u0644\u0635\u0627\u062f\u0631\u0627\u062a ",
  "FAISAL ISLAMIC BANK OF EGYPT - IN EGP":
      "\u0628\u0646\u0643 \u0641\u064a\u0635\u0644 \u0627\u0644\u0625\u0633\u0644\u0627\u0645\u064a \u0627\u0644\u0645\u0635\u0631\u064a ",
  "FAISAL ISLAMIC BANK OF EGYPT - IN US DOLLARS":
      "\u0628\u0646\u0643 \u0641\u064a\u0635\u0644 \u0627\u0644\u0625\u0633\u0644\u0627\u0645\u064a \u0627\u0644\u0645\u0635\u0631\u064a ",
  "FIRST INVESTMENT COMPANY AND REAL ESTATE DEVELOPMENT":
      "\u0627\u0644\u0623\u0648\u0644\u0649 \u0644\u0644\u0627\u0633\u062a\u062b\u0645\u0627\u0631 \u0648\u0627\u0644\u062a\u0646\u0645\u064a\u0629 \u0627\u0644\u0639\u0642\u0627\u0631\u064a\u0629 ",
  "GOLDEN PYRAMIDS PLAZA":
      "\u062c\u0648\u0644\u062f\u0646 \u0628\u064a\u0631\u0627\u0645\u064a\u062f\u0632 \u0628\u0644\u0627\u0632\u0627 ",
  "GRAND INVESTMENT CAPITAL":
      "\u062c\u0631\u0627\u0646\u062f \u0627\u0646\u0641\u0633\u062a\u0645\u0646\u062a \u0627\u0644\u0642\u0627\u0628\u0636\u0629 \u0644\u0644\u0627\u0633\u062a\u062b\u0645\u0627\u0631\u0627\u062a \u0627\u0644\u0645\u0627\u0644\u064a\u0629 \u0634 \u0645 \u0645 ",
  "HOUSING & DEVELOPMENT BANK":
      "\u0628\u0646\u0643 \u0627\u0644\u062a\u0639\u0645\u064a\u0631 \u0648\u0627\u0644\u0627\u0633\u0643\u0627\u0646 ",
  "EGYPTIAN FINANCIAL GROUP-HERMES HOLDING COMPANY":
      "\u0627\u0644\u0645\u062c\u0645\u0648\u0639\u0647 \u0627\u0644\u0645\u0627\u0644\u064a\u0647 \u0647\u064a\u0631\u0645\u0633 \u0627\u0644\u0642\u0627\u0628\u0636\u0647 ",
  "INTERNATIONAL CO FOR INVESTMENT & DEVELOPMENT":
      "\u0627\u0644\u0639\u0627\u0644\u0645\u064a\u0629 \u0644\u0644\u0627\u0633\u062a\u062b\u0645\u0627\u0631 \u0648\u0627\u0644\u062a\u0646\u0645\u064a\u0629 ",
  "INTERNATIONAL COMPANY FOR LEASING (INCOLEASE)":
      "\u0627\u0644\u062f\u0648\u0644\u064a\u0629 \u0644\u0644\u062a\u0623\u062c\u064a\u0631 \u0627\u0644\u062a\u0645\u0648\u064a\u0644\u064a ",
  "ISMAILIA DEVELOPMENT AND REAL ESTATE CO":
      "\u0627\u0644\u0627\u0633\u0645\u0627\u0639\u064a\u0644\u064a\u0629 \u0627\u0644\u062c\u062f\u064a\u062f\u0629 \u0644\u0644\u062a\u0637\u0648\u064a\u0631 \u0648\u0627\u0644\u062a\u0646\u0645\u064a\u0629 \u0627\u0644\u0639\u0645\u0631\u0627\u0646\u064a\u0629 ",
  "AL KHAIR RIVER FOR DEVELOPMENT AGRICULTURAL INVESTMENT&ENVIR":
      "\u0646\u0647\u0631 \u0627\u0644\u062e\u064a\u0631 \u0644\u0644\u062a\u0646\u0645\u064a\u0629 \u0648\u0627\u0644\u0623\u0633\u062a\u062b\u0645\u0627\u0631 \u0627\u0644\u0632\u0631\u0627\u0639\u0649 \u0648\u0627\u0644\u062e\u062f\u0645\u0627\u062a \u0627\u0644\u0628\u064a\u0626\u064a\u0629 ",
  "EL KAHERA EL WATANIA INVESTMENT":
      "\u0627\u0644\u0642\u0627\u0647\u0631\u0629 \u0627\u0644\u0648\u0637\u0646\u064a\u0629 \u0644\u0644\u0627\u0633\u062a\u062b\u0645\u0627\u0631 \u0648\u0627\u0644\u0627\u0648\u0631\u0627\u0642 \u0627\u0644\u0645\u0627\u0644\u064a\u0629 ",
  "EGYPTIAN GULF MARSEILIA FOR REAL ESTATE INVESTMENT":
      "\u0645\u0631\u0633\u064a\u0644\u064a\u0627 \u0627\u0644\u0645\u0635\u0631\u064a\u0629 \u0627\u0644\u062e\u0644\u064a\u062c\u064a\u0629 \u0644\u0644\u0627\u0633\u062a\u062b\u0645\u0627\u0631 \u0627\u0644\u0639\u0642\u0627\u0631\u0649 ",
  "MENA TOURISTIC & REAL ESTATE INVESTMENT":
      "\u0645\u064a\u0646\u0627 \u0644\u0644\u0627\u0633\u062a\u062b\u0645\u0627\u0631 \u0627\u0644\u0633\u064a\u0627\u062d\u064a \u0648\u0627\u0644\u0639\u0642\u0627\u0631\u064a ",
  "MEDINET NASR HOUSING":
      "\u0645\u062f\u064a\u0646\u0629 \u0646\u0635\u0631 \u0644\u0644\u0627\u0633\u0643\u0627\u0646 \u0648\u0627\u0644\u062a\u0639\u0645\u064a\u0631 ",
  "MOHANDES INSURANCE":
      "\u0627\u0644\u0645\u0647\u0646\u062f\u0633 \u0644\u0644\u062a\u0623\u0645\u064a\u0646 ",
  "NAEEM HOLDING":
      "\u0627\u0644\u0646\u0639\u064a\u0645 \u0627\u0644\u0642\u0627\u0628\u0636\u0629 \u0644\u0644\u0627\u0633\u062a\u062b\u0645\u0627\u0631\u0627\u062a ",
  "NATIONAL HOUSING FOR PROFESSIONAL SYNDICATES":
      "\u0627\u0644\u0648\u0637\u0646\u064a\u0629 \u0644\u0644\u0627\u0633\u0643\u0627\u0646 \u0644\u0644\u0646\u0642\u0627\u0628\u0627\u062a \u0627\u0644\u0645\u0647\u0646\u064a\u0629 ",
  "EL OBOUR REAL ESTATE INVESTMENT":
      "\u0627\u0644\u0639\u0628\u0648\u0631 \u0644\u0644\u0627\u0633\u062a\u062b\u0645\u0627\u0631 \u0627\u0644\u0639\u0642\u0627\u0631\u0649 ",
  "SIX OF OCTOBER DEVELOPMENT & INVESTMENT (SODIC)":
      "\u0627\u0644\u0633\u0627\u062f\u0633 \u0645\u0646 \u0627\u0643\u062a\u0648\u0628\u0631 \u0644\u0644\u062a\u0646\u0645\u064a\u0629 \u0648\u0627\u0644\u0627\u0633\u062a\u062b\u0645\u0627\u0631 ",
  "ODIN INVESTMENTS":
      "\u0623\u0648\u062f\u0646 \u0644\u0644\u0627\u0633\u062a\u062b\u0645\u0627\u0631\u0627\u062a \u0627\u0644\u0645\u0627\u0644\u064a\u0629 ",
  "ORASCOM FINANCIAL HOLDING":
      "\u0627\u0648\u0631\u0627\u0633\u0643\u0648\u0645 \u0627\u0644\u0645\u0627\u0644\u064a\u0629 \u0627\u0644\u0642\u0627\u0628\u0636\u0629 ",
  "ORASCOM DEVELOPMENT EGYPT":
      "\u0627\u0648\u0631\u0627\u0633\u0643\u0648\u0645 \u0644\u0644\u062a\u0646\u0645\u064a\u0629 \u0645\u0635\u0631 ",
  "PALM HILLS DEVELOPMENT COMPANY":
      "\u0628\u0627\u0644\u0645 \u0647\u064a\u0644\u0632 \u0644\u0644\u062a\u0639\u0645\u064a\u0631 \u0634 \u0645 \u0645 ",
  "PIONEERS PROPERTIES FOR URBAN DEVELOPMENT(PREDCO)":
      "\u0628\u0627\u064a\u0648\u0646\u064a\u0631\u0632 \u0628\u0631\u0648\u0628\u0631\u062a\u064a\u0632 \u0644\u0644\u062a\u0646\u0645\u064a\u0629 \u0627\u0644\u0639\u0645\u0631\u0627\u0646\u064a\u0629 ",
  "PRIME HOLDING":
      "\u0628\u0631\u0627\u064a\u0645 \u0627\u0644\u0642\u0627\u0628\u0636\u0629 \u0644\u0644\u0627\u0633\u062a\u062b\u0645\u0627\u0631\u0627\u062a \u0627\u0644\u0645\u0627\u0644\u064a\u0629 ",
  "QATAR NATIONAL BANK ALAHLY":
      "\u0628\u0646\u0643 \u0642\u0637\u0631 \u0627\u0644\u0648\u0637\u0646\u064a \u0627\u0644\u0627\u0647\u0644\u064a ",
  "REACAP FINANCIAL INVESTMENTS":
      "\u0631\u064a\u0643\u0627\u0628 \u0644\u0644\u0627\u0633\u062a\u062b\u0645\u0627\u0631\u0627\u062a \u0627\u0644\u0645\u0627\u0644\u064a\u0629 ",
  "ROWAD TOURISM (AL ROWAD)":
      "\u0631\u0648\u0627\u062f \u0627\u0644\u0633\u064a\u0627\u062d\u0629 ",
  "ARAB REAL ESTATE INVESTMENT CO.-ALICO":
      "\u0627\u0644\u0627\u0633\u062a\u062b\u0645\u0627\u0631 \u0627\u0644\u0639\u0642\u0627\u0631\u064a \u0627\u0644\u0639\u0631\u0628\u064a ",
  "REMCO FOR TOURISTIC VILLAGES CONSTRUCTION":
      "\u0631\u0645\u0643\u0648 \u0644\u0627\u0646\u0634\u0627\u0621 \u0627\u0644\u0642\u0631\u0649 \u0627\u0644\u0633\u064a\u0627\u062d\u064a\u0629 ",
  "SOCIETE ARABE INTERNATIONALE DE BANQUE S.A.E.":
      "\u0628\u0646\u0643 \u0627\u0644\u0634\u0631\u0643\u0629 \u0627\u0644\u0645\u0635\u0631\u0641\u064a\u0629 \u0627\u0644\u0639\u0631\u0628\u064a\u0629 \u0627\u0644\u062f\u0648\u0644\u064a\u0629 \u0634\u0631\u0643\u0629 \u0645\u0633\u0627\u0647\u0645\u0629 \u0645\u0635\u0631\u064a\u0629 ",
  "AL BARAKA BANK EGYPT":
      "\u0628\u0646\u0643 \u0627\u0644\u0628\u0631\u0643\u0629 - \u0645\u0635\u0631 ",
  "SAUDI EGYPTIAN INVESTMENT & FINANCE":
      "\u0627\u0644\u0633\u0639\u0648\u062f\u064a\u0629 \u0627\u0644\u0645\u0635\u0631\u064a\u0629 \u0644\u0644\u0627\u0633\u062a\u062b\u0645\u0627\u0631 \u0648\u0627\u0644\u062a\u0645\u0648\u064a\u0644 ",
  "TANMIYA FOR REAL ESTATE INVESTMENT":
      "\u062a\u0646\u0645\u064a\u0629 \u0644\u0644\u0627\u0633\u062a\u062b\u0645\u0627\u0631 \u0627\u0644\u0639\u0642\u0627\u0631\u064a ",
  "T M G HOLDING":
      "\u0645\u062c\u0645\u0648\u0639\u0629 \u0637\u0644\u0639\u062a \u0645\u0635\u0637\u0641\u0649 \u0627\u0644\u0642\u0627\u0628\u0636\u0629 ",
  "UNITED HOUSING & DEVELOPMENT":
      "\u0627\u0644\u0645\u062a\u062d\u062f\u0629 \u0644\u0644\u0627\u0633\u0643\u0627\u0646 \u0648\u0627\u0644\u062a\u0639\u0645\u064a\u0631 ",
  "UTOPIA":
      "\u064a\u0648\u062a\u0648\u0628\u064a\u0627 \u0644\u0644\u0627\u0633\u062a\u062b\u0645\u0627\u0631 \u0627\u0644\u0639\u0642\u0627\u0631\u064a \u0648\u0627\u0644\u0633\u064a\u0627\u062d\u064a ",
  "ZAHRAA MAADI INVESTMENT & DEVELOPMENT":
      "\u0632\u0647\u0631\u0627\u0621 \u0627\u0644\u0645\u0639\u0627\u062f\u064a \u0644\u0644\u0627\u0633\u062a\u062b\u0645\u0627\u0631 \u0648\u0627\u0644\u062a\u0639\u0645\u064a\u0631 ",
  "ALEXANDRIA NEW MEDICAL CENTER":
      "\u0627\u0644\u0627\u0633\u0643\u0646\u062f\u0631\u064a\u0629 \u0644\u0644\u062e\u062f\u0645\u0627\u062a \u0627\u0644\u0637\u0628\u064a\u0629 \u0627\u0644\u0645\u0631\u0643\u0632 \u0627\u0644\u0637\u0628\u064a \u0627\u0644\u062c\u062f\u064a\u062f - \u0627\u0644\u0625\u0633\u0643\u0646\u062f\u0631\u064a\u0629 \u0634.\u0645.\u0645 ",
  "CLEOPATRA HOSPITAL COMPANY":
      "\u0634\u0631\u0643\u0629 \u0645\u0633\u062a\u0634\u0641\u0649 \u0643\u0644\u064a\u0648\u0628\u0627\u062a\u0631\u0627 ",
  "INTEGRATED DIAGNOSTICS HOLDINGS PLC":
      "\u0627\u0646\u062a\u062c\u0631\u064a\u062a\u064a\u062f \u062f\u064a\u0627\u062c\u0646\u0648\u0633\u062a\u0643\u0633 \u0647\u0648\u0644\u062f\u064a\u0646\u062c\u0632 \u0628\u0649 \u0627\u0644 \u0633\u0649 ",
  "NOZHA INTERNATIONAL HOSPITAL":
      "\u0645\u0633\u062a\u0634\u0641\u0649 \u0627\u0644\u0646\u0632\u0647\u0647 \u0627\u0644\u062f\u0648\u0644\u064a \u0634 \u0645 \u0645 ",
  "SPEED MEDICAL":
      "\u0634\u0631\u0643\u0629 \u0633\u0628\u064a\u062f \u0645\u064a\u062f\u064a\u0643\u0627\u0644 ",
  "UNION PHARMACIST COMPANY FOR MEDICAL SERVICES AND INVESTMENT":
      "\u0627\u0644\u0627\u062a\u062d\u0627\u062f \u0627\u0644\u0635\u064a\u062f\u0644\u0649 \u0644\u0644\u062e\u062f\u0645\u0627\u062a \u0627\u0644\u0637\u0628\u064a\u0629 \u0648\u0627\u0644\u0627\u0633\u062a\u062b\u0645\u0627\u0631 ",
  "ARAB PHARMACEUTICALS":
      "\u0627\u0644\u0639\u0631\u0628\u064a\u0629 \u0644\u0644\u0623\u062f\u0648\u064a\u0629 \u0648\u0627\u0644\u0635\u0646\u0627\u0639\u0627\u062a \u0627\u0644\u0643\u064a\u0645\u0627\u0648\u064a\u0629 ",
  "ALEXANDRIA PHARMACEUTICALS":
      "\u0627\u0644\u0627\u0633\u0643\u0646\u062f\u0631\u064a\u0629 \u0644\u0644\u0627\u062f\u0648\u064a\u0629 \u0648\u0627\u0644\u0635\u0646\u0627\u0639\u0627\u062a \u0627\u0644\u0643\u064a\u0645\u0627\u0648\u064a\u0629 ",
  "GLAXO SMITH KLINE":
      "\u062c\u0644\u0627\u0643\u0633\u0648 \u0633\u0645\u064a\u062b\u0643\u0644\u0627\u064a\u0646 ",
  "CAIRO PHARMACEUTICALS":
      "\u0627\u0644\u0642\u0627\u0647\u0631\u0629 \u0644\u0644\u0627\u062f\u0648\u064a\u0629 \u0648\u0627\u0644\u0635\u0646\u0627\u0639\u0627\u062a \u0627\u0644\u0643\u064a\u0645\u0627\u0648\u064a\u0629 ",
  "MACRO GROUP PHARMACEUTICALS -MACRO CAPITAL":
      "\u0645\u0627\u0643\u0631\u0648 \u062c\u0631\u0648\u0628 \u0644\u0644\u0645\u0633\u062a\u062d\u0636\u0631\u0627\u062a \u0627\u0644\u0637\u0628\u064a\u0629 - \u0645\u0627\u0643\u0631\u0648 \u0643\u0627\u0628\u064a\u062a\u0627\u0644 ",
  "MINAPHARM PHARMACEUTICALS":
      "\u0645\u064a\u0646\u0627 \u0641\u0627\u0631\u0645 \u0644\u0644\u0623\u062f\u0648\u064a\u0629 \u0648\u0627\u0644\u0635\u0646\u0627\u0639\u0627\u062a \u0627\u0644\u0643\u064a\u0645\u0627\u0648\u064a\u0629 ",
  "MEMPHIS PHARMACEUTICALS":
      "\u0645\u0645\u0641\u064a\u0633 \u0644\u0644\u0627\u062f\u0648\u064a\u0629 \u0648\u0627\u0644\u0635\u0646\u0627\u0639\u0627\u062a \u0627\u0644\u0643\u064a\u0645\u0627\u0648\u064a\u0629 ",
  "EL-NILE CO. FOR PHARMACEUTICALS AND CHEMICAL INDUSTRIES":
      "\u0627\u0644\u0646\u064a\u0644 \u0644\u0644\u0627\u062f\u0648\u064a\u0629 \u0648\u0627\u0644\u0635\u0646\u0627\u0639\u0627\u062a \u0627\u0644\u0643\u064a\u0645\u0627\u0648\u064a\u0629 - \u0627\u0644\u0646\u064a\u0644 ",
  "OCTOBER PHARMA":
      "\u0627\u0643\u062a\u0648\u0628\u0631 \u0641\u0627\u0631\u0645\u0627 \u0634 \u0645 \u0645 ",
  "EGYPTIAN INTERNATIONAL PHARMACEUTICALS (EIPICO)":
      "\u0627\u0644\u0645\u0635\u0631\u064a\u0629 \u0627\u0644\u062f\u0648\u0644\u064a\u0629 \u0644\u0644\u0635\u0646\u0627\u0639\u0627\u062a \u0627\u0644\u062f\u0648\u0627\u0626\u064a\u0629 ",
  "TENTH OF RAMADAN PHARMACEUTICAL INDUSTRIES&DIAGNOSTIC-RAMEDA":
      "\u0627\u0644\u0639\u0627\u0634\u0631 \u0645\u0646 \u0631\u0645\u0636\u0627\u0646 \u0644\u0644\u0635\u0646\u0627\u0639\u0627\u062a \u0627\u0644\u062f\u0648\u0627\u0626\u064a\u0629 \u0648\u0627\u0644\u0645\u0633\u062a\u062d\u0636\u0631\u0627\u062a \u0627\u0644\u062a\u0634\u062e\u064a\u0635\u064a\u0629 ",
  "SABAA INTERNATIONAL COMPANY FOR PHARMACEUTICAL AND CHEMICAL":
      "\u0633\u0628\u0623 \u0627\u0644\u062f\u0648\u0644\u064a\u0629 \u0644\u0644\u0623\u062f\u0648\u064a\u0629 \u0648\u0627\u0644\u0635\u0646\u0627\u0639\u0627\u062a \u0627\u0644\u0643\u064a\u0645\u0627\u0648\u064a\u0629 ",
  "ARABIA INVESTMENTS HOLDING":
      "\u0627\u0631\u0627\u0628\u064a\u0627 \u0627\u0646\u0641\u0633\u062a\u0645\u0646\u062a\u0633 \u0647\u0648\u0644\u062f\u0646\u062c ",
  "THE EGYPTIAN COMPANY FOR CONSTRUCTION DEVELOPMENT-LIFT SLAB":
      "\u0627\u0644\u0645\u0635\u0631\u064a\u0629 \u0644\u062a\u0637\u0648\u064a\u0631 \u0635\u0646\u0627\u0639\u0629 \u0627\u0644\u0628\u0646\u0627\u0621 ",
  "AL FANAR CONTRACTING CONSTRUCTION TRADE IMPORT AND EXPORT CO":
      "\u0627\u0644\u0641\u0646\u0627\u0631 \u0644\u0644\u0645\u0642\u0627\u0648\u0644\u0627\u062a \u0627\u0644\u0639\u0645\u0648\u0645\u064a\u0629 \u0648\u0627\u0644\u0625\u0646\u0634\u0627\u0621\u0627\u062a \u0648\u0627\u0644\u062a\u062c\u0627\u0631\u0629 \u0648\u0627\u0644\u0627\u0633\u062a\u064a\u0631\u0627\u062f \u0648\u0627\u0644\u062a\u0635\u062f\u064a\u0631 ",
  "GIZA GENERAL CONTRACTING":
      "\u0627\u0644\u062c\u064a\u0632\u0629 \u0627\u0644\u0639\u0627\u0645\u0629 \u0644\u0644\u0645\u0642\u0627\u0648\u0644\u0627\u062a \u0648\u0627\u0644\u0627\u0633\u062a\u062b\u0645\u0627\u0631 \u0627\u0644\u0639\u0642\u0627\u0631\u0649 \u0634 \u0645 \u0645 ",
  "INDUSTRIAL & ENGINEERING ENTERPRISES CO.":
      "\u0627\u0644\u0645\u0634\u0631\u0648\u0639\u0627\u062a \u0627\u0644\u0635\u0646\u0627\u0639\u064a\u0629 \u0648\u0627\u0644\u0647\u0646\u062f\u0633\u064a\u0629 ",
  "MARIDIVE & OIL SERVICES":
      "\u0627\u0644\u062e\u062f\u0645\u0627\u062a \u0627\u0644\u0645\u0644\u0627\u062d\u064a\u0629 \u0648\u0627\u0644\u0628\u062a\u0631\u0648\u0644\u064a\u0629 ",
  "NASR COMPANY FOR CIVIL WORKS":
      "\u0627\u0644\u0646\u0635\u0631 \u0644\u0644\u0623\u0639\u0645\u0627\u0644 \u0627\u0644\u0645\u062f\u0646\u064a\u0629 ",
  "NATIONAL DRILLING":
      "\u0627\u0644\u062d\u0641\u0631 \u0627\u0644\u0648\u0637\u0646\u064a\u0629 ",
  "ORASCOM CONSTRUCTION PLC":
      "\u0623\u0648\u0631\u0627\u0633\u0643\u0648\u0645 \u0643\u0648\u0646\u0633\u062a\u0631\u0627\u0643\u0634\u0648\u0646 \u0628\u064a \u0627\u0644 \u0633\u064a ",
  "ELSAEED CONTRACTING& REAL ESTATE INVESTMENT COMPANY SCCD":
      "\u0627\u0644\u0635\u0639\u064a\u062f \u0627\u0644\u0639\u0627\u0645\u0629 \u0644\u0644\u0645\u0642\u0627\u0648\u0644\u0627\u062a \u0648\u0627\u0644\u0627\u0633\u062a\u062b\u0645\u0627\u0631 \u0627\u0644\u0639\u0642\u0627\u0631\u064a ",
  "WADI KOM OMBO LAND RECLAMATION":
      "\u0648\u0627\u062f\u064a \u0643\u0648\u0645 \u0627\u0645\u0628\u0648 \u0644\u0627\u0633\u062a\u0635\u0644\u0627\u062d \u0627\u0644\u0627\u0631\u0627\u0636\u064a ",
  "EGYPTIANS REAL ESTATE FUND CERTIFICATES":
      "\u0635\u0646\u062f\u0648\u0642 \u0627\u0644\u0645\u0635\u0631\u064a\u064a\u0646 \u0644\u0644\u0627\u0633\u062a\u062b\u0645\u0627\u0631 \u0627\u0644\u0639\u0642\u0627\u0631\u064a ",
  "ARAB ALUMINUM":
      "\u0627\u0644\u0627\u0644\u0648\u0645\u0646\u064a\u0648\u0645 \u0627\u0644\u0639\u0631\u0628\u064a\u0629 ",
  "ARABIAN CEMENT COMPANY":
      "\u0627\u0644\u0639\u0631\u0628\u064a\u0629 \u0644\u0644\u0623\u0633\u0645\u0646\u062a ",
  "ASEK COMPANY FOR MINING - ASCOM":
      "\u0627\u0633\u064a\u0643 \u0644\u0644\u062a\u0639\u062f\u064a\u0646 ",
  "MISR NATIONAL STEEL - ATAQA":
      "\u0645\u0635\u0631 \u0627\u0644\u0648\u0637\u0646\u064a\u0629 \u0644\u0644\u0635\u0644\u0628 \u0634 \u0645 \u0645 ",
  "EGYPT ALUMINUM":
      "\u0645\u0635\u0631 \u0644\u0644\u0627\u0644\u0648\u0645\u0646\u064a\u0648\u0645 ",
  "EZZ STEEL": "\u062d\u062f\u064a\u062f \u0639\u0632 \u0634 \u0645 \u0645 ",
  "EL EZZ ALDEKHELA STEEL - ALEXANDRIA":
      "\u0627\u0644\u0639\u0632 \u0627\u0644\u062f\u062e\u064a\u0644\u0629 \u0644\u0644\u0635\u0644\u0628 - \u0627\u0644\u0627\u0633\u0643\u0646\u062f\u0631\u064a\u0629 ",
  "EGYPTIAN IRON & STEEL":
      "\u0627\u0644\u062d\u062f\u064a\u062f \u0648\u0627\u0644\u0635\u0644\u0628 \u0627\u0644\u0645\u0635\u0631\u064a\u0629 ",
  "IRON AND STEEL FOR MINES AND QUARRIES":
      "\u0627\u0644\u062d\u062f\u064a\u062f \u0648\u0627\u0644\u0635\u0644\u0628 \u0644\u0644\u0645\u0646\u0627\u062c\u0645 \u0648\u0627\u0644\u0645\u062d\u0627\u062c\u0631 ",
  "MISR BENI SUEF CEMENT":
      "\u0645\u0635\u0631 \u0628\u0646\u0649 \u0633\u0648\u064a\u0641 \u0644\u0644\u0623\u0633\u0645\u0646\u062a ",
  "MISR CEMENT (QENA)":
      "\u0645\u0635\u0631 \u0644\u0644\u0623\u0633\u0645\u0646\u062a - \u0642\u0646\u0627 ",
  "MISR INTERCONTINENTAL FOR GRANITE & MARBLE (EGY-STON)":
      "\u0645\u0635\u0631 \u0627\u0646\u062a\u0631\u0643\u0648\u0646\u062a\u0646\u0646\u062a\u0627\u0644 \u0644\u0635\u0646\u0627\u0639\u0629 \u0627\u0644\u062c\u0631\u0627\u0646\u064a\u062a \u0648\u0627\u0644\u0631\u062e\u0627\u0645 ",
  "CERAMIC & PORCELAIN":
      "\u0627\u0644\u0639\u0627\u0645\u0629 \u0644\u0645\u0646\u062a\u062c\u0627\u062a \u0627\u0644\u062e\u0632\u0641 \u0648\u0627\u0644\u0635\u064a\u0646\u064a ",
  "SINAI CEMENT":
      "\u0627\u0633\u0645\u0646\u062a \u0633\u064a\u0646\u0627\u0621 ",
  "SOUTH VALLEY CEMENT":
      "\u062c\u0646\u0648\u0628 \u0627\u0644\u0648\u0627\u062f\u064a \u0644\u0644\u0627\u0633\u0645\u0646\u062a \u0634 \u0645 \u0645 ",
  "ABOU KIR FERTILIZERS":
      "\u0623\u0628\u0648 \u0642\u064a\u0631 \u0644\u0644\u0627\u0633\u0645\u062f\u0629 \u0648 \u0627\u0644\u0635\u0646\u0627\u0639\u0627\u062a \u0627\u0644\u0643\u064a\u0645\u0627\u0648\u064a\u0629 ",
  "ARAB COTTON GINNING":
      "\u0627\u0644\u0639\u0631\u0628\u064a\u0629 \u0644\u062d\u0644\u064a\u062c \u0627\u0644\u0623\u0642\u0637\u0627\u0646 ",
  "ATLAS FOR INVESTMENT AND FOOD INDUSTRIES":
      "\u0627\u0637\u0644\u0633 \u0644\u0644\u0627\u0633\u062a\u062b\u0645\u0627\u0631 \u0648\u0627\u0644\u0635\u0646\u0627\u0639\u0627\u062a \u0627\u0644\u063a\u0630\u0627\u0626\u064a\u0629 ",
  "ARAB POLVARA SPINNING & WEAVING CO.":
      "\u0627\u0644\u0639\u0631\u0628\u064a\u0629 \u0648\u0628\u0648\u0644\u0641\u0627\u0631\u0627 \u0644\u0644\u063a\u0632\u0644 \u0648\u0627\u0644\u0646\u0633\u064a\u062c ",
  "EL BADR INVESTMENT AND DEVELOPMENT BID":
      "\u0628\u064a \u0627\u064a \u062f\u064a \u2013 \u0627\u0644\u0628\u062f\u0631 \u0644\u0644\u0627\u0633\u062a\u062b\u0645\u0627\u0631 \u0648\u0627\u0644\u062a\u0646\u0645\u064a\u0629 ",
  "MIDDLE EGYPT FLOUR MILLS":
      "\u0645\u0637\u0627\u062d\u0646 \u0645\u0635\u0631 \u0627\u0644\u0648\u0633\u0637\u0649 ",
  "DELTA FOR PRINTING & PACKAGING":
      "\u062f\u0644\u062a\u0627 \u0644\u0644\u0637\u0628\u0627\u0639\u0629 \u0648\u0627\u0644\u062a\u063a\u0644\u064a\u0641 ",
  "EGYPTIAN FINANCIAL & INDUSTRIAL":
      "\u0627\u0644\u0645\u0627\u0644\u064a\u0629 \u0648\u0627\u0644\u0635\u0646\u0627\u0639\u064a\u0629 \u0627\u0644\u0645\u0635\u0631\u064a\u0629 \u0634 \u0645 \u0645 ",
  "EGYPTIAN CHEMICAL INDUSTRIES (KIMA)":
      "\u0627\u0644\u0635\u0646\u0627\u0639\u0627\u062a \u0627\u0644\u0643\u064a\u0645\u0627\u0648\u064a\u0629 \u0627\u0644\u0645\u0635\u0631\u064a\u0629 ",
  "EL NASR FOR MANUFACTURING AGRICULTURAL CROPS":
      "\u0627\u0644\u0646\u0635\u0631 \u0644\u062a\u0635\u0646\u064a\u0639 \u0627\u0644\u062d\u0627\u0635\u0644\u0627\u062a \u0627\u0644\u0632\u0631\u0627\u0639\u064a\u0629 \u0634 \u0645 \u0645 ",
  "EGYPT FOR POULTRY":
      "\u0627\u0644\u0645\u0635\u0631\u064a\u0629 \u0644\u0644\u062f\u0648\u0627\u062c\u0646 ",
  "EL AHRAM CO. FOR PRINTING AND PACKING":
      "\u0627\u0644\u0627\u0647\u0631\u0627\u0645 \u0644\u0644\u0637\u0628\u0627\u0639\u0629 \u0648\u0627\u0644\u062a\u063a\u0644\u064a\u0641 ",
  "FERCHEM MISR CO. FOR FERTILLIZERS & CHEMICALS":
      "\u0641\u064a\u0631\u0643\u064a\u0645 \u0645\u0635\u0631 \u0644\u0644\u0627\u0633\u0645\u062f\u0629 \u0648\u0627\u0644\u0643\u064a\u0645\u0627\u0648\u064a\u0627\u062a ",
  "GOLDEN TEXTILES & CLOTHES WOOL":
      "\u062c\u0648\u0644\u062f\u0646 \u062a\u0643\u0633 \u0644\u0644\u0627\u0635\u0648\u0627\u0641 ",
  "INTERNATIONAL COMPANY FOR FERTILIZERS & CHEMICALS":
      "\u0627\u0644\u062f\u0648\u0644\u064a\u0629 \u0644\u0644\u0623\u0633\u0645\u062f\u0629 \u0648\u0627\u0644\u0643\u064a\u0645\u0627\u0648\u064a\u0627\u062a ",
  "INTERNATIONAL AGRICULTURAL PRODUCTS":
      "\u0627\u0644\u062f\u0648\u0644\u064a\u0629 \u0644\u0644\u0645\u062d\u0627\u0635\u064a\u0644 \u0627\u0644\u0632\u0631\u0627\u0639\u064a\u0629 ",
  "ISMAILIA MISR POULTRY":
      "\u0627\u0644\u0627\u0633\u0645\u0627\u0639\u064a\u0644\u064a\u0629 \u0645\u0635\u0631 \u0644\u0644\u062f\u0648\u0627\u062c\u0646 ",
  "KAFR EL ZAYAT PESTICIDES":
      "\u0643\u0641\u0631 \u0627\u0644\u0632\u064a\u0627\u062a \u0644\u0644\u0645\u0628\u064a\u062f\u0627\u062a \u0648\u0627\u0644\u0643\u064a\u0645\u0627\u0648\u064a\u0627\u062a ",
  "MIDDLE EAST GLASS MANUFACTURING":
      "\u0627\u0644\u0634\u0631\u0642 \u0627\u0644\u0623\u0648\u0633\u0637 \u0644\u0635\u0646\u0627\u0639\u0629 \u0627\u0644\u0632\u062c\u0627\u062c \u0634 \u0645 \u0645 ",
  "MEDICAL PACKAGING COMPANY":
      "\u0627\u0644\u0639\u0628\u0648\u0627\u062a \u0627\u0644\u0637\u0628\u064a\u0629 \u0634 \u0645 \u0645 ",
  "MISR FRETILIZERS PRODUCTION COMPANY - MOPCO":
      "\u0645\u0635\u0631 \u0644\u0625\u0646\u062a\u0627\u062c \u0627\u0644\u0623\u0633\u0645\u062f\u0629 \u0634 \u0645 \u0645 ",
  "MISR CHEMICAL INDUSTRIES":
      "\u0645\u0635\u0631 \u0644\u0635\u0646\u0627\u0639\u0629 \u0627\u0644\u0643\u064a\u0645\u0627\u0648\u064a\u0627\u062a ",
  "NORTH CAIRO MILLS":
      "\u0645\u0637\u0627\u062d\u0646 \u0648\u0645\u062e\u0627\u0628\u0632 \u0634\u0645\u0627\u0644 \u0627\u0644\u0642\u0627\u0647\u0631\u0629 ",
  "MISR OILS & SOAP":
      "\u0645\u0635\u0631 \u0644\u0644\u0632\u064a\u0648\u062a \u0648\u0627\u0644\u0635\u0627\u0628\u0648\u0646 ",
  "MANSOURAH POULTRY":
      "\u0627\u0644\u0645\u0646\u0635\u0648\u0631\u0629 \u0644\u0644\u062f\u0648\u0627\u062c\u0646 ",
  "NORTHERN UPPER EGYPT DEVELOPMENT & AGRICULTURAL PRODUCTION":
      "\u0634\u0645\u0627\u0644 \u0627\u0644\u0635\u0639\u064a\u062f \u0644\u0644\u062a\u0646\u0645\u064a\u0629 \u0648\u0627\u0644\u0627\u0646\u062a\u0627\u062c \u0627\u0644\u0632\u0631\u0627\u0639\u0649 ",
  "PAINT & CHEMICALS INDUSTRIES (PACHIN)":
      "\u0627\u0644\u0628\u0648\u064a\u0627\u062a \u0648\u0627\u0644\u0635\u0646\u0627\u0639\u0627\u062a \u0627\u0644\u0643\u064a\u0645\u0627\u0648\u064a\u0629 ",
  "CAIRO POULTRY":
      "\u0627\u0644\u0642\u0627\u0647\u0631\u0629 \u0644\u0644\u062f\u0648\u0627\u062c\u0646 ",
  "RAKTA PAPER MANUFACTURING":
      "\u0627\u0644\u0639\u0627\u0645\u0629 \u0644\u0635\u0646\u0627\u0639\u0629 \u0627\u0644\u0648\u0631\u0642 ",
  "REKAZ FINANCIAL HOLDING":
      "\u0631\u0643\u0627\u0632 \u0627\u0644\u0642\u0627\u0628\u0636\u0629 \u0644\u0644\u0627\u0633\u062a\u062b\u0645\u0627\u0631 ",
  "SOUTH CAIRO & GIZA MILLS & BAKERIES":
      "\u0645\u0637\u0627\u062d\u0646 \u0648\u0645\u062e\u0627\u0628\u0632 \u062c\u0646\u0648\u0628 \u0627\u0644\u0642\u0627\u0647\u0631\u0629 \u0648\u0627\u0644\u062c\u064a\u0632\u0629 ",
  "SIDI KERIR PETROCHEMICALS - SIDPEC":
      "\u0633\u064a\u062f\u0649 \u0643\u0631\u064a\u0631 \u0644\u0644\u0628\u062a\u0631\u0648\u0643\u064a\u0645\u0627\u0648\u064a\u0627\u062a - \u0633\u064a\u062f\u0628\u0643 ",
  "SHARKIA NATIONAL FOOD":
      "\u0627\u0644\u0634\u0631\u0642\u064a\u0629 \u0627\u0644\u0648\u0637\u0646\u064a\u0629 \u0644\u0644\u0627\u0645\u0646 \u0627\u0644\u063a\u0630\u0627\u0626\u064a ",
  "ALEXANDRIA SPINNING & WEAVING (SPINALEX)":
      "\u0627\u0644\u0627\u0633\u0643\u0646\u062f\u0631\u064a\u0629 \u0644\u0644\u063a\u0632\u0644 \u0648 \u0627\u0644\u0646\u0633\u064a\u062c ",
  "DELTA SUGAR":
      "\u0627\u0644\u062f\u0644\u062a\u0627 \u0644\u0644\u0633\u0643\u0631 ",
  "UPPER EGYPT FLOUR MILLS":
      "\u0645\u0637\u0627\u062d\u0646 \u0645\u0635\u0631 \u0627\u0644\u0639\u0644\u064a\u0627 ",
  "UNIVERSAL FOR PAPER AND PACKAGING MATERIALS (UNIPACK":
      "\u064a\u0648\u0646\u064a\u0641\u0631\u0633\u0627\u0644 \u0644\u0635\u0646\u0627\u0639\u0629 \u0645\u0648\u0627\u062f \u0627\u0644\u062a\u0639\u0628\u0626\u0629 \u0648\u0627\u0644\u062a\u063a\u0644\u064a\u0641 \u0648\u0627\u0644\u0648\u0631\u0642 ",
  "MIDDLE & WEST DELTA FLOUR MILLS":
      "\u0645\u0637\u0627\u062d\u0646 \u0648\u0633\u0637 \u0648\u063a\u0631\u0628 \u0627\u0644\u062f\u0644\u062a\u0627 ",
  "EXTRACTED OILS":
      "\u0627\u0644\u0632\u064a\u0648\u062a \u0627\u0644\u0645\u0633\u062a\u062e\u0644\u0635\u0629 \u0648\u0645\u0646\u062a\u062c\u0627\u062a\u0647\u0627 ",
  "ACROW MISR":
      "\u0627\u0643\u0631\u0648 \u0645\u0635\u0631 \u0644\u0644\u0634\u062f\u0627\u062a \u0648\u0627\u0644\u0633\u0642\u0627\u0644\u0627\u062a \u0627\u0644\u0645\u0639\u062f\u0646\u064a\u0629 ",
  "ARAB VALVES COMPANY":
      "\u0627\u0644\u0639\u0631\u0628\u064a\u0629 \u0644\u0644\u0645\u062d\u0627\u0628\u0633 \u0634 \u0645 \u0645 ",
  "THE ARAB CERAMIC CO.- CERAMICA REMAS":
      "\u0627\u0644\u0639\u0631\u0628\u064a\u0629 \u0644\u0644\u062e\u0632\u0641 \u0633\u064a\u0631\u0627\u0645\u064a\u0643\u0627 -\u0631\u064a\u0645\u0627\u0633 ",
  "EL EZZ PORCELAIN (GEMMA)":
      "\u0627\u0644\u0639\u0632 \u0644\u0644\u0633\u064a\u0631\u0627\u0645\u064a\u0643 \u0648\u0627\u0644\u0628\u0648\u0631\u0633\u0644\u064a\u0646 ",
  "ELECTRO CABLE EGYPT":
      "\u0627\u0644\u0643\u0627\u0628\u0644\u0627\u062a \u0627\u0644\u0643\u0647\u0631\u0628\u0627\u0626\u064a\u0629 \u0627\u0644\u0645\u0635\u0631\u064a\u0629 ",
  "ENGINEERING INDUSTRIES (ICON)":
      "\u0627\u0644\u0635\u0646\u0627\u0639\u0627\u062a \u0627\u0644\u0647\u0646\u062f\u0633\u064a\u0629 \u0627\u0644\u0645\u0639\u0645\u0627\u0631\u064a\u0629 \u0644\u0644\u0627\u0646\u0634\u0627\u0621 \u0648 \u0627\u0644\u062a\u0639\u0645\u064a\u0631 ",
  "GADWA FOR INDUSTRIAL DEVELOPMENT":
      "\u062c\u062f\u0648\u0649 \u0644\u0644\u062a\u0646\u0645\u064a\u0629 \u0627\u0644\u0635\u0646\u0627\u0639\u064a\u0629 ",
  "INTEGRATED ENGINEERING GROUP S.A.E":
      "\u0627\u0644\u0645\u062c\u0645\u0648\u0639\u0629 \u0627\u0644\u0645\u062a\u0643\u0627\u0645\u0644\u0629 \u0644\u0644\u0627\u0639\u0645\u0627\u0644 \u0627\u0644\u0647\u0646\u062f\u0633\u064a\u0629 \u0634 \u0645 \u0645 ",
  "LECICO EGYPT": "\u0644\u064a\u0633\u064a\u0643\u0648 - \u0645\u0635\u0631 ",
  "PHARAOH TECH FOR CONTROL AND COMMUNICATION SYSTEMS":
      "\u0641\u0627\u0631\u0648\u062a\u0643 \u0644\u0627\u0646\u0638\u0645\u0629 \u0627\u0644\u062a\u062d\u0643\u0645 \u0648\u0627\u0644\u0627\u062a\u0635\u0627\u0644\u0627\u062a ",
  "ELSWEDY ELECTRIC":
      "\u0627\u0644\u0633\u0648\u064a\u062f\u064a \u0627\u0644\u064a\u0643\u062a\u0631\u064a\u0643 \u0634 \u0645 \u0645 ",
  "ALEXANDRIA FLOUR MILLS":
      "\u0645\u0637\u0627\u062d\u0646 \u0648\u0645\u062e\u0627\u0628\u0632 \u0627\u0644\u0625\u0633\u0643\u0646\u062f\u0631\u064a\u0629 ",
  "AL ARAFA FOR INVESTMENT AND CONSULTANCIES":
      "\u0627\u0644\u0639\u0631\u0641\u0629 \u0644\u0644\u0627\u0633\u062a\u062b\u0645\u0627\u0631\u0627\u062a \u0648 \u0627\u0644\u0627\u0633\u062a\u0634\u0627\u0631\u0627\u062a ",
  "GENERAL SILOS & STORAGE":
      "\u0627\u0644\u0639\u0627\u0645\u0629 \u0644\u0644\u0635\u0648\u0627\u0645\u0639 \u0648\u0627\u0644\u062a\u062e\u0632\u064a\u0646 ",
  "MISR DUTY FREE SHOPS":
      "\u0645\u0635\u0631 \u0644\u0644\u0627\u0633\u0648\u0627\u0642 \u0627\u0644\u062d\u0631\u0629 ",
  "AL MOASHER FOR PROGRAMMING AND INFORMATION DISSEMINATION":
      "\u0627\u0644\u0645\u0624\u0634\u0631 \u0644\u0644\u0628\u0631\u0645\u062c\u064a\u0627\u062a \u0648\u0646\u0634\u0631 \u0627\u0644\u0645\u0639\u0644\u0648\u0645\u0627\u062a ",
  "E-FINANCE FOR DIGITAL AND FINANCIAL INVESTMENTS":
      "\u0627\u064a \u0641\u0627\u064a\u0646\u0627\u0646\u0633 \u0644\u0644\u0627\u0633\u062a\u062b\u0645\u0627\u0631\u0627\u062a \u0627\u0644\u0645\u0627\u0644\u064a\u0629 \u0648\u0627\u0644\u0631\u0642\u0645\u064a\u0629 ",
  "FAWRY FOR BANKING TECHNOLOGY AND ELECTRONIC PAYMENT":
      "\u0641\u0648\u0631\u064a \u0644\u062a\u0643\u0646\u0648\u0644\u0648\u062c\u064a\u0627 \u0627\u0644\u0628\u0646\u0648\u0643 \u0648\u0627\u0644\u0645\u062f\u0641\u0648\u0639\u0627\u062a \u0627\u0644\u0627\u0644\u0643\u062a\u0631\u0648\u0646\u064a\u0629 \u0634.\u0645.\u0645 ",
  "RAYA HOLDING FOR FINANCIAL INVESTMENTS":
      "\u0631\u0627\u064a\u0629 \u0627\u0644\u0642\u0627\u0628\u0636\u0629 \u0644\u0644\u0627\u0633\u062a\u062b\u0645\u0627\u0631\u0627\u062a \u0627\u0644\u0645\u0627\u0644\u064a\u0629 ",
  "VERTIKA FOR INDUSTRY & TRADE":
      "\u0641\u0631\u062a\u064a\u0643\u0627 \u0644\u0644\u0635\u0646\u0627\u0639\u0629 \u0648\u0627\u0644\u062a\u062c\u0627\u0631\u0629 ",
  "ALEXANDRIA CONTAINERS AND GOODS":
      "\u0627\u0644\u0627\u0633\u0643\u0646\u062f\u0631\u064a\u0629 \u0644\u062a\u062f\u0627\u0648\u0644 \u0627\u0644\u062d\u0627\u0648\u064a\u0627\u062a \u0648\u0627\u0644\u0628\u0636\u0627\u0626\u0639 ",
  "CANAL SHIPPING AGENCIES":
      "\u0627\u0644\u0642\u0646\u0627\u0629 \u0644\u0644\u062a\u0648\u0643\u064a\u0644\u0627\u062a \u0627\u0644\u0645\u0644\u0627\u062d\u064a\u0629 ",
  "EGYPTIAN TRANSPORT (EGYTRANS)":
      "\u0627\u0644\u0645\u0635\u0631\u064a\u0629 \u0644\u062e\u062f\u0645\u0627\u062a \u0627\u0644\u0646\u0642\u0644 ",
  "UNITED ARAB SHIPPING":
      "\u0627\u0644\u0639\u0631\u0628\u064a\u0629 \u0627\u0644\u0645\u062a\u062d\u062f\u0629 \u0644\u0644\u0634\u062d\u0646 \u0648\u0627\u0644\u062a\u0641\u0631\u064a\u063a ",
  "NATURAL GAS & MINING PROJECT (EGYPT GAS)":
      "\u063a\u0627\u0632 \u0645\u0635\u0631 ",
  "EGYPTIAN FOR TOURISM RESORTS":
      "\u0627\u0644\u0645\u0635\u0631\u064a\u0629 \u0644\u0644\u0645\u0646\u062a\u062c\u0639\u0627\u062a \u0627\u0644\u0633\u064a\u0627\u062d\u064a\u0629 \u0634 \u0645 \u0645 ",
  "EGYPTIAN KUWAITI HOLDING":
      "\u0627\u0644\u0642\u0627\u0628\u0636\u0629 \u0627\u0644\u0645\u0635\u0631\u064a\u0629 \u0627\u0644\u0643\u0648\u064a\u062a\u064a\u0629"
};

Map<String, List> recommendList = {
  "result": [
    "MHOT",
    "EIUD",
    "SUGR",
    "MFPC",
    "DAPH",
    "EDFM",
    "SKPC",
    "IRAX",
    "VERT",
    "MOSC"
  ]
};

class RecommendDataModel {
  final String name;
  final String ramz;
  final String logo;
  RecommendDataModel({
    required this.name,
    required this.ramz,
    required this.logo,
  });
}

List<RecommendDataModel> recommendDataList1 = [
  RecommendDataModel(
      name: "مصر للفنادق ",
      ramz: "MHOT",
      logo: "https://s3-symbol-logo.tradingview.com/misr-hotels--big.svg"),
  RecommendDataModel(
      name: "المصريين للاستثمار و التنمية العمرانية ش م م ",
      ramz: "EIUD",
      logo:
          "https://s3-symbol-logo.tradingview.com/egyptians-for-investment-and-urban-development--big.svg"),
  RecommendDataModel(
      name: "الدلتا للسكر ",
      ramz: "SUGR",
      logo: "https://s3-symbol-logo.tradingview.com/delta-sugar--big.svg"),
  RecommendDataModel(
      name: "مصر لإنتاج الأسمدة ش م م ",
      ramz: "MFPC",
      logo:
          "https://s3-symbol-logo.tradingview.com/misr-fretilizers-production-company-mopco--big.svg"),
  RecommendDataModel(
    name: "التعمير والاستشارات الهندسية ش م م ",
    ramz: "DAPH",
    logo:
        "https://s3-symbol-logo.tradingview.com/development-and-engineering-consultants--big.svg",
  ),
  RecommendDataModel(
    name: "مطاحن شرق الدلتا ",
    ramz: "EDFM",
    logo:
        "https://s3-symbol-logo.tradingview.com/east-delta-flour-mills--big.svg",
  ),
  RecommendDataModel(
    name: "سيدى كرير للبتروكيماويات - سيدبك ",
    ramz: "SKPC",
    logo:
        "https://s3-symbol-logo.tradingview.com/sidi-kerir-petrochemicals-sidpec--big.svg",
  ),
  RecommendDataModel(
    name: "العز الدخيلة للصلب - الاسكندرية ",
    ramz: "IRAX",
    logo: "https://s3-symbol-logo.tradingview.com/ezz-steel--big.svg",
  ),
  RecommendDataModel(
    name: "فرتيكا للصناعة والتجارة ",
    ramz: "VERT",
    logo:
        "https://s3-symbol-logo.tradingview.com/vertika-for-industry-and-trade--big.svg",
  ),
  RecommendDataModel(
    name: "مصر للزيوت والصابون ",
    ramz: "MOSC",
    logo: "https://s3-symbol-logo.tradingview.com/misr-oils-and-soap--big.svg",
  ),
];

/// ~> IRAX, MIPH, MFPC,WCDF, UEFM, EDFM, AXPH, ORAS, GSSC, OCPH
List<RecommendDataModel> recommendDataList2 = [
  RecommendDataModel(
    name: "العز الدخيلة للصلب - الاسكندرية ",
    ramz: "IRAX",
    logo: "https://s3-symbol-logo.tradingview.com/ezz-steel--big.svg",
  ),
  RecommendDataModel(
    name: "مينا فارم للأدوية والصناعات الكيماوية ",
    ramz: "MIPH",
    logo:
        "https://s3-symbol-logo.tradingview.com/minapharm-pharmaceuticals--big.svg",
  ),
  RecommendDataModel(
    name: "مصر لإنتاج الأسمدة ش م م ",
    ramz: "MFPC",
    logo:
        "https://s3-symbol-logo.tradingview.com/misr-fretilizers-production-company-mopco--big.svg",
  ),
  RecommendDataModel(
    name: "مطاحن وسط وغرب الدلتا ",
    ramz: "WCDF",
    logo:
        "https://s3-symbol-logo.tradingview.com/middle-and-west-delta-flour-mills--big.svg",
  ),
  RecommendDataModel(
    name: "مطاحن مصر العليا ",
    ramz: "UEFM",
    logo:
        "https://s3-symbol-logo.tradingview.com/upper-egypt-flour-mills--big.svg",
  ),
  RecommendDataModel(
    name: "مطاحن شرق الدلتا ",
    ramz: "EDFM",
    logo:
        "https://s3-symbol-logo.tradingview.com/east-delta-flour-mills--big.svg",
  ),
  RecommendDataModel(
    name: "الاسكندرية للادوية والصناعات الكيماوية ",
    ramz: "AXPH",
    logo:
        "https://s3-symbol-logo.tradingview.com/alexandria-pharmaceuticals--big.svg",
  ),
  RecommendDataModel(
    name: "أوراسكوم كونستراكشون بي ال سي ",
    ramz: "ORAS",
    logo:
        "https://s3-symbol-logo.tradingview.com/orascom-construction-plc--big.svg",
  ),
  RecommendDataModel(
    name: "العامة للصوامع والتخزين ",
    ramz: "GSSC",
    logo:
        "https://s3-symbol-logo.tradingview.com/general-silos-and-storage--big.svg",
  ),
  RecommendDataModel(
    name: "اكتوبر فارما ش م م ",
    ramz: "OCPH",
    logo: "https://s3-symbol-logo.tradingview.com/october-pharma--big.svg",
  ),
];

//********************************************************** 
 
