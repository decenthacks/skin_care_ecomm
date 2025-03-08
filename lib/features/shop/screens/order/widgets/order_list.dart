import 'package:bodyandbeauty/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:bodyandbeauty/utils/constants/colors.dart';
import 'package:bodyandbeauty/utils/constants/sizes.dart';
import 'package:bodyandbeauty/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
class MyOrderList extends StatelessWidget {
  const MyOrderList({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = MyHelperFunctions.isDarkMode(context);
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 10,
      separatorBuilder: (_, index)=> const SizedBox(height: MSizes.spaceBtwItems,),
      itemBuilder: (_, index) => MyRoundedContainer(
        showBorder: true,
        padding: const EdgeInsets.all(MSizes.md),
        backgroundColor: dark? MyColors.dark : MyColors.light,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Row 1
            Row(
              children: [
                /// 1 Icon
                const Icon(Iconsax.ship),
                const SizedBox(width: MSizes.spaceBtwItems/2,),
                /// 2 Status and Date
                Expanded(
                   child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Processing',
                      style: Theme.of(context).textTheme.bodyLarge!.apply(color: MyColors.primary,fontWeightDelta: 1),
                      ),
                      Text('07 Apr 2025', style: Theme.of(context).textTheme.headlineSmall,)
                    ],
                  ),
                ),
      
                IconButton(onPressed: () {}, icon: const Icon(Iconsax.arrow_right_34,size: MSizes.iconSm,))
              ],
            ),
            const SizedBox(height: MSizes.spaceBtwItems),
            // Row 2
            Row(
             children: [
               Expanded(
                  child: Row(
                   children: [
                     /// 1 Icon
                     const Icon(Iconsax.tag),
                     const SizedBox(width: MSizes.spaceBtwItems/2,),

                     /// 2 Status and Date
                     Expanded(
                       child: Column(
                         mainAxisSize: MainAxisSize.min,
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Text('Order', style: Theme.of(context).textTheme.labelMedium,),
                           Text('[#166131]', style: Theme.of(context).textTheme.titleMedium,)
                         ],
                       ),
                     ),
                   ],
                 ),
               ),
               Expanded(
                  child: Row(
                   children: [
                     /// 1 Icon
                     const Icon(Iconsax.calendar),
                     const SizedBox(width: MSizes.spaceBtwItems/2,),
      
                     /// 2 Status and Date
                     Expanded(
                       child: Column(
                         mainAxisSize: MainAxisSize.min,
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Text('Shipping date', style: Theme.of(context).textTheme.labelMedium,),
                           Text('08 Apr 2025', style: Theme.of(context).textTheme.titleMedium,)
                         ],
                       ),
                     ),
                   ],
                 ),
               ),
             ],
            ),
          ],
        ),
      ),
    );
  }
}
