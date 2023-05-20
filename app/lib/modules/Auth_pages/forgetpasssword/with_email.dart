import 'package:app/shared/components/components.dart';
import 'package:app/shared/cubit/cubit.dart';
import 'package:app/shared/cubit/states.dart';
import 'package:app/shared/router/routes.dart';
import 'package:app/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app/shared/components/constants.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

class ForgetPasswordWithEmail extends StatelessWidget {
  const ForgetPasswordWithEmail({super.key});

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
            title: 'ESuccess..!',
            message: "Check your Email ",
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
            title: 'Error..!',
            message: state.err,
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
      var emailController = TextEditingController();

      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: firstColor,
              ),
              onPressed: () => Navigator.pop(context)),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.network(
                    // 'https://cdn-icons-png.flaticon.com/128/3826/3826483.png',
                    'https://cdn-icons-png.flaticon.com/128/3826/3826570.png',
                    // 'https://cdn-icons-png.flaticon.com/128/6159/6159382.png',
                    // 'https://cdn-icons-png.flaticon.com/128/3064/3064478.png',
                    // 'https://cdn-icons-png.flaticon.com/128/6357/6357048.png',
                    width: 200,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 30),
                  Align(
                    child: Text(
                      "reset your password".toUpperCase(),
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(
                              color: secondColor, fontWeight: FontWeight.w700),
                    ),
                  ),
                  const SizedBox(height: 30),
                  defaultField(
                      hintText: Constants.emailFeild,
                      labelText: Constants.emailFeild,
                      controller: emailController,
                      validator: (val) =>
                          val!.isEmpty ? Constants.emailFeildAlert : null,
                      onChanged: (val) => appCubit.changeEmailForget(val)),
                  const SizedBox(height: 15),
                  defaultButton(
                      text: "Reset".toUpperCase(),
                      color: firstColor,
                      onPressed: () {
                        appCubit.forgetPassword();
                      },
                      context: context),
                ]),
          ),
        ),
      );
    });
  }
}
