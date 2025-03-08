import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/Image/rounded_image.dart';
import '../../../../../common/widgets/appBar/appbar.dart';
import '../../../../../common/widgets/custom_shapes/curved_edges/curved_edge_widgit.dart';
import '../../../../../common/widgets/icons/my_circular_icon.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class MyProductImageSlider extends StatelessWidget {
  const MyProductImageSlider({
    super.key,
  });



  @override
  Widget build(BuildContext context) {
    final dark = MyHelperFunctions.isDarkMode(context);
    return MyCurvedEdgesWidgets(
      child: Container(
        color: dark ? MyColors.darkerGrey : MyColors.light,
        child: Stack(
          children: [
            //// mainn large image

            SizedBox(
              height: 400,
              child: Padding(
                padding: EdgeInsets.all(MSizes.productImageRadius * 2),
                child: Center(
                  child: Image(
                    image: AssetImage(MyImages.productImage1),
                  ),
                ),
              ),
            ),
            /////// image Slider

            Positioned(
              right: 0,
              bottom: 30,
              left: MSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  separatorBuilder: (_, __) => const SizedBox(
                    width: MSizes.spaceBtwItems,
                  ),
                  itemCount: 8,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: AlwaysScrollableScrollPhysics(),
                  itemBuilder: (_, index) => MyRoundedImage(
                      width: 80,
                      backgroundColor:
                      dark ? MyColors.dark : MyColors.white,
                      border: Border.all(color: MyColors.primary),
                      padding: EdgeInsets.all(MSizes.sm),
                      imageUrl: MyImages.productImage3),
                ),
              ),
            ),

            MyAppbar(
              showBackArrow: true,
              actions: [MyCircularIcon(icon: Iconsax.heart5, color: Colors.red,)],
            )
          ],
        ),
      ),
    );
  }
}