import 'package:app/shared/styles/colors.dart';
import 'package:app/models/sector_model.dart';

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
//!~> EndPoints: =====================================<
  static const String baseUrl = "https://scrap-29ek.onrender.com/stock/";
}

List<SectorModle> sectorsData = [
  SectorModle(
      id: docmentIdFormLocationData(),
      image:
          "https://cdn3d.iconscout.com/3d/premium/thumb/maintenance-8563469-6757413.png",
      name: 'Commercial Services'),
  SectorModle(
      id: docmentIdFormLocationData(),
      image:
          "https://cdn3d.iconscout.com/3d/premium/thumb/phone-call-5630233-4696758.png",
      name: 'Communications'),
  SectorModle(
      id: docmentIdFormLocationData(),
      image:
          "https://cdn3d.iconscout.com/3d/premium/thumb/television-3181988-2654891.png",
      name: 'Consumer Durables'),
  SectorModle(
      id: docmentIdFormLocationData(),
      image:
          "https://cdn3d.iconscout.com/3d/premium/thumb/food-with-handbag-3311567-2754877@0.png",
      name: 'Consumer Non-Durables'),
  SectorModle(
      id: docmentIdFormLocationData(),
      image:
          "https://cdn3d.iconscout.com/3d/premium/thumb/customer-service-4735929-3946408.png",
      name: 'Consumer Services'),
  SectorModle(
      id: docmentIdFormLocationData(),
      image:
          "https://cdn3d.iconscout.com/3d/premium/thumb/conveyor-belt-with-box-8620070-6817269.png",
      name: 'Distribution Services'),
  SectorModle(
      id: docmentIdFormLocationData(),
      image:
          "https://cdn3d.iconscout.com/3d/premium/thumb/nft-technology-4965490-4137450.png",
      name: 'Electronic Technology'),
  SectorModle(
      id: docmentIdFormLocationData(),
      image:
          "https://cdn3d.iconscout.com/3d/premium/thumb/power-plug-6814916-5602598.png",
      name: 'Energy Minerals'),
  SectorModle(
      id: docmentIdFormLocationData(),
      image:
          "https://cdn3d.iconscout.com/3d/premium/thumb/tax-4506355-3738612.png",
      name: 'Finance'),
  SectorModle(
      id: docmentIdFormLocationData(),
      image:
          "https://cdn3d.iconscout.com/3d/premium/thumb/medical-health-services-6102630-5058808.png",
      name: 'Health Services'),
  SectorModle(
      id: docmentIdFormLocationData(),
      image:
          "https://cdn3d.iconscout.com/3d/premium/thumb/medical-app-5949224-4915820.png",
      name: 'Health Technology'),
  SectorModle(
      id: docmentIdFormLocationData(),
      image:
          "https://cdn3d.iconscout.com/3d/premium/thumb/tower-crane-with-boxes-8620513-6817349.png",
      name: 'Industrial Services'),
  SectorModle(
      id: docmentIdFormLocationData(),
      image:
          "https://cdn3d.iconscout.com/3d/premium/thumb/pie-chart-4475268-3718885.png",
      name: 'Miscellaneous'),
  SectorModle(
      id: docmentIdFormLocationData(),
      image:
          "https://cdn3d.iconscout.com/3d/premium/thumb/data-science-server-6342279-5231435.png",
      name: 'Non-Energy Minerals'),
  SectorModle(
      id: docmentIdFormLocationData(),
      image:
          "https://cdn3d.iconscout.com/3d/premium/thumb/productivity-4615174-3832864.png",
      name: 'Process Industries'),
  SectorModle(
      id: docmentIdFormLocationData(),
      image:
          "https://cdn3d.iconscout.com/3d/premium/thumb/product-management-7542873-6166208.png",
      name: 'Producer Manufacturing'),
  SectorModle(
      id: docmentIdFormLocationData(),
      image:
          "https://cdn3d.iconscout.com/3d/premium/thumb/ethereum-crypto-coins-buy-with-tablet-5008435-4171630.png",
      name: 'Retail Trade'),
  SectorModle(
      id: docmentIdFormLocationData(),
      image:
          "https://cdn3d.iconscout.com/3d/premium/thumb/cloud-technology-6345845-5231415.png",
      name: 'Technology Services'),
  SectorModle(
      id: docmentIdFormLocationData(),
      image:
          "https://cdn3d.iconscout.com/3d/premium/thumb/travelling-3593376-3010859@0.png",
      name: 'Transportation'),
  SectorModle(
      id: docmentIdFormLocationData(),
      image:
          "https://cdn3d.iconscout.com/3d/premium/thumb/mobile-payment-6521691-5409544.png",
      name: 'Utilities'),
];
