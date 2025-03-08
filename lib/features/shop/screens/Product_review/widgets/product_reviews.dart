import 'package:bodyandbeauty/common/widgets/appBar/appbar.dart';
import 'package:bodyandbeauty/features/shop/screens/Product_review/widgets/progress_indicator_and_rating.dart';
import 'package:bodyandbeauty/common/widgets/products.cart/ratings/rating_bar_indicator.dart';
import 'package:bodyandbeauty/features/shop/screens/Product_review/widgets/rating_program_indicator.dart';
import 'package:bodyandbeauty/features/shop/screens/Product_review/widgets/user_review_card.dart';
import 'package:bodyandbeauty/utils/constants/colors.dart';
import 'package:bodyandbeauty/utils/constants/sizes.dart';
import 'package:bodyandbeauty/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:iconsax/iconsax.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// AppBar
      appBar: MyAppbar(title: Text('Review and Rating',style: Theme.of(context).textTheme.titleSmall,),showBackArrow: true,),


      ///body
      body: SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.all(MSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Rating and reviews are verified and are from people who use the same type of device that you use."),
            const SizedBox(height: MSizes.spaceBtwItems,),

            // overall product rating
            const MyOverAllProductRating(),
            const MyRatingBarIndicator(rating: 4.5,),
            Text("12,678",style: Theme.of(context).textTheme.bodySmall),
            const SizedBox(height: MSizes.spaceBtwSections,),

            //// User Review List
            const UserReviewCard(),
            const UserReviewCard(),
            const UserReviewCard(),
            const UserReviewCard(),
            const UserReviewCard(),

          ],
        ),),

      ),
    );

  }
}

