import 'package:app/shared/components/components.dart';
import 'package:app/shared/components/constants.dart';
import 'package:app/shared/cubit/cubit.dart';
import 'package:app/shared/cubit/states.dart';
import 'package:app/shared/router/routes.dart';
import 'package:app/shared/styles/colors.dart';
import 'package:app/shared/styles/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:animate_do/animate_do.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        if (state is AuthLoginWithEmailAppSuccessState) {
          debugPrint("AuthLoginWithEmailAppSuccessState");
          Navigator.popAndPushNamed(context, AppRoutes.navbarRoute);
        }
        if (state is AuthLoginWithEmailAppErrorState) {
          debugPrint("AuthLoginWithEmailAppErrorState");
          final snackBar = SnackBar(
            elevation: 0,
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            content: AwesomeSnackbarContent(
              title: 'Error..!',
              message: state.err,
              contentType: ContentType.failure,
            ),
          );

          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(snackBar);
        }
        if (state is AuthLoginWithEmailApploadingState) {
          debugPrint("AuthLoginWithEmailApploadingState");
        }
        if (state is AuthWithGoogleAppErrorState) {
          debugPrint("AuthWithGoogleAppErrorState");
          final snackBar = SnackBar(
            elevation: 0,
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            content: AwesomeSnackbarContent(
              title: 'Error..!',
              message: state.err,
              contentType: ContentType.failure,
            ),
          );

          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(snackBar);
        }
      },
      builder: (context, state) {
        final appCubit = AppCubit.get(context);
        return Scaffold(
            body: Center(
          child: SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Image.asset(
                //   'assets/login-arrow.png',
                //   width: 100,
                //   fit: BoxFit.cover,
                // ),
                Text(Constants.loginTitle, style: titleStyle(context)),
                Form(
                  key: formKey,
                  child: Padding(
                    padding: EdgeInsets.all(size.height * 0.02),
                    child: Column(
                      children: [
                        SizedBox(height: size.height * 0.03),
                        ZoomIn(
                          duration: const Duration(milliseconds: 500),
                          child: defaultField(
                              hintText: Constants.loginTitle,
                              labelText: Constants.emailFeild,
                              controller: emailController,
                              validator: (val) => val!.isEmpty
                                  ? Constants.emailFeildAlert
                                  : null,
                              onChanged: (val) => appCubit.changeEmail(val)),
                        ),
                        SizedBox(height: size.height * 0.03),
                        ZoomIn(
                          duration: const Duration(milliseconds: 700),
                          child: defaultField(
                              hintText: Constants.passwordFeild,
                              labelText: Constants.passwordFeild,
                              controller: passwordController,
                              validator: (val) => val!.isEmpty
                                  ? Constants.passwordFeildAlert
                                  : null,
                              onChanged: (val) => appCubit.changePassword(val)),
                        ),
                        SizedBox(height: size.height * 0.01),
                        ZoomIn(
                          duration: const Duration(milliseconds: 900),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: InkWell(
                              child: Text(
                                Constants.forgetPasswordWithEmail,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      color: firstColor,
                                    ),
                              ),
                              onTap: () {
                                //! 🙈 -------------------------------
                                Navigator.pushNamed(
                                    context, AppRoutes.resetPasswordRoute);
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: size.height * 0.02),
                        ZoomIn(
                          duration: const Duration(milliseconds: 1100),
                          child: defaultButton(
                            text: Constants.loginBtn,
                            color: firstColor,
                            context: context,
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                debugPrint(
                                    "_emailController.text ${emailController.text}");
                                debugPrint(
                                    "_passwordController.text ${passwordController.text}");
                                appCubit.loginWithEmail();
                              }
                            },
                          ),
                        ),
                        SizedBox(height: size.height * 0.01),
                        ZoomIn(
                          duration: const Duration(milliseconds: 1250),
                          child: Align(
                            alignment: Alignment.center,
                            child: InkWell(
                              child: Text.rich(
                                TextSpan(children: [
                                  TextSpan(
                                      text: Constants.toRegister,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                            color: textColor,
                                          )),
                                  TextSpan(
                                    text: "register",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(
                                            color: secondColor, fontSize: 19),
                                  )
                                ]),
                              ),
                              // ToDo :: Nav to register
                              onTap: () {
                                // Navigator.of(context).pushNamed(AppRoutes.registerPageRoute);
                                Navigator.pushNamed(
                                    context, AppRoutes.registerRoute);
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: size.height * 0.04),
                        ZoomIn(
                          duration: const Duration(milliseconds: 1500),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            child: SizedBox(
                              width: double.infinity,
                              child: Card(
                                color: whiteColor.withOpacity(0.9),
                                child: IconButton(
                                    // ToDo :: google signIn
                                    onPressed: () => appCubit.loginWithGoogle(),
                                    icon: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.network(
                                          'https://raw.githubusercontent.com/TarekAlabd/flutter-ecommerce-live-coding/d297f8e673e54a8ba11d2305db22d29f214960c8/assets/google-svgrepo-com.svg',
                                          width: 30,
                                        ),
                                        Text(
                                          Constants.googleText,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall!
                                              .copyWith(
                                                  color: firstColor,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    )),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
      },
    );
  }
}
