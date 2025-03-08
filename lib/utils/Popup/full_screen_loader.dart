import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';
import '../helpers/helper_functions.dart';
import 'animaition_loader.dart';

/// A utility class for managing a full-screen loading dialog.
class MyFullScreenLoader {
  /// Open a full-screen loading dialog with a given text and animation.
  /// This method doesn't return anything.
  ///
  /// Parameters:
  /// -  text: The text to be displayed in the loading dialog.
  /// - animation: The Lottie animation to be shown.
  static void openLoadingDialog(String text, String animation) {
    if (Get.overlayContext == null) return; // ✅ Prevents null error

    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false, // The dialog can't be dismissed by tapping outside
      builder: (_) => PopScope(
        canPop: false, // Disable popping with the back button
        child: Dialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: MyHelperFunctions.isDarkMode(Get.context!)
                  ? MyColors.dark
                  : MyColors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min, // ✅ Prevents overflow
              children: [
                const SizedBox(height: 20),
                MyAnimationLoaderWidget(text: text, animation: animation),
              ],
            ),
          ),
        ),
      ),
    );
  }
  /// Stop the currently open loading dialog.
  /// This method doesn't return anything.
  static void stopLoading() {
    if (Get.overlayContext != null && Navigator.canPop(Get.overlayContext!)) {
      Navigator.of(Get.overlayContext!).pop(); // ✅ Prevents popping error
    }
  }
}
