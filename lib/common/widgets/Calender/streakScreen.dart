import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CalenderSreakScreen extends StatelessWidget {
  const CalenderSreakScreen({super.key, required this.onPressed, this.iconColor});

  final VoidCallback onPressed;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(onPressed: () {}, icon: const Icon(Iconsax.calendar_2)),
      ],
    );
  }
}
