import 'package:bodyandbeauty/features/authentication/controllers/signup/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/helpers/helper_functions.dart';


class MyTermsAndConditions extends StatelessWidget {
  const MyTermsAndConditions({
    super.key,
  });



  @override
  Widget build(BuildContext context) {
    final controller = SignupController.instance;
    final dark = MyHelperFunctions.isDarkMode(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Checkbox
        SizedBox(
          width: 24,
          height: 24,
          child: Obx(
            () =>  Checkbox(
              value: controller.privacyPolicy.value,
              onChanged: (value) => controller.privacyPolicy.value =! controller.privacyPolicy.value,
            ),
          ),
        ),
        const SizedBox(width: MSizes.spaceBtwInputFields),

        /// Terms Text
        Expanded(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: '${MyTexts.iAgreeTo} ',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                TextSpan(
                  text: MyTexts.privacyPolicy,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .apply(
                    color: dark
                        ? MyColors.white
                        : MyColors.primary,
                    decoration: TextDecoration.underline,
                    decorationColor: dark
                        ? MyColors.white
                        : MyColors.primary,
                  ),
                ),
                TextSpan(
                  text: ' ${MyTexts.and} ',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                TextSpan(
                  text: MyTexts.termsOfUse,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .apply(
                    color: dark
                        ? MyColors.white
                        : MyColors.primary,
                    decoration: TextDecoration.underline,
                    decorationColor: dark
                        ? MyColors.white
                        : MyColors.primary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}