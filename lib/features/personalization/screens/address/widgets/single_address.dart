// ignore_for_file: deprecated_member_use

import 'package:bodyandbeauty/utils/constants/colors.dart';
import 'package:bodyandbeauty/utils/constants/sizes.dart';
import 'package:bodyandbeauty/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';

class SingleAddress extends StatelessWidget {
  const SingleAddress({super.key, required this.selectedAddress});

final bool selectedAddress;

  @override
  Widget build(BuildContext context) {
    final dark = MyHelperFunctions.isDarkMode(context);
    return  MyRoundedContainer(
      padding: EdgeInsets.all(MSizes.md),
        width: double.infinity,
        showBorder: true,
      backgroundColor: selectedAddress ?  MyColors.primary.withOpacity(0.5): Colors.transparent,
      borderColor: selectedAddress ? Colors.transparent : dark ? MyColors.darkerGrey :MyColors.grey,
      margin: EdgeInsets.only(bottom: MSizes.spaceBtwItems),
      child: Stack(
        children: [
          Positioned(
            right: 5,
            top: 0,
            child: Icon(selectedAddress? Iconsax.tick_circle5: null,
              color: selectedAddress ?
              dark? MyColors.light : MyColors.dark.withOpacity(0.6) : null,),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('John joe',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleLarge,),
              const SizedBox(height: MSizes.sm / 2 ,),
              Text('9827162579', maxLines: 1, overflow: TextOverflow.ellipsis),
              const SizedBox(height: MSizes.sm / 2 ,),
              Text('Address of  user having pincode and other info', softWrap: true,),

            ],
          )
        ],
      ),

    );
  }
}
