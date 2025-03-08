import 'package:bodyandbeauty/common/styles/spacing_styles.dart';
import 'package:bodyandbeauty/features/authentication/screens/login/widgets/login_form.dart';
import 'package:bodyandbeauty/features/authentication/screens/login/widgets/login_header.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/widgets.login_signup/form_divider.dart';
import '../../../../common/widgets/widgets.login_signup/social_media.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight, // Ensures the scrollable area matches the screen height
              ),
              child: IntrinsicHeight(
                child: Padding(
                  padding: MySpacingStyle.paddingWithAppBarHeight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch, // Stretch children to take full width
                    children: [
                      /// Logo, Title, SubTitle
                      const MyLoginHeader(),

                      /// Form
                      const MyLoginForm(),

                      /// Divider
                      MyFormDivider( dividerText: MyTexts.orSignInWith.capitalize!, ),

                      const SizedBox(height: MSizes.spaceBtwSections),

                      /// Footer
                      const MySocialMediaButton(),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
