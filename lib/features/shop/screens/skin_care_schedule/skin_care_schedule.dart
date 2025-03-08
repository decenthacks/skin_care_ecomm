import 'package:bodyandbeauty/common/widgets/Calender/streakScreen.dart';
import 'package:bodyandbeauty/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:bodyandbeauty/features/authentication/screens/signup/verify_emails.dart';
import 'package:bodyandbeauty/features/shop/screens/product_details/widgets/product_details.dart';
import 'package:bodyandbeauty/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/appBar/appbar.dart';
import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/helpers/helper_functions.dart';

class SkinCareSchedule extends StatelessWidget {
  const SkinCareSchedule({super.key});


  @override
  Widget build(BuildContext context) {
    final dark = MyHelperFunctions.isDarkMode(context);
    return Scaffold(
        backgroundColor: dark ? MyColors.dark : MyColors.light,
        appBar: MyAppbar(
        title: Text(
        'Skin care',
        style: Theme.of(context).textTheme.headlineMedium,
    ),
          actions: [
            CalenderSreakScreen(
              onPressed: () {},
            ),
          ],

    ),
      body:  VerifyEmailsScreen(userEmail: 'user email'),

    );
  }
}
