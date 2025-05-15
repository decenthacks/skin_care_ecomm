
import 'package:bodyandbeauty/data/repositories/user/user_repository.dart';
import 'package:bodyandbeauty/features/authentication/screens/signup/verify_emails.dart';
import 'package:bodyandbeauty/navigation_menu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart' show PlatformException;
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../exceptions/firebase_exceptions.dart';
import '../../features/authentication/screens/Onboarding/onboarding.dart';
import '../../features/authentication/screens/login/login.dart';


class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  /// **Local Storage Instance**
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  /// Get Authenticated User Data
   User? get authUser => _auth.currentUser;

  /// **Called on app launch (main.dart)**
  @override
  void onReady() {
    FlutterNativeSplash.remove();
   screenRedirect();
  }
/// function to show relevant screen
  screenRedirect() async {
    final user = _auth.currentUser;
    if(user != null){
      if(user.emailVerified){
        Get.offAll(() => NavigationMenu());
      } else {
        Get.offAll(() => VerifyEmailScreen(email: _auth.currentUser?.email,));
      }
      } else{
      // local Storage
      deviceStorage.writeIfNull('IsFirstTime', true);
      deviceStorage.read('IsFirstTime') != true
          ? Get.offAll(() => const LoginScreen())
          : Get.offAll(() => const OnboardingScreen());
    }
  }




  ///////////-----------------------------------------------------------------------------------------------------///////




  /// [EmailAuthentication] LOGIN
  Future<UserCredential> loginWithEmailAndPassword(String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword (email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }


  /// [EmailAuthentication] REGISTER
  Future<UserCredential> registerWithEmailAndPassword(String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }


  /// [ReAuthentication]
  Future<void> reAuthenticateWithEmailAndPassword(String email, String password) async {
    try {
      // create a credentials
      AuthCredential credential = EmailAuthProvider.credential(email: email, password: password);
     //ReAuthenticate
      await _auth.currentUser!.reauthenticateWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }


  /// [EmailVerification] -MAIL VERIFICATION
  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }


  /// [ Google Verification] -Google VERIFICATION
  Future<UserCredential?> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();
// Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await userAccount?.authentication;
// Create a new credential
    final credentials = GoogleAuthProvider.credential (accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
// Once signed in, return the UserCredential
    return await _auth.signInWithCredential(credentials);

    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }


  /// [EmailVerification] -Forget Password
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }


  /// [LogoutUser] -Valid for any authentication.
  Future<void> logout() async {
    try{
      await GoogleSignIn().signOut();
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => const LoginScreen());
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
    throw TPlatformException(e.code).message;
    } catch (e) {
    throw 'Something went wrong. Please try again';
    }
  }

  /// [DeleteAccount ]
  Future<void> deleteAccount() async {
    try{
      await UserRepository.instance.removeUserRecord(_auth.currentUser!.uid);
      await _auth.currentUser?.delete();
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
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
// /// [DeleteUser] Remove user Auth and amplify pull --appId d3vilsd81aqlny --envName stagingFirestore Account