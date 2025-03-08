import 'package:bodyandbeauty/common/widgets/appBar/appbar.dart';
import 'package:bodyandbeauty/common/widgets/appBar/tab_bar.dart';
import 'package:bodyandbeauty/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:bodyandbeauty/common/widgets/layouts/grid_layout.dart';
import 'package:bodyandbeauty/common/widgets/products.cart/cart/cart_menu_icon.dart';
import 'package:bodyandbeauty/common/widgets/texts/Section_heading.dart';
import 'package:bodyandbeauty/features/shop/screens/Brands/all_brand.dart';
import 'package:bodyandbeauty/features/shop/screens/store/widgets/category_tab.dart';
import 'package:bodyandbeauty/utils/constants/colors.dart';
import 'package:bodyandbeauty/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/Brand Cards/brand_cards.dart';
import '../../../../utils/helpers/helper_functions.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = MyHelperFunctions.isDarkMode(context);
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: dark ? MyColors.dark : MyColors.light,
        appBar: MyAppbar(
          title: Text(
            'Store',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [
            MyCartCounterIcon(
              onPressed: () {},
            ),
          ],
        ),
        body: NestedScrollView(
            headerSliverBuilder: (_, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  pinned: true,
                  floating: true,
                  backgroundColor: MyHelperFunctions.isDarkMode(context)
                      ? MyColors.black
                      : MyColors.white,
                  expandedHeight: 440,
                  flexibleSpace: Padding(
                    padding: const EdgeInsets.all(MSizes.defaultSpace),
                    child: ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        /// Search bar
                        const SizedBox(
                          height: MSizes.spaceBtwItems,
                        ),
                        const MySearchContainer(
                          text: 'Search in Store',
                          showBorder: true,
                          showBackground: false,
                          padding: EdgeInsets.zero,
                        ),
                        const SizedBox(
                          height: MSizes.spaceBtwSections,
                        ),

                        /// Featured brands
                        MySectionHeading(
                          title: 'Featured Brands',
                          showActionButton: true,
                          onPressed: () => Get.to(() => AllBrand()),
                        ),
                        const SizedBox(
                          height: MSizes.spaceBtwItems / 1.5,
                        ),

                        /// Brand Grid
                        MyGridLayout(
                            itemCount: 4,
                            mainAxisExtent: 80,
                            itemBuilder: (_, index) {
                              return const MyBrandCard(
                                showBorder: true,
                              );
                            }),
                      ],
                    ),
                  ),
                  //// Tabs

                  bottom: const MyTabBar(
                    tabs: [
                      Tab(child: Text('Cleanser')),
                      Tab(child: Text('Moisturizer')),
                      Tab(child: Text('Serums')),
                      Tab(child: Text('Toner')),
                      Tab(child: Text('Sunscreen'))
                    ],
                  ),
                ),
              ];
            },
            body: const TabBarView(children: [
              MyCategoryTab(),
              MyCategoryTab(),
              MyCategoryTab(),
              MyCategoryTab(),
              MyCategoryTab(),
            ])),
      ),
    );
  }
}
