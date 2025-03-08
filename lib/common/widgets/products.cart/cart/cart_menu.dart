import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../Image/rounded_image.dart';
import '../../texts/brand_title_with_verfied_icon.dart';
import '../../texts/product_title_text.dart';

class MyCartItem extends StatelessWidget {
  const MyCartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// image
        MyRoundedImage(
          imageUrl: MyImages.productImage1,
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(MSizes.sm),
          backgroundColor: MyHelperFunctions.isDarkMode(context) ?  MyColors.darkerGrey : MyColors.light,
        ),
        const SizedBox(width: MSizes.spaceBtwItems),

        /// Title Price and Size
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyBrandTitleWithVerifiedIcon(title: 'Product Compay name'),
              Flexible (child: MyProductTitleText(title: 'Description Title of Product', maxLines: 1,)),
              /// Attribute
              Text.rich(
                  TextSpan(
                      children: [
                        TextSpan(text: 'color ', style: Theme.of(context).textTheme.bodySmall),
                        TextSpan(text: 'Green', style: Theme.of(context).textTheme.bodyLarge),
                        TextSpan(text: 'size ', style: Theme.of(context).textTheme.bodySmall),
                        TextSpan(text: 'Uk 08', style: Theme.of(context).textTheme.bodyLarge),

                      ]
                  )
              )
            ],
          ),
        )
      ],
    );
  }
}
