// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';


class MyShadowStyle {
  static final verticalProductShadow = BoxShadow(
      color: MyColors.darkgrey.withOpacity(0.1),
      blurRadius: 50,
      spreadRadius: 7,
      offset: const Offset(0, 2)
  ); // BoxShadow
  static final horizontalProductShadow = BoxShadow(
  color: MyColors.darkgrey.withOpacity(0.1),
  blurRadius: 50,
  spreadRadius: 7,
  offset: const Offset(0,2));
}// BoxShadow