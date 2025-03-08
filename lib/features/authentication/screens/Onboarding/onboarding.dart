import 'package:bodyandbeauty/features/authentication/controllers/onboarding_controller.dart';
import 'package:bodyandbeauty/features/authentication/screens/Onboarding/widgets/onboarding_Dot_Navigation.dart';
import 'package:bodyandbeauty/utils/constants/image_strings.dart';
import 'package:bodyandbeauty/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'widgets/onboarding_Circular_Button.dart';
import 'widgets/onboarding_page.dart';
import 'widgets/onboarding_skip.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardingController());
    return Scaffold(
      body: Stack(
        children: [

          // Horizontal scroll label page

          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnboardingPage(
                image: MyImages.OnboardinImage1,
                title: MyTexts.onBoardingTitle1,
                subTitle: MyTexts.onBoardingSubTitle1,
              ),
              OnboardingPage(
                image: MyImages.OnboardinImage2,
                title: MyTexts.onBoardingTitle2,
                subTitle: MyTexts.onBoardingSubTitle2,
              ),
              OnboardingPage(
                image: MyImages.OnboardinImage3,
                title: MyTexts.onBoardingTitle3,
                subTitle: MyTexts.onBoardingSubTitle3,
              ),
            ],
          ),

          // skip button
          const OnboardingSkip(),

          // Dot Navigation SmoothPageIndicator
          const OnboardingDotNavigation(),

          //Circular button
          const onboarding_Circular_Button(),
        ],
      ),
    );
  }
}




