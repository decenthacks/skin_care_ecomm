import 'package:bodyandbeauty/common/widgets/products.cart/product_cards/product_cards_vertical.dart';
import 'package:bodyandbeauty/common/widgets/texts/product_categories_title.dart';
import 'package:bodyandbeauty/features/shop/screens/all_products/all_products.dart';
import 'package:bodyandbeauty/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:bodyandbeauty/utils/constants/colors.dart';
import 'package:bodyandbeauty/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import 'home_Categories.dart';
import 'home_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = MyHelperFunctions.isDarkMode(context);
    return Scaffold(
      backgroundColor:  dark? MyColors.dark : MyColors.light,
      body: SingleChildScrollView(
        child: Column(
          children: [
            MyPrimaryHeaderContainer(
              child: Column(
                children: [
                  // Appbar
                  const MyHomeAppBar(),
                  const SizedBox(height: MSizes.spaceBtwSections,),

                  // searchbar
                  const MySearchContainer( text: ' Search in store' ),
                  const SizedBox(height: MSizes.spaceBtwSections,),

                  // Categories
                  Padding(padding: const EdgeInsets.only(left: MSizes.defaultSpace),
                  child: Column(
                    children: [

                      /// heading
                      ProductCategoriesTitle(title: 'Product Categories',onPressed: () {}),
                      const SizedBox(height: MSizes.spaceBtwItems,),

                      // Categories
                      const MyHomeCategories()
                    ],
                  ),
                  ),
                  const SizedBox( height: MSizes.spaceBtwSections,),
                ],
              )
            ),
            //// body
            Padding(
              padding: const EdgeInsets.all(MSizes.defaultSpace),
              child: Column(
                children: [

                  // promo Slider
                  const MyPromoSlider(banners: [MyImages.promoBanner2 , MyImages.promoBanner2 , MyImages.promoBanner3],),
                  const SizedBox(height: MSizes.spaceBtwSections),
                  
                  // heading
                  MySectionHeading(title: 'Popular Products', onPressed: () => Get.to(() => AllProducts() )),
                  const SizedBox(height: MSizes.spaceBtwSections),


                  // Popular Products
                  MyGridLayout(itemCount: 2,itemBuilder: (_, index) => const MyProductCardVertical(),),



                ],
              )
            ),

          ],
        ),
      ),
    );
  }
}






