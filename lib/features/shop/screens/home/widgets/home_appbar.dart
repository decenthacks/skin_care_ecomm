import 'package:bodyandbeauty/features/shop/screens/cart/widgets/cart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/appBar/appbar.dart';
import '../../../../../common/widgets/products.cart/cart/cart_menu_icon.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/text_strings.dart';


class MyHomeAppBar extends StatelessWidget {
  const MyHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MyAppbar(title: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(MyTexts.homeAppbarTitle, style: Theme.of(context).textTheme.labelMedium!.apply(color: MyColors.grey)),
        Text(MyTexts.homeAppbarSubTitle, style: Theme.of(context).textTheme.headlineSmall!.apply(color: MyColors.white)),
      ],
    ),
      actions: [
        MyCartCounterIcon(onPressed: () => Get.to(() => const CartScreen()), iconColor: MyColors.white,)
      ],
    );
  }
}


