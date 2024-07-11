import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:football_app/data/repos/user.dart';
import 'package:football_app/features/authentication/views/login/login.dart';
import 'package:football_app/features/authentication/views/onBoarding/onBoarding.dart';
import 'package:football_app/features/authentication/views/signup/verfiy_Email.dart';
import 'package:football_app/nav.dart';
import 'package:football_app/utils/local_storage/localStorage.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationRepo extends GetxController {
  static AuthenticationRepo get instance => Get.find();

//variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;
  User? get authUser => _auth.currentUser;

  @override
  void onReady() {
    //Remove Splash
    FlutterNativeSplash.remove();
    //Redirect to the appropriate Screen
    screenRedirect();
    super.onReady();
  }

  void screenRedirect() async {
    final user = _auth.currentUser;
    if (user != null) {
      if (user.emailVerified) {
        await TLocalStorage.init(user.uid);
        Get.offAll(() => const NavigationMenu());
      } else {
        Get.offAll(() => VerfiyEmail(
              email: _auth.currentUser?.email,
            ));
      }
    } else {
      //local storage
      deviceStorage.writeIfNull("IsFirstTime", true);
      //check if it is the first time launching in
      deviceStorage.read("IsFirstTime") != true
          ? Get.offAll(() => const LoginScreen())
          : Get.offAll(() => const OnBoarding());
    }
  }

/* ------------------Email Password sign in -----------------------------*/
  // [EmailAuthentication] - signIn
  Future<UserCredential> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  // [EmailAuthentication] - Register
  Future<UserCredential> registerUserWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      throw 'Something Went Wrong, Please Try again';
    }
  }

  // [EmailVerfication] - Email Verfication
  Future<void> sendEmailVerfication() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } catch (e) {
      throw 'Something Went Wrong, Please Try again';
    }
  }

  // [EmailAuthentication] - Forget Password
  Future<void> forgotPasswrod(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      throw e.toString();
    }
  }

  // [ReAuthenticate] - ReAuthenticate User

  Future<void> reAuthenticateEmailAndPassword(
      String email, String password) async {
    try {
      AuthCredential credential =
          EmailAuthProvider.credential(email: email, password: password);
      await _auth.currentUser!.reauthenticateWithCredential(credential);
    } catch (e) {
      throw 'Something went wrong';
    }
  }

/* ------------------Federated identity & social sign-in -----------------------------*/
  // [GoogleAuthentication] - Google
  Future<UserCredential?> signInWithGoolge() async {
    try {
      //triggier authentication flow
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();

      //obtain auth details
      final GoogleSignInAuthentication? googleAuth =
          await userAccount?.authentication;
      //create a new credintials
      final credintials = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);

      //Once Signed in, Return Credintials
      return await _auth.signInWithCredential(credintials);
    } catch (e) {
      throw 'Something Went Wrong, Please Try again';
    }
  }
  // [FacebookAuthentication] - Facebook

/* ------------------Account -----------------------------*/
  // [LogoutUser] - logout
  Future<void> logout() async {
    try {
      await GoogleSignIn().signOut();
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      throw 'Something went wrong';
    }
  }
  // [DeleteUser] - Delete

  Future<void> deleteAccount() async {
    try {
      await UserRepo.instance.removeUserRecord(_auth.currentUser!.uid);
      await _auth.currentUser?.delete();
    } catch (e) {
      throw 'Something went Wrong';
    }
  }
}
