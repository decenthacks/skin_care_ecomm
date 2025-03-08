import 'package:bodyandbeauty/features/authentication/screens/login/login.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class OnboardingController extends GetxController {
  static OnboardingController get instance => Get.find();

  /// **Page Controller for onboarding**
  final PageController pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;
  final GetStorage storage = GetStorage();

  @override
  void onClose() {
    pageController.dispose(); // ✅ Prevent memory leaks
    super.onClose();
  }

  /// **Update Page Indicator on Scroll**
  void updatePageIndicator(int index) => currentPageIndex.value = index;

  /// **Jump to Specific Page from Dot Navigation**
  void dotNavigationClick(int index) {
    currentPageIndex.value = index;
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    ); // ✅ Ensures smooth transition
  }

  /// **Proceed to Next Page or Navigate to Login**
  void nextPage() {
    if (currentPageIndex.value == 2) {
      _completeOnboarding();
    } else {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  /// **Skip to Last Page Directly**
  void skipPage() {
    currentPageIndex.value = 2;
    pageController.animateToPage(
      2,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  /// **Mark Onboarding as Complete & Navigate to Login**
  void _completeOnboarding() {
    if (kDebugMode) {
      print('================== Get Storage Next Button ==================');
      print(storage.read('isFirstTime'));
    }

    storage.write('isFirstTime', false);

    if (kDebugMode) {
      print('================== Get Storage Updated ==================');
      print(storage.read('isFirstTime'));
    }

    Get.offAll(() => const LoginScreen()); // ✅ Removes onboarding from the stack
  }
}
