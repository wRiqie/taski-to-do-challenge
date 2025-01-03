import 'package:flutter/material.dart';

class CustomCheckBoxWidget extends StatelessWidget {
  final bool isChecked;
  const CustomCheckBoxWidget({super.key, this.isChecked = false});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: colorScheme.secondary,
        ),
        borderRadius: BorderRadius.circular(6),
      ),
    );
  }
}
