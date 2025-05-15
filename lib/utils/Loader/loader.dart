// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../constants/colors.dart';
import '../helpers/helper_functions.dart';


class MyLoader {
  /// ✅ **Hide Snackbar**
  static void hideSnackBar() {
    if (Get.context != null) {
      ScaffoldMessenger.of(Get.context!).hideCurrentSnackBar();
    }
  }

  /// ✅ **Custom Toast**
  static void customToast({required String message}) {
    if (Get.context != null) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        SnackBar(
          elevation: 6,
          duration: const Duration(seconds: 3),
          backgroundColor: Colors.transparent,
          content: Container(
            padding: const EdgeInsets.all(12.0),
            margin: const EdgeInsets.symmetric(horizontal: 30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: MyHelperFunctions.isDarkMode(Get.context!)
                  ? MyColors.darkerGrey.withOpacity(0.9)
                  : MyColors.grey.withOpacity(0.9),
            ),
            child: Center(
              child: Text(
                message,
                style: Theme.of(Get.context!).textTheme.labelLarge,
              ),
            ),
          ),
        ),
      );
    }
  }

  /// ✅ **Success Snackbar (Green)**
  static void successSnackBar({required String title, String message = '', int duration = 3}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: Colors.white,
      backgroundColor: MyColors.primary,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: duration),
      margin: const EdgeInsets.all(10),
      icon: const Icon(Iconsax.check, color: MyColors.white),
    );
  }

  /// ⚠️ **Warning Snackbar (Orange)**
  static void warningSnackBar({required String title, String message = '', int duration = 3}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: MyColors.white,
      backgroundColor: Colors.orange,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: duration),
      margin: const EdgeInsets.all(10),
      icon: const Icon(Iconsax.warning_2, color: MyColors.white),
    );
  }

  /// ❌ **Error Snackbar (Red)**
  static void errorSnackBar({required String title, String message = '', int duration = 3}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: Colors.white,
      backgroundColor: Colors.red,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: duration),
      margin: const EdgeInsets.all(10),
      icon: const Icon(Iconsax.close_circle, color: MyColors.white),
    );
  }

  /// ℹ️ **Info Snackbar (Blue)**
  static void infoSnackBar({required String title, String message = '', int duration = 3}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: Colors.white,
      backgroundColor: Colors.blue,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: duration),
      margin: const EdgeInsets.all(10),
      icon: const Icon(Iconsax.info_circle, color: MyColors.white),
    );
  }

  /// 🔄 **Loading Snackbar (Grey)**
  static void loadingSnackBar({required String title, String message = 'Loading...', int duration = 3}) {
    Get.snackbar(
      title,
      message,
      isDismissible: false,
      shouldIconPulse: true,
      colorText: Colors.white,
      backgroundColor: Colors.grey[800],
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: duration),
      margin: const EdgeInsets.all(10),
      icon: const Icon(Iconsax.refresh, color: MyColors.white),
    );
  }
}
