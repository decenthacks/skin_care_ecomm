import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/validators/validation.dart';
import '../../../personalization/controllers/user_controller.dart';

class ReAuthLoginForm extends StatelessWidget {
  const ReAuthLoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: AppBar(title: const Text('Re-Authenticate User')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(MSizes.defaultSpace),
          child: Form(
              key: controller.reAuthFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                /// Email
                TextFormField(
                controller: controller.verifyEmail,
                validator: MyValidator.validateEmail,
                decoration: const InputDecoration (
                    prefixIcon: Icon(Iconsax.direct_right),
                    labelText: MyTexts.email),
              ), // TextFormField
              const SizedBox(height: MSizes.spaceBtwInputFields),


              /// Password
              Obx(
                    () =>
                    TextFormField(
                      obscureText: controller.hidePassword.value,
                      controller: controller.verifyPassword,
                      validator: (value) => MyValidator.validateEmptyText('Password', value),
                      decoration: InputDecoration(
                        labelText: MyTexts.password,
                        prefixIcon: const Icon(Iconsax.password_check),
                        suffixIcon: IconButton(
                          onPressed: () => controller.hidePassword.value = !controller.hidePassword.value,
                          icon: const Icon(Iconsax.eye_slash),
                        ),
                      ),
                    ),
                  ),
              const SizedBox(height: MSizes.spaceBtwSections),

              /// LOGIN Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(onPressed: () => controller.reAuthenticateEmailAndPasswordUser(), child: const Text('Verify')),
                 )
               ],
              )
            ),
          ),
        ),
     );
   }
  }