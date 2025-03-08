import 'package:bodyandbeauty/common/widgets/appBar/appbar.dart';
import 'package:bodyandbeauty/features/shop/screens/CheckOut/checkout.dart';
import 'package:bodyandbeauty/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:bodyandbeauty/utils/constants/sizes.dart';
import 'package:bodyandbeauty/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/constants/colors.dart';

class CartScreen extends StatelessWidget {

  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = MyHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: MyAppbar(
        showBackArrow: true,
        title: Text('Cart', style: Theme.of(context).textTheme.headlineSmall,)),
      body: const Padding(padding: EdgeInsets.all(MSizes.defaultSpace),

        /// -- Item in Carts
      child: MyCartItems()
      ),

      /// CheckOut Button
      bottomNavigationBar:
        Padding(
          padding: const EdgeInsets.all(MSizes.defaultSpace),
          child: ElevatedButton(onPressed: () => Get.to(() => const CheckoutScreen()), style: ElevatedButton.styleFrom(
              backgroundColor: dark?  MyColors.darkgrey: MyColors.grey,
              side: const BorderSide(color:  MyColors.black)),
              child: Text('CheckOut \$ 256.0',style: Theme.of(context).textTheme.bodyMedium,)
          ),
        ),
        );

  }
}

