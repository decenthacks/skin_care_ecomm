import 'package:bodyandbeauty/common/widgets/texts/Section_heading.dart';
import 'package:bodyandbeauty/features/shop/screens/Product_review/widgets/product_reviews.dart';
import 'package:bodyandbeauty/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:bodyandbeauty/features/shop/screens/product_details/widgets/product_detail_Image_slider.dart';
import 'package:bodyandbeauty/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:bodyandbeauty/features/shop/screens/product_details/widgets/rating_share_widget.dart';
import 'package:bodyandbeauty/utils/constants/colors.dart';
import 'package:bodyandbeauty/utils/constants/sizes.dart';
import 'package:bodyandbeauty/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

import '../../../../../common/widgets/icons/my_circular_icon.dart';
import 'bottom_add_to_cart_widget.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = MyHelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: const MyBottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///// 1. Product image Slider
            const MyProductImageSlider(),

            //// 2 - Product Details
            Padding(
                padding: const EdgeInsets.only(right: MSizes.defaultSpace,left: MSizes.defaultSpace, bottom:  MSizes.defaultSpace),
            child: Column(
              /// Rating & share
              children: [
                const MyRatingAndShare(),


              /// Price ,Title,  Stock , & Brand
                const MyProductMetaData(),
              /// Attribute
                const MyProductAttributes(),
                const SizedBox(height: MSizes.spaceBtwSections,),
              /// Checkout Button
                SizedBox(width: double.infinity,child: ElevatedButton(onPressed: () {}, style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(MSizes.md),
                    backgroundColor: dark?  MyColors.darkgrey: MyColors.light,
                    side: const BorderSide(color:  MyColors.black)),
                    child: Text('Checkout',style: Theme.of(context).textTheme.bodyMedium,)
                ),
                ),
                const SizedBox(height: MSizes.spaceBtwSections,),
              /// Description
                const MySectionHeading(title: 'Description',showActionButton: false,),
                const SizedBox(height: MSizes.spaceBtwItems),
                 const ReadMoreText(
                  'This is a Product description for Blue Nikeke Sleeve less vest. There are cwriunwr cke Sleeve less vest. There are cwriunwr c Sleeve less vest. There are cwriunwr c  iic  ciwunciu c wicnn b2fbb2i du2',
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: 'Show more',
                  trimExpandedText: 'Less',
                  moreStyle: TextStyle (fontSize: 14, fontWeight: FontWeight.w800),
                  lessStyle: TextStyle (fontSize: 14, fontWeight: FontWeight.w800),
            ),
              /// Reviews
                const Divider(),
                const SizedBox(height: MSizes.spaceBtwItems,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MySectionHeading(title: 'Reviews(199)',onPressed: (){} ,showActionButton: false,),
                    MyCircularIcon(
                      onPressed: () => Get.to(() => const ProductReviewsScreen()),
                      icon: Iconsax.arrow_right_3,
                      size: 18,
                      backgroundColor: dark ? MyColors.black : MyColors.grey,
                      width: 40,
                      height: 40,
                      color: dark ? MyColors.white: MyColors.black,
                    ),

                  ],
                ),

                const SizedBox(height: MSizes.spaceBtwSections,),
            ],
            ),)

          ],
        ),
      ),
    );
  }
}

