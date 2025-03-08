import 'package:bodyandbeauty/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:bodyandbeauty/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';

class MyChoiseChip extends StatelessWidget {
  const MyChoiseChip({
    super.key, required this.text, required this.selected, this.onSelected,
  });

  final String text;
  final bool selected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    final iscolor = MyHelperFunctions.getColor(text) != null;
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: ChoiceChip(
        label: iscolor ? const SizedBox() : Text(text, style: Theme.of(context).textTheme.bodyLarge!.apply()),
        selected: selected,
        onSelected: onSelected,
        labelStyle: TextStyle(color: selected ? MyColors.white : null),
        avatar:  iscolor ? MyCircularContainer(width: 50,height: 50,backgroundColor: MyHelperFunctions.getColor(text)!):null,
        labelPadding: iscolor ?  const EdgeInsets.all(0): null,
        // make icon in center
        shape: iscolor ? const CircleBorder(): null,
        padding: iscolor ?  const EdgeInsets.all(0) : null,
        backgroundColor: iscolor ? MyHelperFunctions.getColor(text)!: null,
      ),
    );
  }
}
