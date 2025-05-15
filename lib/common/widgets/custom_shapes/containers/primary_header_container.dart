// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../curved_edges/curved_edge_widgit.dart';
import 'circular_container.dart';

class MyPrimaryHeaderContainer extends StatelessWidget {
  const MyPrimaryHeaderContainer({
    super.key,
    required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MyCurvedEdgesWidgets(
        child: SizedBox(
          child: Container(
            color: MyColors.primary,

            child: Stack(
              children: [
                /// Background custom shapes
                Positioned(
                  top: -150,
                  right: -250,
                  child: MyCircularContainer(
                    backgroundColor: MyColors.textWhite.withOpacity(0.1),
                  ),
                ),
                Positioned(
                  top: 100,
                  right: -300,
                  child: MyCircularContainer(
                       backgroundColor: MyColors.textWhite.withOpacity(0.1))),
                 child,
              ],
            ),
          ),
        ),

    );
  }
}
