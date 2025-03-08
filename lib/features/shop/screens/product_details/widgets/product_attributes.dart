import 'package:bodyandbeauty/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:bodyandbeauty/common/widgets/texts/Section_heading.dart';
import 'package:bodyandbeauty/common/widgets/texts/product_price_text.dart';
import 'package:bodyandbeauty/common/widgets/texts/product_title_text.dart';
import 'package:bodyandbeauty/utils/constants/colors.dart';
import 'package:bodyandbeauty/utils/constants/sizes.dart';
import 'package:bodyandbeauty/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/chip/choice_chip.dart';

class MyProductAttributes extends StatelessWidget {
  const MyProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = MyHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        /// -- Selected Attribute Price and Description
        MyRoundedContainer(
          padding: const EdgeInsets.all(MSizes.md),
          backgroundColor: dark ? MyColors.darkerGrey : MyColors.grey,
          child: Column(
            children: [
              /// Title Price and Stock
              Row(
                children: [
                  const MySectionHeading(
                    title: 'Variations',
                    showActionButton: false,
                  ),
                  const SizedBox(
                    width: MSizes.spaceBtwItems,
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const MyProductTitleText(
                            title: 'Price :',
                            smallSize: true,
                          ),
                          const SizedBox(
                            width: MSizes.spaceBtwItems,
                          ),
                          // Actuall Price
                          Text(
                            '\$25',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .apply(decoration: TextDecoration.lineThrough),
                          ),
                          const SizedBox(width: MSizes.spaceBtwItems),
                          //saleprice
                          const MyProductPriceText(price: '20'),
                        ],
                      ),

                      /// Stock
                      Row(
                        children: [
                          const MyProductTitleText(
                            title: 'Stock : ',
                            smallSize: true,
                          ),
                          Text(
                            'In Stock',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),

              /// Variations Description
              const MyProductTitleText(
                title:
                    'This is descriptions of products and it can goes up to 4 lines',
                smallSize: true,
                maxLines: 4,
              ),
            ],
          ),
        ),
        const SizedBox(height: MSizes.spaceBtwItems,)
,
        /// Attribute
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          const MySectionHeading(title: 'Color', showActionButton: false,),
          const SizedBox(height: MSizes.spaceBtwItems / 2,),
         Wrap(
           spacing: 8,
           children: [
             MyChoiseChip(text: 'Green', selected: false,onSelected: (value){},),
             MyChoiseChip(text: 'Blue', selected: true,onSelected: (value){}),
             MyChoiseChip(text: 'Pink', selected: false,onSelected: (value){}),
           ],
         )

        ],),
        /// Attribute
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          const MySectionHeading(title: 'Sizes',showActionButton: false,),
          const SizedBox(height: MSizes.spaceBtwItems / 2,),
        Wrap(
          spacing: 8,
          children: [
            MyChoiseChip(text: 'Eu 34', selected: true,onSelected: (value){},),
            MyChoiseChip(text: 'Eu 35', selected: false,onSelected: (value){}),
            MyChoiseChip(text: 'Eu 36', selected: false,onSelected: (value){}),
          ],
        )

        ],),

      ],
    );
  }
}

