import 'package:bodyandbeauty/common/styles/spacing_styles.dart';
import 'package:bodyandbeauty/utils/constants/colors.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/text_strings.dart';
import '../../../utils/helpers/helper_functions.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen(
      {super.key,
      this.image,
      this.title,
      this.subTitle,
      required this.onPressed});

  final image, title, subTitle;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final dark = MyHelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: MySpacingStyle.paddingWithAppBarHeight * 2,
          child: Column(
            children: [
              /// image
              Image(
                image: AssetImage(image),
                width: MyHelperFunctions.screenWidth() * 0.6,
              ),
              const SizedBox(
                height: MSizes.spaceBtwSections,
              ),

              /// Title and subTitle
              Text(title,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center),
              const SizedBox(
                height: MSizes.spaceBtwItems,
              ),
              Text(subTitle,
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center),
              const SizedBox(
                height: MSizes.spaceBtwSections,
              ),

              /// Buttons
              const SizedBox(
                height: MSizes.spaceBtwItems,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: dark? MyColors.light : MyColors.dark),
                    onPressed: onPressed, child: Text('Continue',style: Theme.of(context).textTheme.bodyMedium,)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
