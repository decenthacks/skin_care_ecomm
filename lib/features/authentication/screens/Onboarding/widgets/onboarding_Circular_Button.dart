import 'package:bodyandbeauty/features/authentication/controllers/onboarding_controller.dart';
import 'package:bodyandbeauty/utils/constants/colors.dart';
import 'package:bodyandbeauty/utils/constants/sizes.dart';
import 'package:bodyandbeauty/utils/device/device_utility.dart';
import 'package:bodyandbeauty/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';


class onboarding_Circular_Button extends StatelessWidget {
  const onboarding_Circular_Button({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = MyHelperFunctions.isDarkMode(context);
    return Positioned(
        right: MSizes.defaultSpace,
        bottom: MyDeviceUtils.getBottomNavigationBarHeight(),
        child: ElevatedButton(
            onPressed: () => OnboardingController.instance.nextPage(),

            style: ElevatedButton.styleFrom(shape: const CircleBorder(), backgroundColor: dark ? MyColors.primary : Colors.black),
            child: const Icon(Iconsax.arrow_right_3)));

  }
}