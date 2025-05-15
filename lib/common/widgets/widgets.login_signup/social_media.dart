import 'package:bodyandbeauty/features/authentication/controllers/signin/signin_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';



class MySocialMediaButton extends StatelessWidget {
  const MySocialMediaButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(border: Border.all(color: MyColors.grey),borderRadius: BorderRadius.circular(100)),
          child: IconButton(onPressed: () => controller.googleSignIn() ,
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