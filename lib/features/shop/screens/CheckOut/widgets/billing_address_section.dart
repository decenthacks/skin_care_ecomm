import 'package:flutter/material.dart';

import '../../../../../common/widgets/texts/Section_heading.dart';
import '../../../../../utils/constants/sizes.dart';

class MyBillingAddressSection extends StatelessWidget {
  const MyBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MySectionHeading(title: 'Shipping Address' , buttonTitle: 'Change',onPressed: () {},),
        Text('Company Name', style: Theme.of(context).textTheme.bodyLarge,),
        const SizedBox(height: MSizes.spaceBtwItems/2),
        Row(
          children: [
            const Icon(Icons.phone,color: Colors.grey,size: 16,),
            const SizedBox(height: MSizes.spaceBtwItems),
            Text(' 9827162579',style: Theme.of(context).textTheme.bodyMedium,)
          ],
        ),
        const SizedBox(height: MSizes.spaceBtwItems/2),
        Row(
          children: [
            const Icon(Icons.location_history,color: Colors.grey,size: 16,),
            const SizedBox(height: MSizes.spaceBtwItems/2),
            Expanded (child: Text('Some where you Dont Know',style: Theme.of(context).textTheme.bodyMedium,softWrap: true,))
          ],
        ),
        const SizedBox(height: MSizes.spaceBtwItems),
      ],
    );
  }
}
