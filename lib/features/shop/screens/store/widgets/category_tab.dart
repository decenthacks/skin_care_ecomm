import 'package:bodyandbeauty/common/widgets/layouts/grid_layout.dart';
import 'package:bodyandbeauty/common/widgets/products.cart/product_cards/product_cards_vertical.dart';
import 'package:bodyandbeauty/common/widgets/texts/Section_heading.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/Brand Cards/brand_card_showcase.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class MyCategoryTab extends StatelessWidget {
  const MyCategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(MSizes.defaultSpace),
          child: Column(
            children: [
              /// Brand
              const MyBrandShowCase(
                image: [
                  MyImages.productImage3,
                  MyImages.productImage2,
                  MyImages.productImage1
                ],
              ),

              /// Products
              MySectionHeading(
                title: 'you might like',
                showActionButton: true,
                onPressed: () {},
              ),
              const SizedBox(
                height: MSizes.spaceBtwItems,
              ),

              MyGridLayout(
                  itemCount: 4,
                  itemBuilder: (_, index) => const MyProductCardVertical()),
            ],
          ),
        ),
      ],
    );
  }
}
