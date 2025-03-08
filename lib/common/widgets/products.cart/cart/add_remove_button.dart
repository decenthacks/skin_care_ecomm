import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../icons/my_circular_icon.dart';

class MyProductQuantityWithAddAndRemoveButtons extends StatelessWidget {
  const MyProductQuantityWithAddAndRemoveButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [

        MyCircularIcon(icon: Iconsax.minus,
          width: 32,
          height: 32,
          size: MSizes.md,
          color: MyHelperFunctions.isDarkMode(context) ? MyColors.white : MyColors.black,
          backgroundColor: MyHelperFunctions.isDarkMode(context) ? MyColors.darkerGrey : MyColors.light,),
        const SizedBox(width: MSizes.spaceBtwItems),
        Text('2',style: Theme.of(context).textTheme.titleSmall,),
        const SizedBox(width: MSizes.spaceBtwItems),
        const MyCircularIcon(icon: Iconsax.add,
          width: 32,
          height: 32,
          size: MSizes.md,
          color: MyColors.white,
          backgroundColor: MyColors.primary,),
      ],
    );
  }
}

