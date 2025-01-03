import 'package:flutter/material.dart';

class CustomCheckBoxWidget extends StatelessWidget {
  final bool isChecked;
  const CustomCheckBoxWidget({super.key, this.isChecked = false});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      padding: isChecked ? null : const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isChecked ? colorScheme.secondary.withOpacity(.2) : null,
        border: Border.all(
          width: 2,
          color: isChecked ? Colors.transparent : colorScheme.secondary,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Visibility(
        visible: isChecked,
        child: Icon(
          Icons.check,
          color: colorScheme.surface,
        ),
      ),
    );
  }
}
