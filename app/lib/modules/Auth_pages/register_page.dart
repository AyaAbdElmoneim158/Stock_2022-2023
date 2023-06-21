import 'dart:async';

import 'package:app/shared/components/components.dart';
import 'package:app/shared/components/constants.dart';
import 'package:app/shared/cubit/cubit.dart';
import 'package:app/shared/cubit/states.dart';
import 'package:app/shared/router/routes.dart';
import 'package:app/shared/styles/colors.dart';
import 'package:app/shared/styles/size_config.dart';
import 'package:app/shared/styles/style.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:animate_do/animate_do.dart';

// ignore: must_be_immutable
class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var nameController = TextEditingController();
  var passwordController = TextEditingController();
  bool flag = true;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        if (state is AuthRegisterApploadingState) {
          debugPrint("AuthRegisterApploadingState");
        }
        if (state is AuthRegisterAppErrorState) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(snackbarErr(state,
                // message: state.err,
                title: Constants.err,
                message: getMessageFromErrorCode(errorCode: state.err),
                contentType: ContentType.failure));
        }
        if (state is AuthRegisterAppSuccessState) {
          debugPrint("AuthRegisterAppSuccessState");
          flag = false;
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(snackbarErr(state,
                message: Constants.successSign,
                contentType: ContentType.success));
          Timer(const Duration(seconds: 3), () {
            Navigator.popAndPushNamed(context, AppRoutes.loginRoute);
          });
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
                      ? FadeInUp(
                          duration: const Duration(milliseconds: 500),
                          child: FadeInImage.assetNetwork(
                            height: SizeConfig.screenHeight! * 0.3,
                            width: double.infinity,
                            placeholder: 'assets/spinner.gif',
                            image:
                                'https://img.freepik.com/free-vector/sign-up-concept-illustration_114360-7965.jpg?size=626&ext=jpg',
                          ),
                        )
                      : FadeInDown(
                          duration: const Duration(milliseconds: 500),
                          child: FadeInImage.assetNetwork(
                            height: SizeConfig.screenHeight! * 0.3,
                            width: double.infinity,
                            placeholder: 'assets/spinner.gif',
                            image:
                                'https://img.freepik.com/free-vector/sign-up-concept-illustration_114360-7965.jpg?size=626&ext=jpg',
                          ),
                        ),

                  //! text.....................................................
                  flag
                      ? FadeInUp(
                          duration: const Duration(milliseconds: 500),
                          child: Text(Constants.register,
                              style: AppTextStyles.titleStyle(context)
                                  .copyWith(color: AppColors.kTextColor)),
                        )
                      : FadeInDown(
                          duration: const Duration(milliseconds: 500),
                          child: Text(Constants.register,
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
                              height:
                                  SizeConfig.screenWidth! * Constants.sizedBox),
                          flag
                              ? FadeInRight(
                                  duration: const Duration(milliseconds: 500),
                                  child: defaultField(
                                      hintText: Constants.nameFeild,
                                      labelText: Constants.nameFeild,
                                      controller: nameController,
                                      validator: (val) => val!.isEmpty
                                          ? Constants.nameFeildAlert
                                          : null,
                                      onChanged: (val) =>
                                          appCubit.changeUserName(val)),
                                )
                              : FadeOutRight(
                                  duration: const Duration(milliseconds: 500),
                                  child: defaultField(
                                      hintText: Constants.nameFeild,
                                      labelText: Constants.nameFeild,
                                      controller: nameController,
                                      validator: (val) => val!.isEmpty
                                          ? Constants.nameFeildAlert
                                          : null,
                                      onChanged: (val) =>
                                          appCubit.changeUserName(val)),
                                ),
                          SizedBox(
                              height:
                                  SizeConfig.screenWidth! * Constants.sizedBox),
                          flag
                              ? FadeInLeft(
                                  duration: const Duration(milliseconds: 1000),
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
                              : FadeOutLeft(
                                  duration: const Duration(milliseconds: 1000),
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
                              height:
                                  SizeConfig.screenWidth! * Constants.sizedBox),
                          flag
                              ? FadeInRight(
                                  duration: const Duration(milliseconds: 1500),
                                  child: PasswordFeild(
                                      controller: passwordController,
                                      onChanged: (val) =>
                                          appCubit.changePassword(val)),
                                )
                              : FadeOutRight(
                                  duration: const Duration(milliseconds: 1500),
                                  child: PasswordFeild(
                                      controller: passwordController,
                                      onChanged: (val) =>
                                          appCubit.changePassword(val)),
                                ),
                          SizedBox(
                              height: SizeConfig.screenWidth! *
                                  Constants.sizedBox *
                                  2),
                          flag
                              ? ZoomIn(
                                  duration: const Duration(milliseconds: 2000),
                                  child: (state is AuthRegisterApploadingState)
                                      ? CircularProgressIndicator(
                                          color: AppColors.kPrimaryColor)
                                      : (state is AuthRegisterAppSuccessState)
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
                                                  appCubit.registerWithEmail();
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
                                                  appCubit.registerWithEmail();
                                                }
                                              },
                                            ),
                                  /*ConditionalBuilder(
                                    condition:
                                        true, //( state is! AuthLoginWithEmailApploadingState),
                                    builder: (context) => defaultButton(
                                      text: Constants.loginBtn,
                                      color: firstColor,
                                      context: context,
                                      onPressed: () {
                                        if (formKey.currentState!.validate()) {
                                          debugPrint("vaild");
                                          debugPrint(
                                              "name*** ${nameController.text}....${appCubit.userName}");
                                          debugPrint(
                                              "email*** ${emailController.text}....${appCubit.email}");

                                          debugPrint(
                                              "password*** ${passwordController.text}....${appCubit.password}");

                                          //! 🙈 -------------------------------
                                          //❌ appCubit.loginWithEmail(email: emailController.text,password: passwordController.text);
                                          appCubit.registerWithEmail();
                                        } else {
                                          debugPrint("invaild");
                                        }
                                      },
                                    ),
                                    fallback: (context) =>
                                        const CircularProgressIndicator(
                                            color: kPrimaryColor),
                                  ),*/
                                )
                              : ZoomOut(
                                  duration: const Duration(milliseconds: 2000),
                                  child: defaultButton(
                                    text: Constants.loginBtn,
                                    color: AppColors.firstColor,
                                    context: context,
                                    onPressed: () {
                                      if (formKey.currentState!.validate()) {
                                        debugPrint("vaild");
                                        debugPrint(
                                            "name*** ${nameController.text}....${appCubit.userName}");
                                        debugPrint(
                                            "email*** ${emailController.text}....${appCubit.email}");

                                        debugPrint(
                                            "password*** ${passwordController.text}....${appCubit.password}");

                                        //! 🙈 -------------------------------
                                        //❌ appCubit.loginWithEmail(email: emailController.text,password: passwordController.text);
                                        appCubit.registerWithEmail();
                                      } else {
                                        debugPrint("invaild");
                                      }
                                    },
                                  ),
                                ),
                          SizedBox(
                              height: SizeConfig.screenWidth! *
                                  Constants.sizedBox /
                                  3),
                          flag
                              ? ZoomIn(
                                  duration: const Duration(milliseconds: 2500),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: InkWell(
                                      child: Text.rich(
                                        TextSpan(children: [
                                          TextSpan(
                                              text: Constants.toLogin,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium!
                                                  .copyWith(
                                                    color: AppColors.textColor,
                                                  )),
                                          TextSpan(
                                            text: Constants.loginBtn,
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
                                        Navigator.pop(context);
                                        // Navigator.of(context).pushNamed(AppRoutes.registerPageRoute);
                                      },
                                    ),
                                  ),
                                )
                              : ZoomOut(
                                  duration: const Duration(milliseconds: 2700),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: InkWell(
                                      child: Text.rich(
                                        TextSpan(children: [
                                          TextSpan(
                                              text: Constants.toLogin,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium!
                                                  .copyWith(
                                                    color: AppColors.textColor,
                                                  )),
                                          TextSpan(
                                            text: Constants.loginBtn,
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
                                        Navigator.pop(context);
                                        // Navigator.of(context).pushNamed(AppRoutes.registerPageRoute);
                                      },
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
          ),
        );
      },
    );
  }
}
