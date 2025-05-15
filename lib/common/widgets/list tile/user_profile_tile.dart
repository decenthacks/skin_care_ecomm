import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../features/personalization/controllers/user_controller.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../Image/circular_image.dart';

class MyUserProfileTile extends StatelessWidget {
  const MyUserProfileTile({
    super.key, this.onPressed,
  });
  final void Function()? onPressed;


  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return ListTile(
      leading: const MyCircularImage(image: MyImages.user,width: 50,height: 50,padding: 0,),
      title: Text(controller.user.value.fullname, style:  Theme.of(context).textTheme.headlineSmall!.apply(color: MyColors.white)),
      subtitle: Text(controller.user.value.email, style:  Theme.of(context).textTheme.bodyMedium!.apply(color: MyColors.white)),
      trailing: IconButton(onPressed: onPressed, icon: const Icon(Iconsax.edit,color: MyColors.white,)),

    );
  }
}
