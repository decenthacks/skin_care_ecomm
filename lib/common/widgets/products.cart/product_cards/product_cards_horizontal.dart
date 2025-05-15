// ignore_for_file: deprecated_member_use

import 'package:bodyandbeauty/common/widgets/Image/rounded_image.dart';
import 'package:bodyandbeauty/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:bodyandbeauty/common/widgets/texts/brand_title_with_verfied_icon.dart';
import 'package:bodyandbeauty/common/widgets/texts/product_price_text.dart';
import 'package:bodyandbeauty/common/widgets/texts/product_title_text.dart';
import 'package:bodyandbeauty/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../icons/my_circular_icon.dart';

class ProductCardsHorizontal extends StatelessWidget {
  const ProductCardsHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = MyHelperFunctions.isDarkMode(context);
    return Container(
        width: 310,
        padding: const EdgeInsets.all(1),
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(MSizes.productImageRadius),
    color: dark ? MyColors.darkerGrey : MyColors.lightContainer,
    ),
      child: Row(
        children: [
          /// Thumbnail
          MyRoundedContainer(
            height: 120,
            padding:const EdgeInsets.all(MSizes.sm),
            backgroundColor: dark ? MyColors.dark : MyColors.light,
            child:  Stack(
              children: [
                // Thumbnail Image
                const SizedBox(
                    height: 120,
                    width: 120,
                    child: MyRoundedImage(imageUrl: MyImages.productImage1,applyImageRadius: true,)),

                Positioned(
                    top: 12,
                    child: MyRoundedContainer(
                      radius: MSizes.sm,
                      backgroundColor: MyColors.secondary.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(horizontal: MSizes.sm,vertical: MSizes.xs),
                      child: Text('25%',style: Theme.of(context).textTheme.labelLarge!.apply(color: MyColors.black)),

                    )),
                /// Favourite icon button
                const Positioned(
                    top: 0,
                    right: 0,
                    child: MyCircularIcon(icon: Iconsax.heart, color: Colors.red,)),
              ],
            ),
          ),
          // details
          SizedBox(
            width: 172,
            child: Padding(
              padding: const EdgeInsets.only(top: MSizes.sm, left: MSizes.sm),
              child: Column(
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyProductTitleText(title: 'Description title of product',smallSize: true,),
                      SizedBox(height: MSizes.spaceBtwItems/2),
                      MyBrandTitleWithVerifiedIcon(title: 'Brand name')
                    ],
                  ),

                  const Spacer(),

                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Flexible( child: MyProductPriceText(price: '250.0 - 2600')),
                  //// Add to Cart
                  Container(
                    decoration:
                    const BoxDecoration(
                      color: MyColors.dark,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(MSizes.cardRadiusMd),
                        bottomRight: Radius.circular (MSizes.productImageRadius),
                      ),
                    ),
                    child: const SizedBox(
                        width: MSizes.iconLg * 1.2,
                        height: MSizes.iconLg * 1.2,
                        child: Center(child: Icon(Iconsax.add,color: MyColors.white,))),
                  ),
                    ],
                  ),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
