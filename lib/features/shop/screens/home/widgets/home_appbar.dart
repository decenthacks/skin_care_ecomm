import 'package:bodyandbeauty/features/personalization/controllers/user_controller.dart';
import 'package:bodyandbeauty/features/shop/screens/cart/widgets/cart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/appBar/appbar.dart';
import '../../../../../common/widgets/products.cart/cart/cart_menu_icon.dart';
import '../../../../../loader/shimmer_loader.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/text_strings.dart';


class MyHomeAppBar extends StatelessWidget {
  const MyHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return MyAppbar(title: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(MyTexts.homeAppbarTitle, style: Theme.of(context).textTheme.labelMedium!.apply(color: MyColors.grey)),
        Obx(() {

          if(controller.profileLoading.value) {
            //Display a shimmer loader while user profile being loaded
            return const MyShimmerEffect(width: 80, height: 15,);
          } else{
            return Text(controller.user.value.fullname, style: Theme.of(context).textTheme.headlineSmall!.apply(color: MyColors.white));
          }
        }),
      ],
    ),
      actions: [
        MyCartCounterIcon(onPressed: () => Get.to(() => const CartScreen()), iconColor: MyColors.white,)
      ],
    );
  }
}


