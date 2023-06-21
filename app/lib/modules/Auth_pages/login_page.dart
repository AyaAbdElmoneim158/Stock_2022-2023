import 'dart:async';

import 'package:app/shared/components/components.dart';
import 'package:app/shared/components/constants.dart';
import 'package:app/shared/cubit/cubit.dart';
import 'package:app/shared/cubit/states.dart';
import 'package:app/shared/router/routes.dart';
import 'package:app/shared/styles/colors.dart';
import 'package:app/shared/styles/size_config.dart';

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
    // final size = MediaQuery.of(context).size;
    SizeConfig().init(context);

    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        if (state is AuthLoginWithEmailAppSuccessState ||
            state is AuthWithGoogleAppSuccessState) {
          debugPrint("AuthLoginWithEmailAppSuccessState");
          // Navigator.popAndPushNamed(context, AppRoutes.successRoute);
          flag = false;
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(snackbarErr(state,
                message: Constants.successSign,
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
                // message: state.err,
                title: Constants.err,
                message: getMessageFromErrorCode(errorCode: state.err),
                contentType: ContentType.failure));
        }
        if (state is AuthLoginWithEmailApploadingState) {
          debugPrint("AuthLoginWithEmailApploadingState");
        }
        if (state is AuthWithGoogleAppErrorState) {
          debugPrint("AuthWithGoogleAppErrorState");
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(snackbarErr(state,
                // message: state.err,
                title: Constants.err,
                message: getMessageFromErrorCode(errorCode: state.err),
                contentType: ContentType.failure));
        }
      },
      builder: (context, state) {
        final appCubit = AppCubit.get(context);
        return Scaffold(
            appBar: generalAppbar(context),
            backgroundColor: AppColors.kBackgroundColor,
            body: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    //! Image.....................................................
                    flag
                        ? FadeInDown(
                            duration: const Duration(milliseconds: 500),
                            child: FadeInImage.assetNetwork(
                              height: SizeConfig.screenHeight! * 0.3,
                              width: double.infinity,
                              placeholder: 'assets/spinner.gif',
                              image:
                                  'https://img.freepik.com/free-vector/privacy-policy-concept-illustration_114360-7853.jpg?size=626&ext=jpg',
                            ),
                          )
                        : FadeInUp(
                            duration: const Duration(milliseconds: 500),
                            child: FadeInImage.assetNetwork(
                              height: SizeConfig.screenHeight! * 0.3,
                              width: double.infinity,
                              placeholder: 'assets/spinner.gif',
                              image:
                                  'https://img.freepik.com/free-vector/privacy-policy-concept-illustration_114360-7853.jpg?size=626&ext=jpg',
                            ),
                          ),

                    //! text.....................................................
                    flag
                        ? FadeInDown(
                            duration: const Duration(milliseconds: 500),
                            child: Text(Constants.loginTitle,
                                style: AppTextStyles.titleStyle(context)
                                    .copyWith(color: AppColors.kTextColor)),
                          )
                        : FadeInUp(
                            duration: const Duration(milliseconds: 500),
                            child: Text(Constants.loginTitle,
                                style: AppTextStyles.titleStyle(context)
                                    .copyWith(color: AppColors.kTextColor)),
                          ),

                    Form(
                      key: formKey,
                      child: Padding(
                        padding: EdgeInsets.all(
                            SizeConfig.screenWidth! * Constants.padding * 1.3),
                        child: Column(
                          children: [
                            SizedBox(
                                height: SizeConfig.screenHeight! *
                                    Constants.sizedBox),
                            flag
                                ? ZoomIn(
                                    duration:
                                        const Duration(milliseconds: 1000),
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
                                    duration:
                                        const Duration(milliseconds: 1000),
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
                            SizedBox(
                                height: SizeConfig.screenWidth! *
                                    Constants.sizedBox),
                            flag
                                ? ZoomIn(
                                    duration:
                                        const Duration(milliseconds: 1500),
                                    child: PasswordFeild(
                                        controller: passwordController,
                                        onChanged: (val) =>
                                            appCubit.changePassword(val)),
                                  )
                                : ZoomOut(
                                    duration:
                                        const Duration(milliseconds: 1500),
                                    child: PasswordFeild(
                                        controller: passwordController,
                                        onChanged: (val) =>
                                            appCubit.changePassword(val)),
                                  ),
                            SizedBox(
                                height: SizeConfig.screenWidth! *
                                    Constants.sizedBox /
                                    2),
                            flag
                                ? ZoomIn(
                                    duration:
                                        const Duration(milliseconds: 2000),
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: InkWell(
                                        child: Text(
                                          Constants.forgetPasswordWithEmail,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                                color: AppColors.firstColor,
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
                                    duration:
                                        const Duration(milliseconds: 2000),
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: InkWell(
                                        child: Text(
                                          Constants.forgetPasswordWithEmail,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                                color: AppColors.kTextColor,
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
                            SizedBox(
                                height: SizeConfig.screenHeight! *
                                    Constants.sizedBox /
                                    2),
                            flag
                                ? ZoomIn(
                                    duration:
                                        const Duration(milliseconds: 2500),
                                    child: (state
                                            is AuthLoginWithEmailApploadingState)
                                        ? CircularProgressIndicator(
                                            color: AppColors.kPrimaryColor)
                                        : (state
                                                is AuthLoginWithEmailAppSuccessState)
                                            ? defaultButton(
                                                text: Constants.loginBtn,
                                                color: AppColors.firstColor,
                                                context: context,
                                                onPressed: () {
                                                  if (formKey.currentState!
                                                      .validate()) {
                                                    debugPrint(
                                                        "_emailController.text ${emailController.text}");
                                                    debugPrint(
                                                        "_passwordController.text ${passwordController.text}");
                                                    appCubit.loginWithEmail();
                                                  }
                                                },
                                              )
                                            : defaultButton(
                                                text: Constants.loginBtn,
                                                color: AppColors.firstColor,
                                                context: context,
                                                onPressed: () {
                                                  if (formKey.currentState!
                                                      .validate()) {
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
                                    duration:
                                        const Duration(milliseconds: 2500),
                                    child: defaultButton(
                                      text: Constants.loginBtn,
                                      color: AppColors.firstColor,
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
                            SizedBox(
                                height: SizeConfig.screenWidth! *
                                    Constants.sizedBox /
                                    2),
                            flag
                                ? ZoomIn(
                                    duration:
                                        const Duration(milliseconds: 2500),
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
                                                      color:
                                                          AppColors.textColor,
                                                    )),
                                            TextSpan(
                                              text: Constants.register,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall!
                                                  .copyWith(
                                                      color:
                                                          AppColors.secondColor,
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
                                    duration:
                                        const Duration(milliseconds: 2500),
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
                                                      color:
                                                          AppColors.textColor,
                                                    )),
                                            TextSpan(
                                              text: Constants.register,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall!
                                                  .copyWith(
                                                      color:
                                                          AppColors.secondColor,
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
                            SizedBox(
                                height: SizeConfig.screenHeight! *
                                    Constants.sizedBox),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(width: 20),
                                Text(
                                  'Sign in Google',
                                  style: AppTextStyles.kBodyText,
                                ),
                                flag
                                    ? FadeInLeft(
                                        duration:
                                            const Duration(milliseconds: 3000),
                                        child: SocailCArd(
                                          icon:
                                              'https://raw.githubusercontent.com/abuanwar072/E-commerce-Complete-Flutter-UI/0fa7a49a5168accec5b55f0e12a689715cdb2683/assets/icons/google-icon.svg',
                                          press: () =>
                                              appCubit.loginWithGoogle(),
                                        ),
                                      )
                                    : FadeOutLeft(
                                        duration:
                                            const Duration(milliseconds: 3000),
                                        child: SocailCArd(
                                          icon:
                                              'https://raw.githubusercontent.com/abuanwar072/E-commerce-Complete-Flutter-UI/0fa7a49a5168accec5b55f0e12a689715cdb2683/assets/icons/google-icon.svg',
                                          press: () =>
                                              appCubit.loginWithGoogle(),
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
