import 'package:bodyandbeauty/features/shop/screens/sub_category/sub_categories.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/common.widget.image_text_widget/vertical_image_text.dart';
import '../../../../../utils/constants/image_strings.dart';

class MyHomeCategories extends StatelessWidget {
  const MyHomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80 ,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 6,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index){
          return MyVerticalImageTexts(image: MyImages.shoeIcon, title: 'shoes', onTap: () => Get.to(() => SubCategoriesScreen()),);
        },
      ),
    );
  }
}

