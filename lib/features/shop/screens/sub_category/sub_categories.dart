import 'package:bodyandbeauty/common/widgets/Image/rounded_image.dart';
import 'package:bodyandbeauty/common/widgets/appBar/appbar.dart';
import 'package:bodyandbeauty/common/widgets/texts/Section_heading.dart';
import 'package:bodyandbeauty/utils/constants/image_strings.dart';
import 'package:bodyandbeauty/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/products.cart/product_cards/product_cards_horizontal.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppbar(
        title: Text('Skin care'),showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.all(MSizes.defaultSpace),
        child: Column(
          children: [
            /// banner
            const MyRoundedImage(width: double.infinity,height: null, imageUrl: MyImages.promoBanner3,applyImageRadius: true,),
            const SizedBox(height: MSizes.spaceBtwSections,),

            ///Sub Categories
            Column(
              children: [
                ///Heading
                MySectionHeading(title: 'Serum',onPressed: () {}),
                const SizedBox(height: MSizes.spaceBtwItems/2),

                SizedBox(
                  height: 120,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context,index)=> const SizedBox(width: MSizes.spaceBtwItems,),
                    itemCount: 4,
                      itemBuilder: (context, index) => const ProductCardsHorizontal()),
                )

              ],
            )
          ],
        ),),
      ),
    );
  }
}
