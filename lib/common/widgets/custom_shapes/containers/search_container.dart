import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/device/device_utility.dart';
import '../../../../utils/helpers/helper_functions.dart';

class MySearchContainer extends StatelessWidget {
  const MySearchContainer({
    super.key, required this.text, this.icon, this.showBackground = true, this.showBorder = true, this.onTap,
    this.padding = const EdgeInsets.symmetric(horizontal: MSizes.defaultSpace),
  });

  final String text;
  final IconData? icon;
  final bool showBackground , showBorder;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final dark = MyHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding:padding,
        child: Container(
          width: MyDeviceUtils.getScreenWidth(context),
          padding: const EdgeInsets.all(MSizes.md),
          decoration: BoxDecoration(
              color:  showBackground ? dark? MyColors.dark : MyColors.light : Colors.transparent,
              borderRadius: BorderRadius.circular(MSizes.cardRadiusLg),
              border: showBorder? Border.all(color: MyColors.grey) : null
          ),
          child: Row(
            children: [
              Icon(icon, color: MyColors.darkgrey,),
              const SizedBox(width: MSizes.spaceBtwItems),
              Text(text,style:Theme.of(context).textTheme.bodySmall),
            ],
          ),
        ),
      ),
    );
  }
}
