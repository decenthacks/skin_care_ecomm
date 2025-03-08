import 'package:bodyandbeauty/common/widgets/Image/circular_image.dart';
import 'package:bodyandbeauty/common/widgets/texts/brand_title_with_verfied_icon.dart';
import 'package:bodyandbeauty/common/widgets/texts/product_price_text.dart';
import 'package:bodyandbeauty/common/widgets/texts/product_title_text.dart';
import 'package:bodyandbeauty/utils/constants/enums.dart';
import 'package:bodyandbeauty/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class MyProductMetaData extends StatelessWidget {
  const MyProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = MyHelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        /// Price and Sale Price
        Row(
          children: [
            // SAle Tag
              MyRoundedContainer(
              radius: MSizes.sm,
                backgroundColor: MyColors.secondary.withOpacity(0.8),
                padding: const EdgeInsets.symmetric(horizontal: MSizes.sm,vertical: MSizes.xs),
                child: Text('25%',style: Theme.of(context).textTheme.labelLarge!.apply(color: MyColors.black)),
              ),
            const SizedBox(width: MSizes.spaceBtwItems),

            //Price
            Text('250', style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough)),
            const SizedBox(width: MSizes.spaceBtwItems),
            const MyProductPriceText(price: '175', isLarge: true,),
          ],
        ),
             const SizedBox(width: MSizes.spaceBtwItems / 1.5),

        /// Title
        const MyProductTitleText(title: 'description title of product',),
        const SizedBox(width: MSizes.spaceBtwItems / 1.5),

        /// Stock Status
        Row( children: [
          const MyProductTitleText(title: 'Status : ',),
          const SizedBox(width: MSizes.spaceBtwItems / 1.5),
          Text('In Stock', style: Theme.of(context).textTheme.titleMedium,)
        ]),
        const SizedBox(width: MSizes.spaceBtwItems / 1.5),

        /// Brand
        Row(
          children: [
            MyCircularImage(
                image: MyImages.cosmeticsIcon,
            width: 32,
            height: 32,
            overlayColor:  darkMode ? MyColors.white : MyColors.black),
            MyBrandTitleWithVerifiedIcon(title: 'Brand name', brandTextSize: TextSizes.medium,),
          ],
        )
      ],

    );
  }
}
