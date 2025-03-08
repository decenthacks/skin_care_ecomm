import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';

class MyVerticalImageTexts extends StatelessWidget {
  const MyVerticalImageTexts({
    super.key,
    required this.image,
    required this.title,
    this.textColor = MyColors.white,
    this.backgroundColor ,
    this.onTap,
  });

  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = MyHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: MSizes.spaceBtwItems),
        child: Column(
          mainAxisSize: MainAxisSize.min, // ✅ Prevents unnecessary expansion
          children: [
            Container(
              width: 54,
              height: 54,
              padding: const EdgeInsets.all(MSizes.sm),
              decoration: BoxDecoration(
                color: backgroundColor ?? (isDarkMode ? MyColors.black : MyColors.white),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child: Image.asset(
                  image,
                  fit: BoxFit.contain, // ✅ Prevents overflow inside container
                ),
              ),
            ),
            const SizedBox(height: MSizes.spaceBtwItems / 2),
            SizedBox(
              width: 55,
              child: Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .apply(color: textColor),
                maxLines: 1,
                softWrap: false, // ✅ Avoids unwanted wrapping
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ),
    );
  }
}

