import 'package:bodyandbeauty/common/widgets/Image/circular_image.dart';
import 'package:bodyandbeauty/common/widgets/appBar/appbar.dart';
import 'package:bodyandbeauty/common/widgets/texts/Section_heading.dart';
import 'package:bodyandbeauty/utils/constants/image_strings.dart';
import 'package:bodyandbeauty/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import 'widget/Profile_menu.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(
        showBackArrow: true,
        title: Text('Profile'),
      ),
      /// body
      body:  SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(MSizes.defaultSpace),
          child: Column(
            children: [
            /// profile picture
            SizedBox(width: double.infinity,
            child: Column(
            children: [
              MyCircularImage(image: MyImages.user,width: 80,height: 80,),
              TextButton(onPressed: () {}, child: const Text('Change Profile Picture'))

            ],
            ),
            ),

              const SizedBox(height: MSizes.spaceBtwItems/2,),
              const Divider(),
              const SizedBox(height: MSizes.spaceBtwItems,),
              const MySectionHeading(title: 'Profile Information', showActionButton:  false,),
              const SizedBox(height: MSizes.spaceBtwItems,),

              MyProfileMenu(title: 'Name',value: 'Gourav',onPressed: () {},),

              MyProfileMenu(title: 'Username', value: 'aditya23', onPressed: () {}),
              const SizedBox (height: MSizes.spaceBtwItems),
              const Divider(),
              const SizedBox (height: MSizes.spaceBtwItems),
              /// Heading Personal Info
              const MySectionHeading (title: 'Personal Information', showActionButton: false),
              const SizedBox (height: MSizes.spaceBtwItems),
              MyProfileMenu(title: 'User ID', value: '45689', onPressed: () {}),
              MyProfileMenu(title: 'E-mail', value: 'coding_with_t', onPressed: () {}),
              MyProfileMenu(title: 'Phone Number', value: '+92-317-8059528', onPressed: () {}),
                  MyProfileMenu(title: 'Gender', value: 'Male', onPressed: () {}),
              MyProfileMenu(title: 'Date of Birth', value: '10 Oct, 1994', onPressed: () {}),
              Divider(),
              SizedBox(height: MSizes.spaceBtwItems,),

              Center(
                child: TextButton(
                    onPressed: () {},
                    child: const Text('Close Account' , style: TextStyle(color: Colors.red))),
              )
  ],
          ),

        ),
      ),

    );
  }
}

