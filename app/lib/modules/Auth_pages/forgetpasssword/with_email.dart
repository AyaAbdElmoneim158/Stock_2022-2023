import 'package:app/shared/components/components.dart';
import 'package:app/shared/cubit/cubit.dart';
import 'package:app/shared/cubit/states.dart';
import 'package:app/shared/router/routes.dart';
import 'package:app/shared/styles/colors.dart';
import 'package:app/shared/styles/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app/shared/components/constants.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

class ForgetPasswordWithEmail extends StatelessWidget {
  ForgetPasswordWithEmail({super.key});
  var emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(listener: (context, state) {
      if (state is AuthforgetPasswordAppSuccessState) {
        debugPrint("AuthforgetPasswordAppSuccessState");
        final snackBar = SnackBar(
          elevation: 0,
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          content: AwesomeSnackbarContent(
            title: Constants.success,
            message: Constants.checkEmail,
            // title: 'ESuccess..!',
            // message: "Check your Email ",
            contentType: ContentType.success,
          ),
        );

        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(snackBar);
        //Nav
        // Navigator.pushNamed(context, AppRoutes.loginRoute);
        Future.delayed(const Duration(seconds: 5), () {
          navigatorRep(context: context, routeName: AppRoutes.loginRoute);
        });
      }

      if (state is AuthforgetPasswordAppErrorState) {
        debugPrint("AuthforgetPasswordAppErrorState");
        final snackBar = SnackBar(
          elevation: 0,
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          content: AwesomeSnackbarContent(
            title: Constants.err,
            message: getMessageFromErrorCode(errorCode: state.err),
            // message: state.err,
            contentType: ContentType.failure,
          ),
        );

        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(snackBar);
      }

      if (state is AuthforgetPasswordApploadingState) {
        debugPrint("AuthforgetPasswordApploadingState");
      }
    }, builder: (context, state) {
      final appCubit = AppCubit.get(context);

      SizeConfig().init(context);

      return Scaffold(
        backgroundColor: AppColors.kBackgroundColor,
        appBar: generalAppbar(context),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.network(
                      'https://img.freepik.com/free-vector/forgot-password-concept-illustration_114360-1123.jpg',
                      height: SizeConfig.screenHeight! * 0.3, //40%
                      width: double.infinity,
                    ),
                    SizedBox(height: SizeConfig.screenHeight! * 0.1),
                    Align(
                      child: Text(
                        Constants.resetPassword,
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(
                                color: AppColors.kTextColor,
                                fontWeight: FontWeight.w700),
                      ),
                    ),
                    const SizedBox(height: 30),
                    // PasswordFeild(
                    //     controller: passwordController,
                    //     onChanged: (val) => appCubit.changePassword(val)),
                    defaultField(
                        hintText: Constants.emailFeild,
                        labelText: Constants.emailFeild,
                        controller: emailController,
                        validator: (val) =>
                            val!.isEmpty ? Constants.emailFeildAlert : null,
                        onChanged: (val) => appCubit.changeEmailForget(val)),
                    const SizedBox(height: 32),
                    defaultButton(
                        text: Constants.reset,
                        color: AppColors.firstColor,
                        onPressed: () {
                          appCubit.forgetPassword();
                        },
                        context: context),
                  ]),
            ),
          ),
        ),
      );
    });
  }
}
