import 'package:bodyandbeauty/data/repositories/authentication_repository.dart';
import 'package:bodyandbeauty/features/authentication/screens/reset_password/reset_password_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../utils/Loader/loader.dart';
import '../../../../utils/network_conectivity/network_manager.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();
// Variables
  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();


  /// Send Reset Password EMail
  sendPasswordResetEmail() async {
    try {

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        MyLoader.errorSnackBar(title: 'No Internet', message: 'Check your connection.');
        return;
      }

      if (!forgetPasswordFormKey.currentState!.validate()) {
        MyLoader.warningSnackBar(title: 'Invalid Input', message: 'Please fill all required fields.');
        return;
      }
     await AuthenticationRepository.instance.sendPasswordResetEmail(email.text.trim());
      /// send email to reset password

      MyLoader.successSnackBar(title: 'Email Sent',message: 'Email Link Sent to Reset your password'.tr);

      // Redirect Screen
      Get.to(() => ResetPasswordScreen(email: email.text.trim()));

    } catch (e) {
      MyLoader.errorSnackBar(title: 'Oh Snap',message: e.toString());
    }
  }
  resendPasswordResetEmail(String email) async {
    try {

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        MyLoader.errorSnackBar(title: 'No Internet', message: 'Check your connection.');
        return;
      }

      await AuthenticationRepository.instance.sendPasswordResetEmail(email);
      MyLoader.successSnackBar(title: 'Email Sent',message: 'Email Link Sent to Reset your password'.tr);


    } catch (e) {
      MyLoader.errorSnackBar(title: 'Oh Snap',message: e.toString());
    }
  }
}