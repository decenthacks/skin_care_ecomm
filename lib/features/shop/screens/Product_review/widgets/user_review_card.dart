import 'package:bodyandbeauty/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:bodyandbeauty/common/widgets/products.cart/ratings/rating_bar_indicator.dart';
import 'package:bodyandbeauty/utils/constants/colors.dart';
import 'package:bodyandbeauty/utils/constants/image_strings.dart';
import 'package:bodyandbeauty/utils/constants/sizes.dart';
import 'package:bodyandbeauty/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = MyHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(backgroundImage: AssetImage(MyImages.user),),
                const SizedBox(width: MSizes.spaceBtwItems,),
                Text('john doe', style: Theme.of(context).textTheme.titleLarge),
              ],
            ),
            IconButton(onPressed: () {} , icon: const Icon(Icons.more_vert)),
          ],
        ),
          const SizedBox(height: MSizes.spaceBtwItems,),

        // Reviews
        Row(
          children: [
            const MyRatingBarIndicator(rating: 4),
            const SizedBox(width: MSizes.spaceBtwItems,),
            Text('01 Nov 2024',style: Theme.of(context).textTheme.bodyMedium,),

          ],
        ),
        const SizedBox(height: MSizes.spaceBtwItems,),
        const ReadMoreText('bibiwunuii bibyiuiue bgwvqybywbudiwi byyqwtv bybbqidinjnx  kcbbibwcbkjdbcibpiewtv bybbqidinjnx  kcbbibwcbkjdbcibpie  cbiBWIIUICKJJE bibiibeib',
        trimLines: 2,
        trimMode: TrimMode.Line,
        trimExpandedText: 'show less',
        trimCollapsedText: 'show more',
        moreStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.bold, color: MyColors.primary),
          lessStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.bold, color: MyColors.primary),
        ),
        const SizedBox(height: MSizes.spaceBtwItems,),

        /// Company Review
        MyRoundedContainer(
          backgroundColor: dark? MyColors.darkerGrey:MyColors.grey,
          child: Padding(padding: EdgeInsets.all(MSizes.md),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Company Name", style:  Theme.of(context).textTheme.titleMedium,),
                  Text("01 nov 2025", style:  Theme.of(context).textTheme.bodyLarge,),
                ],
              ),
              const SizedBox(height: MSizes.spaceBtwItems,),
              const ReadMoreText('bibiwunuii bibyiuiue bgwvqybywbudiwi byyqwtv bybbqidinjnx  kcbbibwcbkjdbcibpiewtv bybbqidinjnx  kcbbibwcbkjdbcibpie  cbiBWIIUICKJJE bibiibeib',
                trimLines: 2,
                trimMode: TrimMode.Line,
                trimExpandedText: 'show less',
                trimCollapsedText: 'show more',
                moreStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.bold, color: MyColors.primary),
                lessStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.bold, color: MyColors.primary),
              ),
            ],
          ),),
        ),
        const SizedBox(height: MSizes.spaceBtwSections,),
      ],
    );
  }
}
