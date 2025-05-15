import 'package:bodyandbeauty/features/authentication/controllers/signin/signin_controller.dart';
import 'package:bodyandbeauty/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:bodyandbeauty/features/authentication/screens/signup/signup.dart';
import 'package:bodyandbeauty/utils/constants/colors.dart';
import 'package:bodyandbeauty/utils/helpers/helper_functions.dart';
import 'package:bodyandbeauty/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class MyLoginForm extends StatelessWidget {
  const MyLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = MyHelperFunctions.isDarkMode(context);
    final controller = Get.put(LoginController()); // ✅ Inject LoginController

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: MSizes.spaceBtwSections),
      child: Form(
        key: controller.loginFormKey, // ✅ Connect form key to controller
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Email Field
            TextFormField(
              controller: controller.email, // ✅ Bind controller
              validator: (value) => MyValidator.validateEmail(value),
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: MyTexts.email,
              ),
            ),
            const SizedBox(height: MSizes.spaceBtwInputFields),

            Obx(
                  () => TextFormField(
                controller: controller.password,
                validator: (value) => MyValidator.validatePassword(value),
                obscureText: controller.hidePassword.value,
                decoration: InputDecoration(
                  labelText: MyTexts.password,
                  prefixIcon: const Icon(Iconsax.password_check),
                  suffixIcon: IconButton(
                    onPressed: () => controller.hidePassword.value = !controller.hidePassword.value,
                    icon: Icon(controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye),
                  ),
                ),
              ),
            ), 
            const SizedBox(height: MSizes.spaceBtwInputFields),

            /// Remember Me & Forgot Password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Obx(() => Checkbox(
                        value: controller.rememberMe.value,
                        onChanged: (value) => controller.rememberMe.value = !controller.rememberMe.value,
                      ),
                    ),
                    const Text(MyTexts.rememberMe),
                  ],
                ),
                TextButton(
                  onPressed: () => Get.to(() => const ForgetPassword()),
                  child: const Text(MyTexts.forgetPassword),
                ),
              ],
            ),
            const SizedBox(height: MSizes.spaceBtwSections),

            /// Sign In Button (Connected to AWS Cognito Login)
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: dark ? MyColors.light : MyColors.dark),
                onPressed: () => controller.emailAndPasswordSignIn(), // ✅ Call login method
                child: Text(MyTexts.signIn,
                    style: Theme.of(context).textTheme.bodyMedium),
              ),
            ),

            const SizedBox(height: MSizes.spaceBtwItems),

            /// Create Account Button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => Get.to(() => const SignUpScreen()),
                child: Text(MyTexts.createAccount,
                    style: Theme.of(context).textTheme.bodyMedium),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
