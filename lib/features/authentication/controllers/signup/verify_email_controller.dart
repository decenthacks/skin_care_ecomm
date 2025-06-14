
import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/success_screen/success_screen.dart';
import '../../../../data/repositories/authentication_repository.dart';
import '../../../../utils/Loader/loader.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/text_strings.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

//// Send email Whenever Verify Screen Appear & Set timer For auto redirect
@override
  void onInit(){
  sendEmailVerification();
  setTimerForAutoRedirect();
  super.onInit();
}

  /// Send Email Verification link
  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      MyLoader.successSnackBar (title: 'Email Sent', message: 'Please Check your inbox and verify your email.');
    } catch (e) {
      MyLoader.errorSnackBar (title: 'Oh Snap!', message: e.toString());
    }
  }
/// Timer to automatically redirect on Email Verification
  setTimerForAutoRedirect() {
    Timer.periodic(
      const Duration(seconds: 1),
          (timer) async {
        await FirebaseAuth.instance.currentUser?.reload();
        final user = FirebaseAuth.instance.currentUser;
        if (user?.emailVerified ?? false) {
          timer.cancel();
          Get.off(
                () => SuccessScreen(
              image: MyImages.successfullyRegisterAnimation,
              title: MyTexts.yourAccountCreatedTitle,
              subTitle: MyTexts.yourAccountCreatedSubTitle,
              onPressed: () => AuthenticationRepository.instance.screenRedirect(),
            ), // SuccessScreen
          );
        }
      },
    ); // Timer.periodic
  }

//// Manually Check if Email Verified
  checkEmailVerificationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      Get.off(
            () => SuccessScreen(
          image: MyImages.successfullyRegisterAnimation,
          title: MyTexts.yourAccountCreatedTitle,
          subTitle: MyTexts.yourAccountCreatedSubTitle,
          onPressed: () => AuthenticationRepository.instance.screenRedirect(),
        ),
      );
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
