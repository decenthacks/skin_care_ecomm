import 'package:bodyandbeauty/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:bodyandbeauty/common/widgets/texts/Section_heading.dart';
import 'package:bodyandbeauty/utils/constants/colors.dart';
import 'package:bodyandbeauty/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class MyBillingPaymentSection extends StatelessWidget {
  const MyBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {

    final dark = MyHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        MySectionHeading(title: 'Payment Method' , buttonTitle: 'Change',onPressed: () {},),
        const SizedBox(height: MSizes.spaceBtwItems / 2),
        Row(
          children: [
            MyRoundedContainer(
              width: 60,
              height: 35,
              backgroundColor: dark ? MyColors.light : MyColors.white,
              padding: const EdgeInsets.all(MSizes.sm),
              child: const Image(image: AssetImage(MyImages.google),fit: BoxFit.contain, ),
            ),
            const SizedBox(height: MSizes.spaceBtwItems / 2),
            Text('Paypal', style: Theme.of(context).textTheme.bodyLarge,)

          ],
        )
      ],
    );
  }
}
