import 'package:bodyandbeauty/common/widgets/icons/my_circular_icon.dart';
import 'package:bodyandbeauty/utils/constants/colors.dart';
import 'package:bodyandbeauty/utils/constants/sizes.dart';
import 'package:bodyandbeauty/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class MyBottomAddToCart extends StatelessWidget {
  const MyBottomAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = MyHelperFunctions.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: MSizes.defaultSpace, vertical: MSizes.defaultSpace / 2),
      decoration: BoxDecoration(
          color: dark ? MyColors.darkerGrey : MyColors.softgrey,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(MSizes.cardRadiusLg),
              topRight: Radius.circular(MSizes.cardRadiusLg))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const MyCircularIcon(
                icon: Iconsax.minus,
                backgroundColor: MyColors.darkgrey,
                width: 40,
                height: 40,
                color: MyColors.white,

              ),
              const SizedBox(
                width: MSizes.spaceBtwItems,
              ),
              Text(
                '2',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(
                width: MSizes.spaceBtwItems,
              ),
              const MyCircularIcon(
                icon: Iconsax.add,
                backgroundColor: MyColors.black,
                width: 40,
                height: 40,
                color: MyColors.white,
              ),
            ],
          ),
          ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(MSizes.md),
                backgroundColor: MyColors.darkgrey,
                side: const BorderSide(color:  MyColors.darkgrey)
              ),
              child: Text('Add To Cart',style: Theme.of(context).textTheme.titleMedium,)
          )
        ],
      ),
    );
  }
}
