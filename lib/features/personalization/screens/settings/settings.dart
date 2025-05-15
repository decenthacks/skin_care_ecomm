import 'package:bodyandbeauty/common/widgets/appBar/appbar.dart';
import 'package:bodyandbeauty/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:bodyandbeauty/common/widgets/list%20tile/settings_menu_tile.dart';
import 'package:bodyandbeauty/common/widgets/texts/Section_heading.dart';
import 'package:bodyandbeauty/features/authentication/screens/login/login.dart';
import 'package:bodyandbeauty/features/personalization/screens/address/Address.dart';
import 'package:bodyandbeauty/features/personalization/screens/profile/profile.dart';
import 'package:bodyandbeauty/features/shop/screens/order/order.dart';
import 'package:bodyandbeauty/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/list tile/user_profile_tile.dart';
import '../../../../utils/constants/colors.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// header
            MyPrimaryHeaderContainer(
              child: Column(
                children: [
                  /// Appbar
                  MyAppbar(
                      title: Text('Account',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .apply(color: MyColors.white))),

                  /// UserProfile
                  MyUserProfileTile(
                    onPressed: () => Get.to(() => const ProfileScreen()),
                  ),
                  const SizedBox(
                    height: MSizes.spaceBtwSections,
                  )
                ],
              ),
            ),

            /// body
            Padding(
              padding: EdgeInsets.all(MSizes.defaultSpace),
              child: Column(
                children: [
                  /// Account Settings
                  const MySectionHeading(
                    title: 'Account Settings',
                    showActionButton: false,
                  ),
                  const SizedBox(
                    height: MSizes.spaceBtwItems,
                  ),

                  MySettingsMenuTile(
                    icon: Iconsax.safe_home,
                    title: 'My Address',
                    subTitle: 'Set shopping delivery address',
                    onTap: () => Get.to(() => UserAddressScreen()),
                  ),
                  const MySettingsMenuTile(
                      icon: Iconsax.shopping_cart,
                      title: 'My Cart',
                      subTitle: 'Add, remove products and move to checkout'),
                  MySettingsMenuTile(
                      icon: Iconsax.bag_tick,
                      title: 'My Orders',
                      subTitle: ' In-progress and Completed Orders',
                      onTap: () => Get.to(() => OrderScreen())),
                  const MySettingsMenuTile(
                      icon: Iconsax.bank,
                      title: 'Bank Account',
                      subTitle: 'Withdraw balance to registered bank account'),
                  const MySettingsMenuTile(
                      icon: Iconsax.discount_shape,
                      title: 'My Coupons',
                      subTitle: 'List of all the discounted coupons'),
                  const MySettingsMenuTile(
                      icon: Iconsax.notification,
                      title: 'Notifications',
                      subTitle: 'Set any kind of notification message'),
                  const MySettingsMenuTile(
                      icon: Iconsax.security_card,
                      title: 'Account Privacy',
                      subTitle: 'Manage data usage and connected accounts'),

                  /// App Settings
                  const SizedBox(height: MSizes.spaceBtwSections),
                  const MySectionHeading(
                      title: 'App Settings', showActionButton: false),
                  const SizedBox(height: MSizes.spaceBtwItems),
                  const MySettingsMenuTile(
                      icon: Iconsax.document_upload,
                      title: 'Load Data',
                      subTitle: ' Upload Data to your Cloud Firebase'),
                  MySettingsMenuTile(
                    icon: Iconsax.location,
                    title: 'Geolocation',
                    subTitle: 'Set recommendation based on location',
                    trailing: Switch(value: true, onChanged: (value) {}),
                  ),
                  // TSettingsMenuTile
                  MySettingsMenuTile(
                    icon: Iconsax.security_user,
                    title: 'Safe Mode',
                    subTitle: 'Search result is safe for all ages',
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),
                  // TSettingsMenuTile
                  MySettingsMenuTile(
                    icon: Iconsax.image,
                    title: 'HD Image Quality',
                    subTitle: 'Set image quality to be seen',
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),
                  //
                  const SizedBox(height: MSizes.spaceBtwSections),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                        onPressed: () => Get.to(() => LoginScreen()), child: const Text('Logout')),
                  ),
                  const SizedBox(height: MSizes.spaceBtwSections * 2.5)
                  // TSettingsMenuTile
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
