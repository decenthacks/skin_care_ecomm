import 'package:flutter/material.dart';

import '../../../../../common/widgets/products.cart/cart/add_remove_button.dart';
import '../../../../../common/widgets/products.cart/cart/cart_menu.dart';
import '../../../../../common/widgets/texts/product_price_text.dart';
import '../../../../../utils/constants/sizes.dart';

class MyCartItems extends StatelessWidget {
  const MyCartItems({super.key, this.showAddRemoveButton = true});

  final bool showAddRemoveButton;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 4,
      separatorBuilder: (_, __) =>
      const SizedBox(height: MSizes.spaceBtwSections),
      itemBuilder: (_, index) =>
      Column(
        children: [
          const MyCartItem(),
          if(showAddRemoveButton) const SizedBox(height: MSizes.spaceBtwItems),
          if(showAddRemoveButton) const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [

                  /// Extra Space
                  SizedBox(width: 70),
                  ////  Add Remove Button
                  MyProductQuantityWithAddAndRemoveButtons(),
                ],
              ),

              MyProductPriceText(price: '256')
            ],
          ),
        ],
      ),
    );
  }
}
