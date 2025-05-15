import 'package:bodyandbeauty/features/personalization/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/repositories/user/user_repository.dart';
import '../../../utils/Loader/loader.dart';
import '../../../utils/Popup/full_screen_loader.dart';
import '../../../utils/network_conectivity/network_manager.dart';
import '../screens/profile/profile.dart';

/// Controller to manage user-related functionality.
class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameFormkey = GlobalKey<FormState>();

  /// init user data when Home Screen appears
  @override
  void onInit() {
    initializeNames();
    super.onInit();
  }

  /// Fetch user record
  Future<void> initializeNames() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  Future<void> updateUserName() async {
    try {
// Start Loading
      //  MyFullScreenLoader.openLoadingDialog('We are updating your information...", TImages.docerAnimation);
// Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        MyFullScreenLoader.stopLoading();
        return;
      }
// Form Validation
      if (!updateUserNameFormkey.currentState!.validate()) {
        MyFullScreenLoader.stopLoading();
        return;
      }
// Update user's first & last name in the Firebase Firestore
      Map<String, dynamic> name = {
        'FirstName': firstName.text.trim(),
        'LastName': lastName.text.trim()
      };
      await userRepository.updateSingleField(name);
// Update the Rx User value
      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();
// Remove Loader
      MyFullScreenLoader.stopLoading();
// Show Success Message
      MyLoader.successSnackBar(title: 'Congratulations',
          message: 'Your Name has been updated.');
// Move to previous screen.
      Get.off(() => const ProfileScreen());
    } catch (e) {
      MyFullScreenLoader.stopLoading();
    }
  }
}
