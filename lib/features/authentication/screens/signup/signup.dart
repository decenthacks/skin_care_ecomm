import 'package:bodyandbeauty/common/widgets/widgets.login_signup/form_divider.dart';
import 'package:bodyandbeauty/common/widgets/widgets.login_signup/social_media.dart';
import 'package:bodyandbeauty/utils/constants/sizes.dart';
import 'package:bodyandbeauty/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'sign_up_form.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(MSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Title
              Text(
                MyTexts.signupTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: MSizes.spaceBtwSections),

              /// Form
              const MySignUpForm(),
              const SizedBox(height: MSizes.spaceBtwSections),

              /// Divider 
              MyFormDivider( dividerText: MyTexts.orSignUpWith.capitalize!,),
              const SizedBox(height: MSizes.spaceBtwSections),

              /// footer
              const MySocialMediaButton(),
              const SizedBox(height: MSizes.spaceBtwSections),
            ],
          ),
        ),
      ),
    );
  }
}

// Save Authenticated data to the  AWS Store

//Show success msg

// move to verify Email Screen

