import 'package:bodyandbeauty/data/repositories/authentication_repository.dart';
import 'package:bodyandbeauty/data/repositories/user/user_repository.dart';
import 'package:bodyandbeauty/utils/Loader/loader.dart';
import 'package:bodyandbeauty/utils/Popup/full_screen_loader.dart';
import 'package:bodyandbeauty/utils/network_conectivity/network_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/repositories/user/user_model.dart';
import '../../screens/signup/verify_emails.dart';


class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  final privacyPolicy = true.obs;
  final hidePassword = true.obs;
  final email = TextEditingController();
  final lastName = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final phoneNumber = TextEditingController();
  final verificationCode = TextEditingController(); // ✅ Added for OTP input
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  @override
  void onClose() {
    email.dispose();
    lastName.dispose();
    username.dispose();
    password.dispose();
    firstName.dispose();
    phoneNumber.dispose();
    verificationCode.dispose();
    super.onClose();
  }


  /// SIGN UP


Future <void> signup() async {

  try{
// Start loading
//MyFullScreenLoader.openLoadingDialog('We are processing your information...', MyImages.decerAnimation);

// check internet connectivity
    final isConnected = await NetworkManager.instance.isConnected();
    if (!isConnected) {
      MyLoader.errorSnackBar(
        title: 'No Internet',
        message: 'Please check your internet connection.',
      );
      return;
    }

// Form Validation
  if(!signupFormKey.currentState!.validate()){
      return;
  }

  // privacy police check
    if(!privacyPolicy.value){
      MyLoader.warningSnackBar(
          title: 'Accept privacy policy',
          message: 'To create an account, you must accept the Privacy Policy and Terms of Use.',
      );
      return;
    }
  // Register User in FireBase Authentication & save user data in Firebase
    final userCredential = await AuthenticationRepository.instance.registerWithEmailAndPassword(email.text.trim(), password.text.trim());

    // SAve the authenticated user data to firebase firestore
    final newUser = UserModel(
        id: userCredential.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        username: username.text.trim(),
        email : email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '');

    final userRepository = Get.put(UserRepository());
    await userRepository.saveUserRecord(newUser);

    // Show success  message
    MyLoader.successSnackBar(title: 'Congratulations', message: ' your account has been created verify email to continue.');

    // Move to verify email
    Get.to(() =>  VerifyEmailScreen(email: email.text.trim()));

  } catch (e) {
    final error = e.toString();
    if (e is FirebaseAuthException) {
      MyLoader.errorSnackBar(title: 'Signup Error', message: e.message ?? error);
    } else {
      MyLoader.errorSnackBar(title: 'Oh Snap!', message: error);
    }
  }
  finally {
    MyFullScreenLoader.stopLoading();
  }
}
}
