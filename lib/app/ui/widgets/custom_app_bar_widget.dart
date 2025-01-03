import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taski_to_do_challenge/app/core/values/images.dart';

class CustomAppBarWidget extends StatelessWidget {
  const CustomAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SvgPicture.asset(Images.logo),
        Row(
          children: [
            const Text(
              'John',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(width: 10),
            CircleAvatar(
              backgroundColor: colorScheme.onSurface.withOpacity(.4),
              child: const Icon(Icons.person),
            ),
          ],
        ),
      ],
    );
  }
}
