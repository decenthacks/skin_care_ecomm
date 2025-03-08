import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';

class ProductCategoriesTitle extends StatelessWidget {
  const ProductCategoriesTitle({super.key, this.onPressed, required this.title,});


  final String title;
  final void Function()? onPressed;



  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: Theme.of(context).textTheme.headlineSmall!.apply(color: MyColors.white),),


      ],
    );
  }
}
