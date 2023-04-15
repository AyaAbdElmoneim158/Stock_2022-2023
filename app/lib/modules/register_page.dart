import 'package:app/shared/components/components.dart';
import 'package:app/shared/components/constants.dart';
import 'package:app/shared/cubit/cubit.dart';
import 'package:app/shared/cubit/states.dart';
import 'package:app/shared/router/routes.dart';
import 'package:app/shared/styles/colors.dart';
import 'package:app/shared/styles/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:animate_do/animate_do.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        if (state is AuthRegisterApploadingState) {
          debugPrint("AuthRegisterApploadingState");
        }
        if (state is AuthRegisterAppErrorState) {
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
        if (state is AuthRegisterAppSuccessState) {
          debugPrint("AuthRegisterAppSuccessState");
          Navigator.popAndPushNamed(context, AppRoutes.loginRoute);
        }

        if (state is AuthNoPhoneErrorState) {
          debugPrint("AuthNoPhoneErrorState");
          final snackBar = SnackBar(
            elevation: 0,
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            content: AwesomeSnackbarContent(
              title: 'Error..!',
              message: "This is not a number, Must phone 11 numbers! ",
              contentType: ContentType.failure,
            ),
          );

          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(snackBar);
        }
        if (state is AuthcheckPasswordsErrorState) {
          debugPrint("AuthcheckPasswordsErrorState");
          final snackBar = SnackBar(
            elevation: 0,
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            content: AwesomeSnackbarContent(
              title: 'Error..!',
              message: "Password Not equal Confirm Password",
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
          body: /* ConditionalBuilder(
          condition: state is AuthRegisterApploadingState,
          fallback: (context) => CircularProgressIndicator(
            color: secondColor,
            backgroundColor: Colors.grey.shade200,
          ),
          builder: (context) => Center(
            child: SingleChildScrollView(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.network(
                    // "https://cdn.iconscout.com/icon/free/png-256/login-6823259-5582641.png",
                    "https://cdn.iconscout.com/icon/free/png-256/login-arrow-4604457-3854133.png",
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                  Text(Constants.register, style: titleStyle(context)),
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
                                hintText: Constants.nameFeild,
                                labelText: Constants.enterNameFeild,
                                controller: nameController,
                                validator: (val) => val!.isEmpty
                                    ? Constants.nameFeildAlert
                                    : null,
                                onChanged: (val) => appCubit.changeEmail(val)),
                          ),
                          SizedBox(height: size.height * 0.03),
                          ZoomIn(
                            duration: const Duration(milliseconds: 500),
                            child: defaultField(
                                hintText: Constants.emailFeild,
                                labelText: Constants.emailFeild,
                                controller: emailController,
                                validator: (val) => val!.isEmpty
                                    ? Constants.emailFeildAlert
                                    : null,
                                onChanged: (val) => appCubit.changeEmail(val)),
                          ),
                          SizedBox(height: size.height * 0.03),
                          ZoomIn(
                            duration: const Duration(milliseconds: 500),
                            child: defaultField(
                                hintText: Constants.phoneFeild,
                                labelText: Constants.phoneFeild,
                                controller: phoneController,
                                validator: (val) => val!.isEmpty
                                    ? Constants.phoneFeildAlert
                                    : null,
                                onChanged: (val) => appCubit.changePhone(val)),
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
                                onChanged: (val) =>
                                    appCubit.changePassword(val)),
                          ),
                          SizedBox(height: size.height * 0.03),
                          ZoomIn(
                            duration: const Duration(milliseconds: 700),
                            child: defaultField(
                                hintText: Constants.confirmPasswordFeild,
                                labelText: Constants.confirmPasswordFeild,
                                controller: confirmPasswordController,
                                validator: (val) => val!.isEmpty
                                    ? Constants.confirmPasswordFeildAlert
                                    : null,
                                onChanged: (val) =>
                                    appCubit.changePasswordC(val)),
                          ),
                          SizedBox(height: size.height * 0.02),
                          ZoomIn(
                            duration: const Duration(milliseconds: 1100),
                            child: defaultButton(
                              text: Constants.loginBtn,
                              color: secondColor,
                              context: context,
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  debugPrint("invaild");
                                  // debugPrint(
                                  //     "name*** ${nameController.text}....${appCubit.userName}");
                                  // debugPrint(
                                  //     "email*** ${emailController.text}....${appCubit.email}");
                                  // debugPrint(
                                  //     "phone*** ${phoneController.text}....${appCubit.phone}");
                                  // debugPrint(
                                  //     "password*** ${passwordController.text}....${appCubit.password}");
                                  // debugPrint(
                                  //     "password C*** ${confirmPasswordController.text}....${appCubit.confirmPassword}");
                                  //! 🙈 -------------------------------
                                  //❌ appCubit.loginWithEmail(email: emailController.text,password: passwordController.text);
                                  appCubit.registerWithEmail();
                                } else {
                                  debugPrint("invaild");
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
                                        text: Constants.toLogin,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(
                                              color: textColor,
                                            )),
                                    TextSpan(
                                      text: Constants.passedHere,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                              color: primaryColor,
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
        )*/
              Center(
            child: SingleChildScrollView(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Image.network(
                  //   // "https://cdn.iconscout.com/icon/free/png-256/login-6823259-5582641.png",
                  //   "https://cdn.iconscout.com/icon/free/png-256/login-arrow-4604457-3854133.png",
                  //   width: 100,
                  //   fit: BoxFit.cover,
                  // ),
                  Text(Constants.register, style: titleStyle(context)),
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
                                hintText: Constants.nameFeild,
                                labelText: Constants.enterNameFeild,
                                controller: nameController,
                                validator: (val) => val!.isEmpty
                                    ? Constants.nameFeildAlert
                                    : null,
                                onChanged: (val) =>
                                    appCubit.changeUserName(val)),
                          ),
                          SizedBox(height: size.height * 0.03),
                          ZoomIn(
                            duration: const Duration(milliseconds: 500),
                            child: defaultField(
                                hintText: Constants.emailFeild,
                                labelText: Constants.emailFeild,
                                controller: emailController,
                                validator: (val) => val!.isEmpty
                                    ? Constants.emailFeildAlert
                                    : null,
                                onChanged: (val) => appCubit.changeEmail(val)),
                          ),
                          SizedBox(height: size.height * 0.03),
                          ZoomIn(
                            duration: const Duration(milliseconds: 500),
                            child: defaultField(
                                hintText: Constants.phoneFeild,
                                labelText: Constants.phoneFeild,
                                controller: phoneController,
                                validator: (val) => val!.isEmpty
                                    ? Constants.phoneFeildAlert
                                    : null,
                                onChanged: (val) => appCubit.changePhone(val)),
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
                                onChanged: (val) =>
                                    appCubit.changePassword(val)),
                          ),
                          SizedBox(height: size.height * 0.03),
                          ZoomIn(
                            duration: const Duration(milliseconds: 700),
                            child: defaultField(
                                hintText: Constants.confirmPasswordFeild,
                                labelText: Constants.confirmPasswordFeild,
                                controller: confirmPasswordController,
                                validator: (val) => val!.isEmpty
                                    ? Constants.confirmPasswordFeildAlert
                                    : null,
                                onChanged: (val) =>
                                    appCubit.changePasswordC(val)),
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
                                  debugPrint("invaild");
                                  // debugPrint(
                                  //     "name*** ${nameController.text}....${appCubit.userName}");
                                  // debugPrint(
                                  //     "email*** ${emailController.text}....${appCubit.email}");
                                  // debugPrint(
                                  //     "phone*** ${phoneController.text}....${appCubit.phone}");
                                  // debugPrint(
                                  //     "password*** ${passwordController.text}....${appCubit.password}");
                                  // debugPrint(
                                  //     "password C*** ${confirmPasswordController.text}....${appCubit.confirmPassword}");
                                  //! 🙈 -------------------------------
                                  //❌ appCubit.loginWithEmail(email: emailController.text,password: passwordController.text);
                                  appCubit.registerWithEmail();
                                } else {
                                  debugPrint("invaild");
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
                                        text: Constants.toLogin,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                              color: textColor,
                                            )),
                                    TextSpan(
                                      text: Constants.loginBtn,
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
