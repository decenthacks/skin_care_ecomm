import 'package:bodyandbeauty/common/widgets/Brand%20Cards/brand_cards.dart';
import 'package:bodyandbeauty/common/widgets/appBar/appbar.dart';
import 'package:bodyandbeauty/common/widgets/layouts/grid_layout.dart';
import 'package:bodyandbeauty/common/widgets/texts/Section_heading.dart';
import 'package:bodyandbeauty/features/shop/screens/Brands/brand.dart';
import 'package:bodyandbeauty/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllBrand extends StatelessWidget {
  const AllBrand({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(title: Text('Brand'),showBackArrow: true,),
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(MSizes.defaultSpace),
        child: Column(
          children: [
            /// Heading
            MySectionHeading(title: 'Brand'),
            SizedBox(height: MSizes.spaceBtwItems,),

            //// Brand

            MyGridLayout(itemCount: 10,mainAxisExtent: 80, itemBuilder: (context,index) => MyBrandCard(
              showBorder: true,onTap: () => Get.to(() => BrandProducts()),))
          ],
        ),),
      ),
    );
  }
}
