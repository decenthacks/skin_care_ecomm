import 'package:bodyandbeauty/common/widgets/Image/rounded_image.dart';
import 'package:bodyandbeauty/features/shop/controllers/Home_Controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../common/widgets/custom_shapes/containers/circular_container.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class MyPromoSlider extends StatelessWidget {
  const MyPromoSlider({super.key, required this.banners});

  final List<String> banners;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

    return Column(
      children: [
        // ✅ Wrap in a fixed height container to prevent overflow
        SizedBox(
          height: 200, // Adjust as needed
          child: CarouselSlider(
            options: CarouselOptions(
              height: 200, // Must match parent `SizedBox`
              viewportFraction: 0.9,
              enlargeCenterPage: true,
              onPageChanged: (index, _) => controller.updatePageIndicator(index),
            ),
            items: banners.map((url) => MyRoundedImage(fit: BoxFit.cover,applyImageRadius:true,imageUrl: url)).toList()
          ),
        ),
        const SizedBox(height: MSizes.spaceBtwItems),
        Center(
          child: Obx(
                () => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (int i = 0; i < banners.length; i++)
                  Container(
                    margin: const EdgeInsets.only(right: 10.0),
                    child: MyCircularContainer(
                      width: 20,
                      height: 4,
                      backgroundColor: controller.carouselCurrentIndex.value == i
                          ? MyColors.primary
                          : MyColors.grey,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
