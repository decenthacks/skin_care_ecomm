import 'package:bodyandbeauty/common/widgets/Image/circular_image.dart';
import 'package:bodyandbeauty/common/widgets/appBar/appbar.dart';
import 'package:bodyandbeauty/common/widgets/texts/Section_heading.dart';
import 'package:bodyandbeauty/utils/constants/image_strings.dart';
import 'package:bodyandbeauty/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controllers/user_controller.dart';
import 'change_name.dart';
import 'widget/Profile_menu.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
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
              Obx(() {
                final networkImage = controller.user.value.profilePicture;
                final image = networkImage.isNotEmpty ? networkImage : MyImages.user;
                 return MyCircularImage(image: image ,width: 80,height: 80,isNetworkImage: networkImage.isNotEmpty,);
              } ),
              TextButton(onPressed: () => controller.uploadUserProfilePicture(), child: const Text('Change Profile Picture'))

            ],
            ),
            ),

              const SizedBox(height: MSizes.spaceBtwItems/2,),
              const Divider(),
              const SizedBox(height: MSizes.spaceBtwItems,),
              const MySectionHeading(title: 'Profile Information', showActionButton:  false,),
              const SizedBox(height: MSizes.spaceBtwItems,),

              MyProfileMenu(title: 'Name',value: controller.user.value.fullname,onPressed: () => Get.to(() => const ChangeName()),),

              MyProfileMenu(title: 'Username', value: controller.user.value.username, onPressed: () {}),
              const SizedBox (height: MSizes.spaceBtwItems),
              const Divider(),
              const SizedBox (height: MSizes.spaceBtwItems),
              /// Heading Personal Info
              const MySectionHeading (title: 'Personal Information', showActionButton: false),
              const SizedBox (height: MSizes.spaceBtwItems),
              MyProfileMenu(title: 'User ID', value: controller.user.value.id, onPressed: () {}),
              MyProfileMenu(title: 'E-mail', value: controller.user.value.email, onPressed: () {}),
              MyProfileMenu(title: 'Phone Number', value: controller.user.value.phoneNumber, onPressed: () {}),
              MyProfileMenu(title: 'Gender', value: 'Male', onPressed: () {}),
              MyProfileMenu(title: 'Date of Birth', value: '10 Oct, 1994', onPressed: () {}),
              Divider(),
              SizedBox(height: MSizes.spaceBtwItems,),

              Center(
                child: TextButton(
                    onPressed: () => controller.deleteAccountWarningPopup(),
                    child: const Text('Close Account' , style: TextStyle(color: Colors.red))),
              )
  ],
          ),

        ),
      ),

    );
  }
}

