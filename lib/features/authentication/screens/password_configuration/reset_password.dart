import 'package:bodyandbeauty/utils/constants/image_strings.dart';
import 'package:bodyandbeauty/utils/constants/text_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed:  () => Get.back(), icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(MSizes.defaultSpace),
        child: Column(
          children: [
            /// image
            Image(image: const AssetImage(MyImages.deliveredEmailIllustration),width: MyHelperFunctions.screenWidth() * 0.6,),
            const SizedBox(height:  MSizes.spaceBtwSections,),

            /// Title and subTitle
            Text(MyTexts.changeYourPasswordTitle, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center),
            const SizedBox( height: MSizes.spaceBtwItems,),
            Text(MyTexts.changeYourPasswordSubTitle, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center),
            const SizedBox(height:  MSizes.spaceBtwSections,),

            /// Buttons
            SizedBox(width: double.infinity, child: ElevatedButton(onPressed:  (){}, child: const Text(MyTexts.done)),),
            const SizedBox(height:  MSizes.spaceBtwSections,),
            SizedBox(width: double.infinity, child: ElevatedButton(onPressed:  (){}, child: const Text(MyTexts.resendEmail)),),
          ],
        ),
        ),
      ),
    );
  }
}
