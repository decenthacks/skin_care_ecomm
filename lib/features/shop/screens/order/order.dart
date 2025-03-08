import 'package:bodyandbeauty/common/widgets/appBar/appbar.dart';
import 'package:bodyandbeauty/features/shop/screens/order/widgets/order_list.dart';
import 'package:bodyandbeauty/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
 class OrderScreen extends StatelessWidget {
   const OrderScreen({super.key});

   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: MyAppbar(title: Text('My Order',style: Theme.of(context).textTheme.headlineSmall,),showBackArrow: true,
       ),
       body: Padding(padding: EdgeInsets.all(MSizes.defaultSpace),
       //// Order
         child: MyOrderList(
         ),
     ),
     );
   }
 }
