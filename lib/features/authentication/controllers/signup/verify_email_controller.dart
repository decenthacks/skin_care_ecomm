import 'dart:async';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:bodyandbeauty/common/widgets/success_screen/success_screen.dart';
import 'package:bodyandbeauty/data/repositories/authentication_repository.dart';
import 'package:bodyandbeauty/utils/Loader/loader.dart';
import 'package:bodyandbeauty/utils/constants/image_strings.dart';
import 'package:bodyandbeauty/utils/constants/text_strings.dart';
import 'package:get/get.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  /// Runs when the verify screen appears
  @override
  void onInit() {
    sendEmailVerification();
    setTimeForAutoredirect();
    super.onInit();
  }

  /// **Send Email Verification Link (AWS Cognito)**
  Future<void> sendEmailVerification() async {
    try {
      final user = await Amplify.Auth.getCurrentUser();
      await Amplify.Auth.resendSignUpCode(username: user.username);

      MyLoader.successSnackBar(
        title: 'Verification Sent',
        message: 'Please check your email inbox and verify your account.',
      );
    } on AuthException catch (e) {
      MyLoader.errorSnackBar(title: 'Error', message: e.message);
    } catch (e) {
      MyLoader.errorSnackBar(title: 'Unexpected Error', message: e.toString());
    }
  }

  /// **Timer to Automatically Check Email Verification Status**
  void setTimeForAutoredirect() {
    Timer.periodic(const Duration(seconds: 2), (timer) async {
      final bool isVerified = await checkEmailVerifiedStatus();
      if (isVerified) {
        timer.cancel();
        Get.off(() => SuccessScreen(
          image: MyImages.OnboardinImage1,
          title: MyTexts.yourAccountCreatedTitle,
          subTitle: MyTexts.yourAccountCreatedSubTitle,
          onPressed: () => AuthenticationRepository.instance.screenRedirect(),
        ));
      }
    });
  }

  /// **Manually Check if Email is Verified**
  Future<bool> checkEmailVerifiedStatus() async {
    try {
      final user = await Amplify.Auth.getCurrentUser();
      final attributes = await Amplify.Auth.fetchUserAttributes();
      final emailVerified = attributes.any((attr) =>
      attr.userAttributeKey == CognitoUserAttributeKey.emailVerified &&
          attr.value == 'true');

      if (emailVerified) {
        return true;
      } else {
        return false;
      }
    } on AuthException catch (e) {
      MyLoader.errorSnackBar(title: 'Error', message: e.message);
      return false;
    } catch (e) {
      MyLoader.errorSnackBar(title: 'Unexpected Error', message: e.toString());
      return false;
    }
  }
}




























// import 'dart:async';
//
// import 'package:bodyandbeauty/common/widgets/success_screen/success_screen.dart';
// import 'package:bodyandbeauty/data/repositories/authentication_repository.dart';
// import 'package:bodyandbeauty/utils/Loader/loader.dart';
// import 'package:bodyandbeauty/utils/constants/image_strings.dart';
// import 'package:bodyandbeauty/utils/constants/text_strings.dart';
// import 'package:get/get.dart';
//
// class VerifyEmailController extends GetxController {
//   static VerifyEmailController get instance => Get.find();
//
//   //// Send Email Whenever  Verify Screen appears & Set Timer for auto redirect
//
//   @override
//   void onInit() {
//     sendEmailVerification();
//     setTimeForAutoredirect();
//     super.onInit();
//   }
//
//   /// Send Email Verification link
//   sendEmailVerification() {
//     try {
//       await AuthenticationRepository.instance.sendEmailVerification();
//       MyLoader.errorSnackBar(
//           title: 'Oh Snap!',
//           message: 'Please check your inbox and verify email.');
//     } catch (e) {
//       MyLoader.errorSnackBar(title: 'Oh Snap!', message: e.toString());
//     }
//   }
//
//   /// Timer to automatically redirect on Email Verification
//   setTimeForAutoredirect() {
//     Timer.periodic(const Duration(seconds: 1), (timer) async {
//       await FirebaseAuth.instance.currentUser?.reload();
//       final user = FirebaseAuth.instance.currentUser;
//       if (user?.emailVerified ?? false) {
//         timer.cancel();
//         Get.off(() =>
//             SuccessScreen(image: MyImages.OnboardinImage1,
//                 title: MyTexts.yourAccountCreatedTitle,
//                 subTitle: MyTexts.yourAccountCreatedSubTitle,
//                 onPressed : () => AuthenticationRepository.instance.screenRedirect(),
//                 ));
//       }
//     });
//   }
//
// /// Manually Check if Email Verified
// checkEmailVerifiedStatus() async {
//     final currentUser = FirebaseAuth.instance.currentUser;
//     if(currentUser != null && currentUser.emailVerified){
//       Get.off(
//               () => SuccessScreen(
//                   image: MyImages.OnboardinImage1 ,
//                   title: MyTexts.yourAccountCreatedTitle,
//                   subTitle: MyTexts.yourAccountCreatedTitle,
//                   onPressed: () => AuthenticationRepository.instance.screenRedirect(),
//                   ),
//       );
//     }
//
// }
// }
