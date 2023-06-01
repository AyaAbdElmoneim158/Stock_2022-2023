import 'dart:async';

import 'package:app/shared/components/components.dart';
import 'package:app/shared/components/constants.dart';
import 'package:app/shared/cubit/cubit.dart';
import 'package:app/shared/cubit/states.dart';
import 'package:app/shared/router/routes.dart';
import 'package:app/shared/styles/colors.dart';
import 'package:app/shared/styles/style.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:animate_do/animate_do.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool flag = true;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        if (state is AuthLoginWithEmailAppSuccessState ||
            state is AuthWithGoogleAppSuccessState ||
            state is AuthWithFacebookAppSuccessState) {
          debugPrint("AuthLoginWithEmailAppSuccessState");
          // Navigator.popAndPushNamed(context, AppRoutes.successRoute);
          flag = false;
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(snackbarErr(state,
                message: "تم التسجيل بنجاح ",
                contentType: ContentType.success));
          Timer(const Duration(seconds: 3), () {
            Navigator.popAndPushNamed(context, AppRoutes.successRoute);
          });
        }
        if (state is AuthLoginWithEmailAppErrorState) {
          debugPrint("AuthLoginWithEmailAppErrorState");

          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(snackbarErr(state,
                message: state.err, contentType: ContentType.failure));
        }
        if (state is AuthLoginWithEmailApploadingState) {
          debugPrint("AuthLoginWithEmailApploadingState");
        }
        if (state is AuthWithGoogleAppErrorState) {
          debugPrint("AuthWithGoogleAppErrorState");
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(snackbarErr(state,
                message: state.err, contentType: ContentType.failure));
        }
        if (state is AuthWithFacebookAppErrorState) {
          debugPrint("AuthWithGoogleAppErrorState");
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(snackbarErr(state,
                message: state.err, contentType: ContentType.failure));
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
                        flag
                            ? ZoomIn(
                                duration: const Duration(milliseconds: 500),
                                child: defaultField(
                                    hintText: Constants.emailFeild,
                                    labelText: Constants.emailFeild,
                                    controller: emailController,
                                    validator: (val) => val!.isEmpty
                                        ? Constants.emailFeildAlert
                                        : null,
                                    onChanged: (val) =>
                                        appCubit.changeEmail(val)),
                              )
                            : ZoomOut(
                                duration: const Duration(milliseconds: 500),
                                child: defaultField(
                                    hintText: Constants.emailFeild,
                                    labelText: Constants.emailFeild,
                                    controller: emailController,
                                    validator: (val) => val!.isEmpty
                                        ? Constants.emailFeildAlert
                                        : null,
                                    onChanged: (val) =>
                                        appCubit.changeEmail(val)),
                              ),
                        SizedBox(height: size.height * 0.03),
                        flag
                            ? ZoomIn(
                                duration: const Duration(milliseconds: 1000),
                                child: defaultField(
                                    hintText: Constants.passwordFeild,
                                    labelText: Constants.passwordFeild,
                                    controller: passwordController,
                                    validator: (val) => val!.isEmpty
                                        ? Constants.passwordFeildAlert
                                        : null,
                                    onChanged: (val) =>
                                        appCubit.changePassword(val)),
                              )
                            : ZoomOut(
                                duration: const Duration(milliseconds: 1000),
                                child: defaultField(
                                    hintText: Constants.passwordFeild,
                                    labelText: Constants.passwordFeild,
                                    controller: passwordController,
                                    validator: (val) => val!.isEmpty
                                        ? Constants.passwordFeildAlert
                                        : null,
                                    onChanged: (val) =>
                                        appCubit.changePassword(val)),
                              ),
                        SizedBox(height: size.height * 0.01),
                        flag
                            ? ZoomIn(
                                duration: const Duration(milliseconds: 1500),
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
                                      Navigator.pushNamed(context,
                                          AppRoutes.resetPasswordRoute);
                                    },
                                  ),
                                ),
                              )
                            : ZoomOut(
                                duration: const Duration(milliseconds: 1500),
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
                                      Navigator.pushNamed(context,
                                          AppRoutes.resetPasswordRoute);
                                    },
                                  ),
                                ),
                              ),
                        SizedBox(height: size.height * 0.02),
                        flag
                            ? ZoomIn(
                                duration: const Duration(milliseconds: 2000),
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
                              )
                            : ZoomOut(
                                duration: const Duration(milliseconds: 2000),
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
                        flag
                            ? ZoomIn(
                                duration: const Duration(milliseconds: 2500),
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
                                          text: Constants.register,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall!
                                              .copyWith(
                                                  color: secondColor,
                                                  fontSize: 19),
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
                              )
                            : ZoomOut(
                                duration: const Duration(milliseconds: 2500),
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
                                          text: Constants.register,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall!
                                              .copyWith(
                                                  color: secondColor,
                                                  fontSize: 19),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            flag
                                ? FadeInRight(
                                    duration:
                                        const Duration(milliseconds: 3000),
                                    child: SocailCArd(
                                      icon:
                                          'https://raw.githubusercontent.com/abuanwar072/E-commerce-Complete-Flutter-UI/0fa7a49a5168accec5b55f0e12a689715cdb2683/assets/icons/google-icon.svg',
                                      press: () => appCubit.loginWithGoogle(),
                                    ),
                                  )
                                : FadeOutRight(
                                    duration:
                                        const Duration(milliseconds: 3000),
                                    child: SocailCArd(
                                      icon:
                                          'https://raw.githubusercontent.com/abuanwar072/E-commerce-Complete-Flutter-UI/0fa7a49a5168accec5b55f0e12a689715cdb2683/assets/icons/google-icon.svg',
                                      press: () => appCubit.loginWithGoogle(),
                                    ),
                                  ),
                            const SizedBox(width: 20),
                            flag
                                ? FadeInLeft(
                                    duration:
                                        const Duration(milliseconds: 3000),
                                    child: SocailCArd(
                                      icon:
                                          'https://raw.githubusercontent.com/abuanwar072/E-commerce-Complete-Flutter-UI/0fa7a49a5168accec5b55f0e12a689715cdb2683/assets/icons/facebook-2.svg',
                                      press: () => appCubit.loginWithFacebook(),
                                    ),
                                  )
                                : FadeOutLeft(
                                    duration:
                                        const Duration(milliseconds: 3000),
                                    child: SocailCArd(
                                      icon:
                                          'https://raw.githubusercontent.com/abuanwar072/E-commerce-Complete-Flutter-UI/0fa7a49a5168accec5b55f0e12a689715cdb2683/assets/icons/facebook-2.svg',
                                      press: () => appCubit.loginWithFacebook(),
                                    ),
                                  ),
                          ],
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
