import 'package:bodyandbeauty/common/widgets/Calender/streakScreen.dart';
import 'package:bodyandbeauty/features/authentication/screens/signup/verify_emails.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/appBar/appbar.dart';
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
      body:  VerifyEmailScreen(),

    );
  }
}
