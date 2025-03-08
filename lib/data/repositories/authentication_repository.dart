import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:bodyandbeauty/features/authentication/screens/Onboarding/onboarding.dart';
import 'package:bodyandbeauty/features/authentication/screens/login/login.dart';
import 'package:bodyandbeauty/features/authentication/screens/signup/verify_emails.dart';
import 'package:bodyandbeauty/navigation_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  /// **Local Storage Instance**
  final deviceStorage = GetStorage();

  /// **Called on app launch (main.dart)**
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      screenRedirect();
    });
  }

  /// **Function to Show Relevant Screen on App Launch**
  void screenRedirect() async {
    final authSession = await Amplify.Auth.fetchAuthSession();
    bool isLoggedIn = authSession.isSignedIn;

    if (isLoggedIn) {
      final user = await Amplify.Auth.getCurrentUser();
      final attributes = await Amplify.Auth.fetchUserAttributes();
      bool isEmailVerified = attributes
          .firstWhere((attr) => attr.userAttributeKey == CognitoUserAttributeKey.emailVerified)
          .value
          .toLowerCase() == 'true';

      if (isEmailVerified) {
        Get.offAll(() => const NavigationMenu());
      } else {
        Get.offAll(() => VerifyEmailsScreen(userEmail: user.username));
      }
    } else {
      if (kDebugMode) {
        print('================== Get Storage Auth Repo ==================');
        print('First Time: ${deviceStorage.read('isFirstTime')}');
      }

      deviceStorage.writeIfNull('isFirstTime', true);
      final bool isFirstTime = deviceStorage.read('isFirstTime') ?? true;

      if (isFirstTime && Get.currentRoute != "/OnboardingScreen") {
        Get.offAll(() => const OnboardingScreen());
      } else if (!isFirstTime && Get.currentRoute != "/LoginScreen") {
        Get.offAll(() => const LoginScreen());
      }
    }
  }

  /// **Register New User (AWS Cognito)**
  Future<bool> registerWithEmailAndPassword(String email, String password) async {
    try {
      SignUpResult result = await Amplify.Auth.signUp(
        username: email,
        password: password,
        options: SignUpOptions(
          userAttributes: {
            CognitoUserAttributeKey.email: email,
          },
        ),
      );
      return result.isSignUpComplete;
    } on AuthException catch (e) {
      throw "Sign Up Failed: ${e.message}";
    }
  }

  /// **Send Email Verification**
  Future<void> sendEmailVerification(String email) async {
    try {
      await Amplify.Auth.resendSignUpCode(username: email);
    } on AuthException catch (e) {
      throw "Error sending verification email: ${e.message}";
    }
  }

  /// **Logout User**
  Future<void> logout() async {
    try {
      await Amplify.Auth.signOut();
      Get.offAll(() => const LoginScreen());
    } on AuthException catch (e) {
      throw "Logout Failed: ${e.message}";
    }
  }
}






































// import 'package:bodyandbeauty/features/authentication/screens/Onboarding/onboarding.dart';
// import 'package:bodyandbeauty/features/authentication/screens/login/login.dart';
// import 'package:bodyandbeauty/features/authentication/screens/signup/verify_emails.dart';
// import 'package:bodyandbeauty/navigation_menu.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter_native_splash/flutter_native_splash.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
//
// class AuthenticationRepository extends GetxController {
//   static AuthenticationRepository get instance => Get.find();
//
//   /// **Local Storage Instance**
//   final deviceStorage = GetStorage();
//   final _auth = FirebaseAuth.instance;
//
//   /// **Called on app launch (main.dart)**
//   @override
//   void onReady() {
//     FlutterNativeSplash.remove();
//     /// Ensure UI is fully built before navigation
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       screenRedirect();
//     });
//   }
//
//   /// **Function to Show Relevant Screen on App Launch**
//   void screenRedirect() async {
//     final user = _auth.currentUser;
//     if(user != null){
//       if(user.emailVerified){
//         Get.offAll(() => const NavigationMenu());
//       } else {
//         Get.offAll(() => VerifyEmailsScreen(userEmail: _auth.currentUser?.email));
//       }
//     } else {
//       if (kDebugMode) {
//         print('================== Get Storage Auth Repo ==================');
//         print('First Time: ${deviceStorage.read('isFirstTime')}');
//       }
//
//       // Ensure 'isFirstTime' is set only if it's null
//       deviceStorage.writeIfNull('isFirstTime', true);
//
//       // Get the current value
//       final bool isFirstTime = deviceStorage.read('isFirstTime') ?? true;
//
//       // Redirect to the correct screen only if needed
//       if (isFirstTime && Get.currentRoute != "/OnboardingScreen") {
//         Get.offAll(() => const OnboardingScreen());
//       } else if (!isFirstTime && Get.currentRoute != "/LoginScreen") {
//         Get.offAll(() => const LoginScreen());
//       }
//     }
//
//   }
// }
//
// /*--------------------Email & Password sign-in-----------------------*/
//
// /// [EmailAuthentication] - SignIn
//
// /// [EmailAuthentication] REGISTER
// Future<UserCredential> registerWithEmailAndPassword (String email, String password) async {
//   try {
//     return await _auth.createUserWithEmailAndPassword(email: email, password: password);
//   } on FirebaseAuthException catch (e) {
//     throw TFirebaseAuthException(e.code).message;
//   } on FirebaseException catch (e) {
//     throw TFirebaseException(e.code).message;
//   } on FormatException catch () {
//     throw const TFormatException();
//   } on PlatformException catch (e) {
//     throw TPlatformException(e.code).message;
//   } catch (e) {
//     throw 'Something went wrong. Please try again';
//   }
// }
//
// /// [EmailVerification] MAIL VERIFICATION
// Future<void> sendEmailVerification() async {
//   try {
//     await _auth.currentUser?.sendEmailVerification();
//   } on FirebaseAuthException catch (e) {
//     throw TFirebaseAuthException(e.code).message;
//   } on FirebaseException catch (e) {
//     throw TFirebaseException(e.code).message;
//   } on FormatException catch () {
//     throw const TFormatException();
//   } on PlatformException catch (e) {
//     throw TPlatformException(e.code).message;
//   } catch (e) {
//     throw 'Something went wrong. Please try again';
//   }
// }
//
// /// [ReAuthenticate] ReAuthenticate User
//
// /// [EmailAuthentication] FORGET PASSWORD
//
// //Federated identity & social sign-in
//
// /// [GoogleAuthentication] - GOOGLE
//
// /// [Facebook Authentication] FACEBOOK
//
// /* ./end Federated identity & social sign-in*/
//
// /// [LogoutUser] Valid for any authentication.
// Future<void> logout() async {
//   try{
//     await FirebaseAuth.instance.signOut();
//     Get.offAll(() => const LoginScreen());
//   } on FirebaseAuthException catch (e) {
//     throw TFirebaseAuthException(e.code).message;
//   } on FirebaseException catch (e) {
//     throw TFirebaseException(e.code).message;
//   } on FormatException catch (_) {
//     throw const TFormatException();
//   } on PlatformException catch (e) {
//     throw TPlatformException(e.code).message;
//   } catch (e) {
//     throw 'Something went wrong. Please try again';
//   }
// }
//
// /// [DeleteUser] Remove user Auth and amplify pull --appId d3vilsd81aqlny --envName stagingFirestore Account.