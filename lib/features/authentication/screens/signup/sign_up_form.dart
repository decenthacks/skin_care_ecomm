import 'package:bodyandbeauty/utils/constants/colors.dart';
import 'package:bodyandbeauty/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../controllers/signup/signup_controller.dart';
import 'terms_and_conditions.dart';

class MySignUpForm extends StatelessWidget {
  const MySignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    final dark = MyHelperFunctions.isDarkMode(context);

    return Form(
      key: controller.signupFormKey ,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// First Name and Last Name
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.firstName,
                  validator: (value) => MyValidator.validateEmptyText('First Name', value),
                  decoration: const InputDecoration(
                    labelText: MyTexts.firstName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
              const SizedBox(width: MSizes.spaceBtwInputFields),
              Expanded(
                child: TextFormField(
                  controller: controller.lastName,
                  validator: (value) => MyValidator.validateEmptyText('Last Name', value),
                  decoration: const InputDecoration(
                    labelText: MyTexts.lastName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: MSizes.spaceBtwInputFields),

          /// Username
          TextFormField(
            controller: controller.username,
            validator: (value) => MyValidator.validateEmptyText('Username', value),
            decoration: const InputDecoration(
              labelText: MyTexts.username,
              prefixIcon: Icon(Iconsax.user_edit),
            ),
          ),
          const SizedBox(height: MSizes.spaceBtwInputFields),

          /// Email
          TextFormField(
            controller: controller.email,
            validator: (value) => MyValidator.validateEmail(value),
            decoration: const InputDecoration(
              labelText: MyTexts.email,
              prefixIcon: Icon(Iconsax.direct),
            ),
          ),
          const SizedBox(height: MSizes.spaceBtwInputFields),

          /// Phone Number
          TextFormField(
            controller: controller.phoneNumber,
            validator: (value) => MyValidator.validatePhoneNumber(value),
            decoration: const InputDecoration(
              labelText: MyTexts.phoneNo,
              prefixIcon: Icon(Iconsax.call),
            ),
          ),
          const SizedBox(height: MSizes.spaceBtwInputFields),

          /// Password
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

          /// Terms and Conditions
          const MyTermsAndConditions(),
          const SizedBox(height: MSizes.spaceBtwInputFields),
          const SizedBox(height: MSizes.spaceBtwSections),

          /// Sign Up Button with AWS Amplify
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: dark ? MyColors.light : MyColors.dark,
              ),
              onPressed: () => controller.signup(),
              child: Text(
                MyTexts.createAccount,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
