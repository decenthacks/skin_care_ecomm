import 'package:bodyandbeauty/common/styles/shadows.dart';
import 'package:bodyandbeauty/common/widgets/Image/rounded_image.dart';
import 'package:bodyandbeauty/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:bodyandbeauty/common/widgets/texts/brand_title_with_verfied_icon.dart';
import 'package:bodyandbeauty/common/widgets/texts/product_title_text.dart';
import 'package:bodyandbeauty/features/shop/screens/product_details/widgets/product_details.dart';
import 'package:bodyandbeauty/utils/constants/colors.dart';
import 'package:bodyandbeauty/utils/constants/image_strings.dart';
import 'package:bodyandbeauty/utils/constants/sizes.dart';
import 'package:bodyandbeauty/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';

import '../../icons/my_circular_icon.dart';
import '../../texts/product_price_text.dart';
class MyProductCardVertical extends StatelessWidget {
  const MyProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {

    final dark = MyHelperFunctions.isDarkMode(context);

    // container with padding color edge  radius and shadow
    return GestureDetector(
      onTap: () => Get.to(() => const ProductDetails()),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [MyShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(MSizes.productImageRadius),
          color: MyHelperFunctions.isDarkMode(context) ? MyColors.darkerGrey : MyColors.white,
        ),
        child: Column(
          children: [
            /// thumbnail , wishlist button and discount tag
            MyRoundedContainer(
              height: 180,
              padding: const EdgeInsets.all(MSizes.sm),
              backgroundColor: dark ? MyColors.dark : MyColors.light,
              child: Stack(
                children: [
                  /// thamnail image
                  const MyRoundedImage(imageUrl: MyImages.productImage1,applyImageRadius: true,),
                  /// sale tag
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
                     child: MyCircularIcon(icon: Iconsax.heart, color: Colors.red,))
                ],
               ),
            ),
            const SizedBox(height: MSizes.spaceBtwItems / 2,),

            /// details
           const Padding(
                padding: EdgeInsets.only(left: MSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyProductTitleText(title: 'title of product', smallSize: true,),
                  SizedBox(height: MSizes.spaceBtwItems / 2,),
                  MyBrandTitleWithVerifiedIcon(title: 'Brand name'),
                ],
              ),
           ),
                 const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const MyProductPriceText(price: '35.0',),
                        ///  Add to Cart
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
    );
  }
}



// class MyCircularIcon extends StatelessWidget {
//   const MyCircularIcon({
//     super.key,
//     required this.dark,
//   });
//
//   final bool dark;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(100) ,
//           color: dark? MyColors.black.withOpacity(0.9): MyColors.white.withOpacity(0.9),
//       ),
//       child: IconButton(onPressed: (){}, icon: const Icon(Iconsax.heart)),
//     );
//   }
// }
