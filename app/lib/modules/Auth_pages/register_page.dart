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

// ignore: must_be_immutable
class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var nameController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        if (state is AuthRegisterApploadingState) {
          debugPrint("AuthRegisterApploadingState");
        }
        if (state is AuthRegisterAppErrorState) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(snackbarErr(state, message: state.err));
        }
        if (state is AuthRegisterAppSuccessState) {
          debugPrint("AuthRegisterAppSuccessState");
          Navigator.popAndPushNamed(context, AppRoutes.loginRoute);
        }
      },
      builder: (context, state) {
        final appCubit = AppCubit.get(context);
        return Scaffold(
          body: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
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
                                labelText: Constants.nameFeild,
                                controller: nameController,
                                validator: (val) => val!.isEmpty
                                    ? Constants.nameFeildAlert
                                    : null,
                                onChanged: (val) =>
                                    appCubit.changeUserName(val)),
                          ),
                          SizedBox(height: size.height * 0.03),
                          ZoomIn(
                            duration: const Duration(milliseconds: 1000),
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
                            duration: const Duration(milliseconds: 1500),
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
                            duration: const Duration(milliseconds: 2000),
                            child: defaultButton(
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
                          ),
                          SizedBox(height: size.height * 0.01),
                          ZoomIn(
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
