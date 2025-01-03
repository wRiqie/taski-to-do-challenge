import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taski_to_do_challenge/app/core/theme/color_scheme.dart';
import 'package:taski_to_do_challenge/app/core/values/images.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        RichText(
          text: TextSpan(
            text: 'Welcome, ',
            style: TextStyle(
              color: colorScheme.onSurface,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
            children: [
              TextSpan(
                text: 'John',
                style: TextStyle(color: colorScheme.primary),
              ),
              const TextSpan(text: '.'),
            ],
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        Text(
          'Create tasks to achieve more.',
          style: TextStyle(fontSize: 16, color: colorScheme.secondary),
        ),
        Expanded(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  Images.emptyTodo,
                  width: 100,
                ),
                const SizedBox(
                  height: 24,
                ),
                Text(
                  'You have no task listed.',
                  style: TextStyle(
                    fontSize: 16,
                    color: colorScheme.secondary,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  label: const Text('Create task'),
                  icon: const Icon(Icons.add),
                  style: ButtonStyle(
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    elevation: const WidgetStatePropertyAll(0),
                    backgroundColor: WidgetStatePropertyAll(
                      colorScheme.primary.withOpacity(.1),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
