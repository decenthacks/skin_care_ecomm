import 'package:bodyandbeauty/common/widgets/appBar/appbar.dart';
import 'package:bodyandbeauty/utils/constants/sizes.dart';
import 'package:bodyandbeauty/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';

class AddNewAddress extends StatelessWidget {
  const AddNewAddress({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = MyHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar:  MyAppbar(showBackArrow: true,title:  Text('Add new address',style: Theme.of(context).textTheme.headlineSmall,),
      ),
      body: SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.all(MSizes.defaultSpace),
          child: Form(
            child: Column(
              children: [
                TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.user),labelText: 'Name')),
                const SizedBox(height: MSizes.spaceBtwInputFields,),
                TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.mobile),labelText: 'Phone Number')),
                const SizedBox(height: MSizes.spaceBtwInputFields,),
                Row(
                  children: [
                    Expanded(child:  TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.building_31),labelText: 'Street'))),
                    const SizedBox(width: MSizes.spaceBtwInputFields,),
                    Expanded(child:  TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.code),labelText: 'Pin Code'))),
                  ],
                ),
                const SizedBox(height: MSizes.spaceBtwInputFields,),
                Row(
                  children: [
                    Expanded(child:  TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.building),labelText: 'City'))),
                    const SizedBox(width: MSizes.spaceBtwInputFields,),
                    Expanded(child:  TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.activity),labelText: 'State'))),
                  ],
                ),
                const SizedBox(height: MSizes.spaceBtwInputFields,),
                TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.buildings_2),labelText: 'Landmark'),),
                const SizedBox(height: MSizes.spaceBtwInputFields,),
                TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.global),labelText: 'Country'),),
                const SizedBox(height: MSizes.defaultSpace,),
                SizedBox(width: double.infinity,child: ElevatedButton(onPressed: () {}, style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(MSizes.md),
                    backgroundColor: dark?  MyColors.darkgrey: MyColors.grey,
                    side: const BorderSide(color:  MyColors.black)),
                    child: Text('Save',style: Theme.of(context).textTheme.bodyMedium,)
                ),
                ),
            ]),
          ),
        ),
      ),
    );
  }
}
