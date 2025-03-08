import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:bodyandbeauty/features/authentication/screens/signup/verify_emails.dart';
import 'package:bodyandbeauty/utils/Loader/loader.dart';
import 'package:bodyandbeauty/utils/Popup/full_screen_loader.dart';
import 'package:bodyandbeauty/utils/constants/image_strings.dart';
import 'package:bodyandbeauty/utils/network_conectivity/network_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../../data/repositories/authentication_repository.dart';
import '../../../../data/repositories/user/user_model.dart';
import '../../../../data/repositories/user/user_repository.dart';
import '../../../../utils/constants/colors.dart';
import '../../screens/login/login.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  /// **Form Variables**
  final privacyPolicy = true.obs;
  final hidePassword = true.obs;
  final email = TextEditingController();
  final lastName = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final phoneNumber = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  /// **SIGNUP Method (AWS Cognito)**
  Future<void> signup() async {
    try {
      MyFullScreenLoader.openLoadingDialog(
        'We are processing your information...',
        MyImages.decerAnimation,
      );

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        MyLoader.errorSnackBar(title: 'No Internet', message: 'Check your connection.');
        return;
      }

      if (!signupFormKey.currentState!.validate()) {
        MyLoader.warningSnackBar(title: 'Invalid Input', message: 'Please fill all required fields.');
        return;
      }

      if (!privacyPolicy.value) {
        MyLoader.warningSnackBar(title: 'Accept Privacy Policy', message: 'You must accept the Terms.');
        return;
      }

      // **Register User**
      final isRegistered = await AuthenticationRepository.instance.registerWithEmailAndPassword(
        email.text.trim(),
        password.text.trim(),
      );

      if (isRegistered) {
        final newUser = UserModel(
          id: email.text.trim(),
          firstName: firstName.text.trim(),
          lastName: lastName.text.trim(),
          username: username.text.trim(),
          email: email.text.trim(),
          phoneNumber: phoneNumber.text.trim(),
          profilePicture: '',
        );

        final userRepository = Get.put(UserRepository());
        await userRepository.saveUserRecord(newUser);

        MyLoader.successSnackBar(title: 'Congratulations', message: 'Account created! Verify your email.');

        Get.to(() => VerifyEmailsScreen(userEmail: email.text.trim()));
      }
    } catch (e) {
      MyLoader.errorSnackBar(title: 'Sign-up Error', message: e.toString());
    } finally {
      MyFullScreenLoader.stopLoading();
    }
  }

  /// **Confirm Sign-Up (Verification)**
  Future<void> verifyEmail(String email, String confirmationCode) async {
    try {
      SignUpResult result = await Amplify.Auth.confirmSignUp(
        username: email,
        confirmationCode: confirmationCode,
      );

      if (result.isSignUpComplete) {
        Get.snackbar("Success", "Email verified! You can now log in.",
            backgroundColor: MyColors.success, colorText: MyColors.white);
        Get.offAll(() => const LoginScreen());
      } else {
        Get.snackbar("Verification Required", "Please try again or request a new code.",
            backgroundColor: MyColors.warning, colorText: MyColors.white);
      }
    } catch (e) {
      MyLoader.errorSnackBar(title: 'Verification Failed', message: e.toString());
    }
  }
}





























