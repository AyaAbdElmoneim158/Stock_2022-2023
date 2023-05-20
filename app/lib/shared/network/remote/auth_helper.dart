import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

//ToDo: Class_AuthHelper........................................................
class AuthHelper {
  AuthHelper._();
  static final instance = AuthHelper._();
  final _firebaseAuth = FirebaseAuth.instance;

//!~> loginWithEmailAndPassword >==============================================<
  Future<User?> loginWithEmailAndPassword(String email, String password) async {
    final userAuth = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    return userAuth.user;
  }

//!~> signUpWithEmailAndPassword >=============================================<
  Future<User?> signUpWithEmailAndPassword(
      String email, String password) async {
    final userAuth = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    // userAuth.user.updateDisplayName()
    return userAuth.user;
  }

//!~> authStateChanes >========================================================<
  Stream authStateChanes() => _firebaseAuth.authStateChanges();

//!~> currentUser >============================================================<
  User? get currentUser => _firebaseAuth.currentUser;
  // User? get user => userAuth.user;

//!~> logout >=================================================================<
  Future<void> logout() async => await _firebaseAuth.signOut();

//!~> signInWithGoogle >=======================================================<
  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    return await _firebaseAuth.signInWithCredential(credential);
  }

//!~> AuthHelper_SignInWithFacebook.............................................
  Future<UserCredential> signInWithFacebook() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);
    return _firebaseAuth.signInWithCredential(facebookAuthCredential);
  }

//!~> passwordReset >==========================================================<
  Future<void> passwordReset(String email) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }

//!~> verifyPhoneNum >=========================================================<
  Future<void> verifyPhoneNum(String? phoneNumber, String? verify) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber, //'${countryCode.text+phone}',
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int? resendToken) {
        /*MyPhone.verify*/ verify = verificationId;
        // Navigator.of(context).pushNamed(AppRoutes.otpPageRoute);
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }
}
