import 'package:bodyandbeauty/common/widgets/appBar/appbar.dart';
import 'package:bodyandbeauty/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:bodyandbeauty/common/widgets/success_screen/success_screen.dart';
import 'package:bodyandbeauty/features/shop/screens/CheckOut/widgets/billing_amount_section.dart';
import 'package:bodyandbeauty/features/shop/screens/CheckOut/widgets/billing_payment_section.dart';
import 'package:bodyandbeauty/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:bodyandbeauty/navigation_menu.dart';
import 'package:bodyandbeauty/utils/constants/colors.dart';
import 'package:bodyandbeauty/utils/constants/image_strings.dart';
import 'package:bodyandbeauty/utils/constants/sizes.dart';
import 'package:bodyandbeauty/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/products.cart/cart/coupon.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = MyHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: MyAppbar(
        title: Text(
          'Order Review',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(MSizes.defaultSpace),
          child: Column(
            children: [
              /// --- Items In Cart
              const MyCartItems(
                showAddRemoveButton: false,
              ),
              const SizedBox(height: MSizes.spaceBtwSections,),

              ///Coupons Text Field
              const MyCouponCode(),
              const SizedBox(height: MSizes.spaceBtwSections,),

              /// Billing Section
              MyRoundedContainer(
                showBorder: true,
                padding: const EdgeInsets.all(MSizes.md),
                backgroundColor: dark ?  MyColors.black : MyColors.white,
                child: const Column(
                  children: [
                    ///pricing
                    MyBillingAmountSection(),
                    SizedBox(height: MSizes.spaceBtwItems,),
                    ///Divider
                    Divider(),
                    SizedBox(height: MSizes.spaceBtwItems,),

                    ///Payment method
                    MyBillingPaymentSection(),
                    SizedBox(height: MSizes.spaceBtwItems,),

                    ///Address
                    MyBillingAmountSection(),
                    SizedBox(height: MSizes.spaceBtwItems,),

                  ],
                ),

              )
            ],
          ),
        ),
      ),
      bottomNavigationBar:
      Padding(
        padding: const EdgeInsets.all(MSizes.defaultSpace),
        child: ElevatedButton(onPressed: () => Get.to(() =>
            SuccessScreen(
              image: MyImages.user ,
              title: 'Payment Success!',
              subTitle: 'Your item will be shipped soon!',
              onPressed: () => Get.to(() => const NavigationMenu()),


        )), style: ElevatedButton.styleFrom(
            backgroundColor: dark?  MyColors.darkgrey: MyColors.grey,
            side: const BorderSide(color:  MyColors.black)),
            child: Text('CheckOut \$ 256.0',style: Theme.of(context).textTheme.bodyMedium,)
        ),
      ),
    );
  }
}

