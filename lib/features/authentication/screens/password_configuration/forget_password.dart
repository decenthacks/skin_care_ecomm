import 'package:bodyandbeauty/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:bodyandbeauty/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/sizes.dart';


class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
          padding: const EdgeInsets.all(MSizes.defaultSpace),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //// Headings
          Text(MyTexts.forgetPasswordSubTitle, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center),
          const SizedBox( height: MSizes.spaceBtwItems,),
          Text(MyTexts.forgetPasswordSubTitle, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center),
          const SizedBox(height:  MSizes.spaceBtwSections * 2),

          //// text feild
          TextFormField(
            decoration: const InputDecoration(labelText: MyTexts.email, prefixIcon: Icon(Iconsax.direct_right)),
          ),
          const SizedBox(height: MSizes.spaceBtwSections),
        /// Submit Button
          SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => Get.off(() => const ResetPassword()), child: const Text(MyTexts.submit)))
        ],

      ),
      ),
    );
  }
}
