import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';



class MySocialMediaButton extends StatelessWidget {
  const MySocialMediaButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(border: Border.all(color: MyColors.grey),borderRadius: BorderRadius.circular(100)),
          child: IconButton(onPressed: () {} ,
              icon: const Image(
                width: MSizes.iconMd,
                height: MSizes.iconMd,
                image: AssetImage(MyImages.google),
              )),
        ),
        const SizedBox(height: MSizes.spaceBtwItems,
        width: MSizes.spaceBtwItems,),
        Container(
          decoration: BoxDecoration(border: Border.all(color: MyColors.grey),borderRadius: BorderRadius.circular(100)),
          child: IconButton(onPressed: () {} ,
              icon: const Image(
                width: MSizes.iconMd,
                height: MSizes.iconMd,
                image: AssetImage(MyImages.facebook),
              )),
        ),
      ],
    );
  }
}