import 'package:bodyandbeauty/features/personalization/screens/settings/settings.dart';
import 'package:bodyandbeauty/features/shop/screens/WishList/wishlist.dart';
import 'package:bodyandbeauty/features/shop/screens/home/widgets/home.dart';
import 'package:bodyandbeauty/features/shop/screens/skin_care_schedule/skin_care_schedule.dart';
import 'package:bodyandbeauty/features/shop/screens/store/store.dart';
import 'package:bodyandbeauty/utils/constants/colors.dart';
import 'package:bodyandbeauty/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final darkMode = MyHelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: Obx(
          () => NavigationBar(
        
          height: 80,
            elevation: 0,
            selectedIndex: controller.selectedIndex.value,
            onDestinationSelected: (index) => controller.selectedIndex.value = index,
            backgroundColor:  darkMode ? MyColors.black : MyColors.white,
            indicatorColor: darkMode ? MyColors.white.withOpacity(0.1) : MyColors.black.withOpacity(0.1),
        
            destinations: const [
              NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
              NavigationDestination(icon: Icon(Iconsax.shop), label: 'Store'),
              NavigationDestination(icon: Icon(Iconsax.like), label: 'Routine'),
              NavigationDestination(icon: Icon(Iconsax.heart), label: 'Wishlist'),
              NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),

            ]),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}


class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screens = const [HomeScreen(),StoreScreen(),SkinCareSchedule(),FavouriteScreen(),SettingsScreen()];
}