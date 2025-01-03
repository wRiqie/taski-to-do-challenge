import 'package:flutter/material.dart';
import 'package:taski_to_do_challenge/app/data/models/todo_model.dart';

import 'custom_check_box_widget.dart';

class DoneTodoCardWidget extends StatelessWidget {
  final TodoModel todo;
  const DoneTodoCardWidget({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.onSurfaceVariant,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CustomCheckBoxWidget(
              isChecked: true,
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    todo.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
