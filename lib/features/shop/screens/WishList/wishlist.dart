import 'package:bodyandbeauty/common/widgets/appBar/appbar.dart';
import 'package:bodyandbeauty/common/widgets/icons/my_circular_icon.dart';
import 'package:bodyandbeauty/common/widgets/layouts/grid_layout.dart';
import 'package:bodyandbeauty/common/widgets/products.cart/product_cards/product_cards_vertical.dart';
import 'package:bodyandbeauty/features/shop/screens/home/widgets/home.dart';
import 'package:bodyandbeauty/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  MyAppbar(
        title: Text('Wishlist' , style:  Theme.of(context).textTheme.headlineMedium),
        actions: [
          MyCircularIcon(icon: Iconsax.add, onPressed: () => Get.to(const HomeScreen()),)
        ],
      ),

      body: SingleChildScrollView(
        child:Padding(
            padding: const EdgeInsets.all(MSizes.defaultSpace),
        child: Column(
          children: [
            MyGridLayout(itemCount: 4, itemBuilder: (_, index) => const MyProductCardVertical())

          ],
        ),) ,
      ),
    );
  }
}
