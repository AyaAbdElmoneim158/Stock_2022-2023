bool lang = true;
bool theme = true;

abstract class Constants {
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
