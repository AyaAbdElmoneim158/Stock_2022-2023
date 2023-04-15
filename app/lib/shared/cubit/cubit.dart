import 'package:app/models/user_model.dart';
import 'package:app/shared/cubit/states.dart';
import 'package:app/shared/network/remote/auth_helper.dart';
import 'package:app/shared/network/remote/firestore_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitState());
  static AppCubit get(context) => BlocProvider.of(context);
  final _service = FirestoreHelper.instance;
  String userName = "";
  String email = "";
  String emailForget = "";

  String phone = "";
  String password = "";
  String confirmPassword = "";
  String uid_ = "";
  bool saving = false;

//!~> changeEmail ===========================================<
  void changeEmail(String emailValue) {
    email = emailValue;
    emit(AuthAppChangeEmailState());
  }

  void changeEmailForget(String emailValue) {
    emailForget = emailValue;
    emit(AuthAppChangeEmailForgetState());
  }

//!~> changeUserName ===========================================<
  void changeUserName(String userNameValue) {
    userName = userNameValue;
    emit(AuthAppChangeUserNameState());
  }

//!~> changePhone ===========================================<
  void changePhone(String phoneValue) {
    phone = phoneValue;
    emit(AuthAppChangePhoneState());
  }

//!~> changePassword ===========================================<
  void changePassword(String passwordValue) {
    password = passwordValue;
    emit(AuthAppChangePasswordState());
  }

//!~> changePasswordC ===========================================<
  void changePasswordC(String passwordCValue) {
    confirmPassword = passwordCValue;
    emit(AuthAppChangePasswordCState());
  }

//!~> forgetPassword ===========================================<
  void forgetPassword() {
    //! ToDo:: no for get check email-feild is exist
    emit(AuthforgetPasswordApploadingState());

    AuthHelper.instance.passwordReset(emailForget).then((value) {
      debugPrint("forgetPassword Success ....!");
      emit(AuthforgetPasswordAppSuccessState());
    }).catchError((err) {
      debugPrint("forgetPassword Error ....!");
      emit(AuthforgetPasswordAppErrorState(err));
    });
  }

//? !~> loginWithEmail ===========================================<
  void loginWithEmail() {
    emit(AuthLoginWithEmailApploadingState());
    AuthHelper.instance
        .loginWithEmailAndPassword(email, password)
        .then((value) {
      debugPrint(
          "login Success ....! :: $value"); // dfviIWpMuJPgz4eDoFmgFxTFnnP2
      emit(AuthLoginWithEmailAppSuccessState()); //value.uid)
    }).catchError((err) {
      debugPrint("login Error ....!");
      emit(AuthLoginWithEmailAppErrorState(err));
    });
  }

//? !~> loginWithGoogle ===========================================<
  void loginWithGoogle() {
    emit(AuthWithGoogleApploadingState());
    AuthHelper.instance.signInWithGoogle().then((value) {
      debugPrint("signInWithGoogle Success ....!");
      emit(AuthWithGoogleAppSuccessState());
    }).catchError((err) {
      debugPrint("signInWithGoogle Error ....!");
      emit(AuthWithGoogleAppErrorState(err));
    });
  }

//!X~> registerWithEmail ===========================================<
  void registerWithEmail() {
    //! ToDo:: auth + firebase ...
    emit(AuthRegisterApploadingState());
    if (phone.length != 11) {
      emit(AuthNoPhoneErrorState());
    } else {
      password == confirmPassword
          ? AuthHelper.instance
              .signUpWithEmailAndPassword(email, password)
              .then((value) async {
              uid_ = value!.uid;
              UserModle userData = UserModle(
                email: email,
                name: userName,
                phone: phone,
                uId: value
                    .uid, //?? docmentIdFormLocationData(),// password: password
              );

              await _service.setData(
                path: 'users/$uid_',
                data: userData.toMap(),
              );
              //  final user =
              await FirebaseAuth.instance.currentUser
                  ?.updateDisplayName(userName);
              debugPrint(
                  "Register Email Success ....! ${value.email} :: ${value.uid} :: ${value.displayName}");
              emit(AuthRegisterAppSuccessState());
            }).catchError((err) {
              debugPrint("Register Email Error ....! $err");
              emit(AuthRegisterAppErrorState(err.toString()));
            })
          : emit(AuthcheckPasswordsErrorState());
    }
  }
}
