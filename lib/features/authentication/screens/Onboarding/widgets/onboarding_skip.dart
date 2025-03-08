import 'package:bodyandbeauty/features/authentication/controllers/onboarding_controller.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/device/device_utility.dart';

class OnboardingSkip extends StatelessWidget {
  const OnboardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: MyDeviceUtils.getAppBarHeight() ,
        right: MSizes.defaultSpace ,
        child: TextButton(
         onPressed: () =>OnboardingController.instance.skipPage() , child: const Text('skip'),));
  }
}