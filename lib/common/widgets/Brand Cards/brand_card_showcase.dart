import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../custom_shapes/containers/rounded_container.dart';
import 'brand_cards.dart';

class MyBrandShowCase extends StatelessWidget {
  const MyBrandShowCase({
    super.key,
    required this.image,
  });

  final List<String> image;

  @override
  Widget build(BuildContext context) {
    return MyRoundedContainer(
      showBorder: true,
      borderColor: MyColors.darkgrey,
      padding: const EdgeInsets.all(MSizes.md),
      backgroundColor: Colors.transparent,
      margin: const EdgeInsets.only(bottom: MSizes.spaceBtwItems),
      child: Column(
        children: [
          ///Brand with Product count
          const MyBrandCard(showBorder: false),
          const SizedBox( height:  MSizes.spaceBtwItems,),

          /// Brand with Top 3 Product Image
          Row(
            children: image
                .map((image) => brandTopProductImageWidget(image, context))
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget brandTopProductImageWidget(String image, context) {
    return Expanded(
      child: MyRoundedContainer(
        height: 100,
        backgroundColor: MyHelperFunctions.isDarkMode(context)
            ? MyColors.darkerGrey
            : MyColors.light,
        margin: const EdgeInsets.only(right: MSizes.sm),
        padding: const EdgeInsets.all(MSizes.md),
        child: Image(
          fit: BoxFit.contain,
          image: AssetImage(image),
        ),
      ),
    );
  }
}
