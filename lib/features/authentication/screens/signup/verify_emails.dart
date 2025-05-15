import 'package:bodyandbeauty/data/repositories/authentication_repository.dart';
import 'package:bodyandbeauty/features/authentication/controllers/signup/verify_email_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/helpers/helper_functions.dart';



class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, this.email});
   final String? email;
  @override
  Widget build(BuildContext context) {

    final controller = Get.put(VerifyEmailController());

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: () => AuthenticationRepository.instance.logout(),icon: const Icon (CupertinoIcons.clear))],
      ),
      body: SingleChildScrollView(
            // Padding to Give Default Equal Space on all sides in all screens.
        child: Padding(
          padding: const EdgeInsets.all(MSizes.defaultSpace),
          child: Column(
              children: [
          /// Image
          Image(
          image: const AssetImage(MyImages.deliveredEmailIllustration),
          width: MyHelperFunctions.screenWidth() * 0.6,
        ), // Image
        const SizedBox(height: MSizes.spaceBtwSections),

        /// Title & SubTitle
        Text(MyTexts.confirmEmail, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center),
        const SizedBox(height: MSizes.spaceBtwItems),
        Text(email ?? '', style: Theme.of(context).textTheme.labelLarge, textAlign: TextAlign.center),

        /// Buttons
          SizedBox(width: double.infinity, child: ElevatedButton (onPressed: () => controller.checkEmailVerificationStatus(), child: const Text (MyTexts.MyContinue))),
          const SizedBox(height: MSizes.spaceBtwItems),
          SizedBox(width: double.infinity, child: TextButton(onPressed: () => controller.sendEmailVerification(), child: const Text (MyTexts.resendEmail)),
          )],
      ),
    ),
    ),
    );
  }
}