// import 'package:amplify_flutter/amplify_flutter.dart';
// import 'package:bodyandbeauty/features/authentication/screens/signup/verify_emails.dart';
// import 'package:bodyandbeauty/utils/Loader/loader.dart';
// import 'package:bodyandbeauty/utils/Popup/full_screen_loader.dart';
// import 'package:bodyandbeauty/utils/constants/image_strings.dart';
// import 'package:bodyandbeauty/utils/network_conectivity/network_manager.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
// import 'package:get/get.dart';
//
// import '../../../../data/repositories/authentication_repository.dart';
// import '../../../../data/repositories/user/user_model.dart';
// import '../../../../data/repositories/user/user_repository.dart';
// import '../../../../utils/constants/colors.dart';
// import '../../screens/login/login.dart';
//
// class SignupController extends GetxController {
//   static SignupController get instance => Get.find();
//
//   /// **Form Variables**
//   final privacyPolicy = true.obs;
//   final hidePassword = true.obs;
//   final email = TextEditingController();
//   final lastName = TextEditingController();
//   final username = TextEditingController();
//   final password = TextEditingController();
//   final firstName = TextEditingController();
//   final phoneNumber = TextEditingController();
//   GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();
//
//   /// **SIGNUP Method (AWS Cognito)**
//   Future<void> signup() async {
//     try {
//       // **Show Full-Screen Loader**
//       MyFullScreenLoader.openLoadingDialog(
//         'We are processing your information...',
//         MyImages.decerAnimation,
//       );
//
//       // **Check Internet Connectivity**
//       final isConnected = await NetworkManager.instance.isConnected();
//       if (!isConnected) {
//         MyLoader.errorSnackBar(
//           title: 'No Internet',
//           message: 'Please check your internet connection.',
//         );
//         return;
//       }
//
//       // **Form Validation**
//       if (!signupFormKey.currentState!.validate()) {
//         MyLoader.warningSnackBar(
//           title: 'Invalid Input',
//           message: 'Please fill in all required fields correctly.',
//         );
//         return;
//       }
//
//       // **Privacy Policy Check**
//       if (!privacyPolicy.value) {
//         MyLoader.warningSnackBar(
//           title: 'Accept Privacy Policy',
//           message: 'You must accept the Privacy Policy & Terms of Use.',
//         );
//         return;
//       }
//
//       // Register user in the Firebase Authentication & Save user data in the Firebase
//       final userCredential = await AuthenticationRepository.instance.registerWithEmailAndPassword(email.text.trim(), password.text.trim());
// // Save Authenticated user data in the Firebase Firestore
//       if(!userCredential)   { final newUser = UserModel(
//           id: userCredential.user!.uid,
//           firstName: firstName.text.trim(),
//           lastName: lastName.text.trim(),
//           username: username.text.trim(),
//           email: email.text.trim(),
//           phoneNumber: phoneNumber.text.trim(),
//           profilePicture:'',
//       );
//     final userRepository = Get.put(UserRepository());
//     await userRepository.saveUserRecord(newUser);
//
//     //Show Success message
//         MyLoader.successSnackBar(title: 'Congratulations',message: 'Your account has been created! Verify email to continue.');
//         //Move to Verify Email
//         Get.to(() => VerifyEmailsScreen(userEmail: 'm'));
//
//     }
//     } catch (e) {
//       MyLoader.errorSnackBar(
//         title: 'Sign-up Error',
//         message: e.toString(),
//       );
//     } finally {
//       MyFullScreenLoader.stopLoading();
//     }
//   }
//
//       /// **Confirm Sign-Up (Verification)**
//       Future<void> verifyEmail(String email, String confirmationCode) async {
//         try {
//           SignUpResult result = await Amplify.Auth.confirmSignUp(
//             username: email,
//             confirmationCode: confirmationCode,
//           );
//
//           if (result.isSignUpComplete) {
//             Get.snackbar(
//               "Success",
//               "Your email has been verified. You can now log in.",
//               backgroundColor: MyColors.success,
//               colorText: MyColors.white,
//             );
//             Get.offAll(() => const LoginScreen()); // Redirect to login screen
//           } else {
//             Get.snackbar(
//               "Verification Required",
//               "Please try again or request a new code.",
//               backgroundColor: MyColors.warning,
//               colorText: MyColors.white,
//             );
//           }
//         } catch (e) {
//           MyLoader.errorSnackBar(
//             title: 'Verification Failed',
//             message: e.toString(),
//           );
//         }
//       }
//     }
//
//       /// **AWS Cognito Signup Function**
//       Future<bool> signUpUser(String email, String password) async {
//         try {
//           SignUpResult result = await Amplify.Auth.signUp(
//             username: email,
//             password: password,
//             options: SignUpOptions(
//               userAttributes: {
//                 CognitoUserAttributeKey.email: email,
//               },
//             ),
//           );
//           return result.isSignUpComplete;
//         } catch (e) {
//           if (kDebugMode) {
//             print("Sign Up Failed: $e");
//           }
//           return false;
//         }
//       }
