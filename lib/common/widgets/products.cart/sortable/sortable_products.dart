import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/sizes.dart';
import '../../layouts/grid_layout.dart';
import '../product_cards/product_cards_vertical.dart';

class MySortableProducts extends StatelessWidget {
  const MySortableProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButtonFormField(
          decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          onChanged: (value) {},
          items: [
            'Name',
            'Higher Price',
            'Lower Price',
            'Sale',
            'Newset',
            'Popular'
          ].map((option) => DropdownMenuItem(value:option,child: Text(option))).toList(),
        ),
        SizedBox(height: MSizes.spaceBtwSections,),

        ///Products
        MyGridLayout(itemCount: 10, itemBuilder: (_, index)=> MyProductCardVertical())
      ],
    );
  }
}
