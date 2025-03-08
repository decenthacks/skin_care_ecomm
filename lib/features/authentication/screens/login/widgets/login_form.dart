import 'package:bodyandbeauty/features/authentication/controllers/signup/signup_controller.dart';
import 'package:bodyandbeauty/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:bodyandbeauty/features/authentication/screens/signup/signup.dart';
import 'package:bodyandbeauty/navigation_menu.dart';
import 'package:bodyandbeauty/utils/constants/colors.dart';
import 'package:bodyandbeauty/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class MyLoginForm extends StatelessWidget {
  const MyLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = MyHelperFunctions.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: MSizes.spaceBtwSections),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //// Email
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: MyTexts.email,
              ),
            ),
            const SizedBox(height: MSizes.spaceBtwInputFields),

            //// Password
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.password_check),
                labelText: MyTexts.password,
                suffixIcon: Icon(Iconsax.eye_slash),
              ),
            ),
            const SizedBox(height: MSizes.spaceBtwInputFields),

            //// Remember Me and Forgot Password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    /// Remember Me
                    Checkbox(
                      value: true,
                      onChanged: (value) {},
                    ),
                    const Text(MyTexts.rememberMe),
                  ],
                ),

                /// Forgot Password
                TextButton(
                  onPressed: () => Get.to(() => const ForgetPassword()),
                  child: const Text(MyTexts.forgetPassword),
                ),
              ],
            ),

            const SizedBox(height: MSizes.spaceBtwSections),

            /// Sign In Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: dark? MyColors.light : MyColors.dark),
                onPressed: () => Get.to(() => const NavigationMenu()),
                child:  Text(MyTexts.signIn,style: Theme.of(context).textTheme.bodyMedium,),
              ),
            ),

            const SizedBox(height: MSizes.spaceBtwItems),

            /// Create Account Button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => Get.to(() => const SignUpScreen()),
                child: Text(MyTexts.createAccount,style: Theme.of(context).textTheme.bodyMedium,),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
