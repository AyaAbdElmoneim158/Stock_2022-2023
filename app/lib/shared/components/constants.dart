// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app/models/sector_model.dart';
import 'package:app/shared/styles/colors.dart';

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
  static List<Map<String, dynamic>> onboaringData = [
    {
      'image':
          'https://cdn3d.iconscout.com/3d/premium/thumb/stock-market-profit-8268826-6594786.png',
      // 'https://cdn3d.iconscout.com/3d/premium/thumb/stock-research-7252794-5914997.png',
      // 'https://ouch-cdn2.icons8.com/yIxQmzj1OHH3S9AiIgelaTGdpj3wApWqSqFh80arSEA/rs:fit:784:828/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9wbmcvMTMx/L2NmOGIzZmY4LWRh/YjEtNDdiMS1hZGQ4/LWFkMTUwZTQwNzIx/NC5wbmc.png',
      'text': onboardingText1,
      'textColor': textColor,
      'btnColor': secondColor,
    },
    {
      'image':
          'https://cdn3d.iconscout.com/3d/premium/thumb/stock-market-growth-8268827-6594787.png',
      // 'https://cdn3d.iconscout.com/3d/premium/thumb/stock-market-investment-5768786-4833583.png',
      //'https://ouch-cdn2.icons8.com/oEXWmNUZgj3vd_T5XSJe2dTB1GFWIBeJ1QEqRWw76O8/rs:fit:784:748/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9wbmcvMzM1/L2Q3MjMyYzJlLTk0/NTMtNDUzMC1iZTEx/LWQ2MDZiN2RjYmFm/Yy5wbmc.png',
      'text': onboardingText2,
      'textColor': whiteColor,
      'btnColor': whiteColor //,
    },
    {
      'image':
          'https://cdn3d.iconscout.com/3d/premium/thumb/trade-graph-6780336-5580788.png',
      // 'https://cdn3d.iconscout.com/3d/premium/thumb/stock-exchange-6020107-4974984.png',
      //'https://ouch-cdn2.icons8.com/g8bZd-d4qiYuomOBWh3x61II6HlK8Ir2zp_a2cFTcCA/rs:fit:784:784/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9wbmcvNDI4/LzdjMjEyYjgzLTg0/NjQtNDQzMS04NzAz/LTNkNzk1YmUyMzli/MC5wbmc.png',
      'text': onboardingText3,
      'textColor': whiteColor,
      'btnColor': firstColor,
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

//!~> EndPoints: =====================================<
  static const String baseUrl = "https://scrap-29ek.onrender.com/stock/";
}
