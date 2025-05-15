import 'package:bodyandbeauty/features/personalization/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../data/repositories/authentication_repository.dart';
import '../../../../utils/Loader/loader.dart';
import '../../../../utils/Popup/full_screen_loader.dart';
import '../../../../utils/network_conectivity/network_manager.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());

  @override
  void onInit() {
    email.text = localStorage.read('REMEMBER_ME_EMAIL') ?? '';
    password.text = localStorage.read('REMEMBER_ME_PASSWORD') ?? '';
    super.onInit();
  }
  /// Email SignIn Authentication
  Future<void> emailAndPasswordSignIn() async {
    try {
      // Check Internet Connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        MyLoader.errorSnackBar(
          title: 'No Internet',
          message: 'Please check your internet connection.',
        );
        return;
      }

      // Validate Form
      if (!loginFormKey.currentState!.validate()) return;

      // Remember Me
      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

      // Login
      final userCredentials = await AuthenticationRepository.instance.loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      // Show success message
      MyLoader.successSnackBar(
        title: 'Welcome Back!',
        message: 'You have successfully logged in.',
      );

      // Navigate
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      final error = e.toString();
      if (e is FirebaseAuthException) {
        MyLoader.errorSnackBar(
            title: 'Login Error', message: e.message ?? error);
      } else {
        MyLoader.errorSnackBar(title: 'Oh Snap!', message: error);
      }
    } finally {
      MyFullScreenLoader.stopLoading();
    }
  }

  /// Google SignIn Authentication
  Future<void> googleSignIn() async {
    try {
// Start Loading
   //   MyFullScreenLoader.openLoadingDialog('Logging you in...', MyImages.docerAnimation);

// Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        //MyFullScreenLoader.stopLoading();
        return;
      }

// Google Authentication
      final userCredentials = await AuthenticationRepository.instance.signInWithGoogle();

// save user record
    await userController.saveUserRecord(userCredentials);

      AuthenticationRepository.instance.screenRedirect();


    } catch (e) {
      MyLoader.errorSnackBar (title: 'Oh Snap', message: e.toString());
    }
  }
}

