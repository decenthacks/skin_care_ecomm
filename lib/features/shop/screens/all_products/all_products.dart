import 'package:bodyandbeauty/common/widgets/appBar/appbar.dart';
import 'package:bodyandbeauty/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/products.cart/sortable/sortable_products.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppbar(
        title: Text('Popular Products'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(MSizes.defaultSpace),
        child: MySortableProducts(),
      ),
    );
  }
}

