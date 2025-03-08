import 'package:bodyandbeauty/data/repositories/authentication_repository.dart';
import 'package:bodyandbeauty/features/authentication/screens/login/login.dart';
import 'package:bodyandbeauty/utils/constants/colors.dart';
import 'package:bodyandbeauty/utils/constants/text_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/success_screen/success_screen.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../controllers/signup/signup_controller.dart';

class VerifyEmailsScreen extends StatelessWidget {
  final String userEmail;
  final TextEditingController codeController = TextEditingController();
  final  controller = Get.put(SignupController());

  VerifyEmailsScreen({super.key, required this.userEmail});

  @override
  Widget build(BuildContext context) {
    final dark = MyHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton( onPressed: () => AuthenticationRepository.instance.logout(),
            icon: const Icon(CupertinoIcons.clear),
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(), // Enables smooth scrolling
          child: Padding(
            padding: const EdgeInsets.all(MSizes.defaultSpace),
            child: Column(
              mainAxisSize: MainAxisSize.min, // Prevents infinite height issue
              children: [
                /// **Email Illustration**
                SizedBox(
                  height: 200, // ✅ Fixed image size to avoid overflow
                  child: Image(
                    image: const AssetImage(MyImages.OnboardinImage1),
                    width: MyHelperFunctions.screenWidth() * 0.6,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: MSizes.spaceBtwSections),

                /// **Title & SubTitle**
                Text(
                  MyTexts.confirmEmail,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: MSizes.spaceBtwItems),
                Text(
                  userEmail,
                  style: Theme.of(context).textTheme.labelLarge,
                  textAlign: TextAlign.center,
                ),
                Text(
                  MyTexts.confirmEmailSubTitle,
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: MSizes.spaceBtwSections),

                /// **Input Field for Verification Code**
                TextField(
                  controller: codeController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "Enter Verification Code",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: MSizes.spaceBtwItems),

                /// **Confirm Button**
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: dark ? MyColors.dark : MyColors.light,
                    ),
                    onPressed: () {
                      if (codeController.text.isEmpty) {
                        Get.snackbar("Error", "Please enter the verification code.");
                      } else {
                        controller.verifyEmail(userEmail, codeController.text);
                      }
                    },
                    child: Text(
                      MyTexts.MyContinue,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ),
                const SizedBox(height: MSizes.spaceBtwItems),

                /// **Resend Email**
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {
                      // TODO: Implement resend verification code logic
                    },
                    child: const Text(MyTexts.resendEmail),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
