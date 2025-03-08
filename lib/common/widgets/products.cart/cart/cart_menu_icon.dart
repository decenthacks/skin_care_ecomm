import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../features/shop/screens/cart/widgets/cart.dart';
import '../../../../utils/constants/colors.dart';

class MyCartCounterIcon extends StatelessWidget {
  const MyCartCounterIcon({
    super.key, required this.onPressed, this.iconColor,
  });

  final VoidCallback onPressed;
  final Color? iconColor;


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(onPressed: () => Get.to(() => const CartScreen()), icon: const Icon(Iconsax.shopping_bag)),
        Positioned(
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
                color: MyColors.black,
                borderRadius: BorderRadius.circular(100)
            ),
            child: Center(
              child: Text('2', style: Theme.of(context).textTheme.labelLarge!.apply(color: MyColors.white, fontSizeFactor: 0.8)),
            ),
          ),
        )
      ],
    );
  }
}
