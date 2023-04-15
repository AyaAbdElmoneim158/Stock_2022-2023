/*import 'package:app/shared/styles/style.dart';
import 'package:flutter/material.dart';

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        children: [
          Text(
            "تفويض🙈",
            style: titleStyle(context),
          ),
          Text(
            "TestPage+ 🙈...",
            style: bodyStyle(context),
          ),
        ],
      ),
    ));
  }
}*/

//  Center(child: Text("TestPage", style: Theme.of(context).textTheme.headline4, )),

import 'package:app/shared/components/components.dart';
import 'package:app/shared/components/constants.dart';
import 'package:app/shared/cubit/cubit.dart';
import 'package:app/shared/cubit/states.dart';
import 'package:app/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var formKey = GlobalKey<FormState>();
    var emailController = TextEditingController();

    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        //!X~> 😳 😳
        //! 🙈 -------------------------------
        /*if (state is AuthforgetPasswordApploadingState) {
          Navigator.of(context).pushReplacementNamed(AppRoutes.loadingPageRoute);
        }
        if (state is AuthforgetPasswordAppErrorState  ) {
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
        if (state is AuthforgetPasswordAppSuccessState) {
           final snackBar = SnackBar(
            elevation: 0,
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            content: AwesomeSnackbarContent(
              title: 'Success..!',
              message:"check your email",
              contentType: ContentType.failure,
            ),
          );

          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(snackBar);

          Navigator.of(context).pushReplacementNamed(AppRoutes.bottomNavBarRoute);
        }*/
        //!X~> 😳 😳
      },
      builder: (context, state) {
        final appCubit = AppCubit.get(context);
        return Scaffold(
            body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: size.height * 0.1),
              Image.network(
                // 'https://cdn.iconscout.com/icon/free/png-256/login-1699959-1444434.png',
                // "https://cdn.iconscout.com/icon/free/png-256/password-1870924-1584957.png",
                // "https://cdnl.iconscout.com/lottie/premium/thumb/password-6232070-5116076.mp4",
                // "https://cdn.iconscout.com/icon/premium/png-256-thumb/password-8-72964.png",
                "https://cdn.iconscout.com/icon/premium/png-256-thumb/password-10-72978.png",
                width: 250,
                fit: BoxFit.cover,
              ),
              Form(
                key: formKey,
                child: Padding(
                  padding: EdgeInsets.all(size.height * 0.02),
                  child: Column(
                    children: [
                      SizedBox(height: size.height * 0.03),
                      defaultField(
                          hintText: Constants.emailFeild,
                          labelText: Constants.emailFeild,
                          controller: emailController,
                          validator: (val) =>
                              val!.isEmpty ? Constants.emailFeildAlert : null,
                          onChanged: (val) {}),
                      SizedBox(height: size.height * 0.03),
                      defaultButton(
                        context: context,
                        text: Constants.forgetPasswordBtnNext,
                        color: secondColor,
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            debugPrint(
                                "_emailController.text ${emailController.text}");
                            //! 🙈 -------------------------------

                            // appCubit.forgetPassword(emailController.text);
                          }
                        },
                      ),
                      const Text("..."),
                      SizedBox(height: size.height * 0.4),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
      },
    );
  }
}
