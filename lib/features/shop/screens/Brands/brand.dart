import 'package:bodyandbeauty/common/widgets/Brand%20Cards/brand_cards.dart';
import 'package:bodyandbeauty/common/widgets/appBar/appbar.dart';
import 'package:bodyandbeauty/common/widgets/products.cart/sortable/sortable_products.dart';
import 'package:bodyandbeauty/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(title: Text('Brand Name')),
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(MSizes.defaultSpace),
        child: Column(
          children: [
            // Brand Details
            MyBrandCard(showBorder: true),
            SizedBox(height: MSizes.spaceBtwSections),

            MySortableProducts(),
          ],
        ),),
      ),
    );
  }
}
