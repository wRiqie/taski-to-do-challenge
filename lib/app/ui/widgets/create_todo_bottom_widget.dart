import 'package:flutter/material.dart';
import 'package:taski_to_do_challenge/app/ui/widgets/custom_check_box_widget.dart';

class CreateTodoBottomWidget extends StatelessWidget {
  const CreateTodoBottomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: EdgeInsets.fromLTRB(
          30, 30, 30, 30 + MediaQuery.of(context).viewInsets.bottom),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              const CustomCheckBoxWidget(),
              const SizedBox(
                width: 18,
              ),
              Expanded(
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'What\'s in your mind?',
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.edit,
                color: colorScheme.secondary,
                size: 28,
              ),
              const SizedBox(
                width: 18,
              ),
              Expanded(
                child: TextFormField(
                  maxLines: 4,
                  decoration: const InputDecoration(
                    hintText: 'Add a note...',
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(onPressed: () {}, child: const Text('Create')),
            ],
          ),
        ],
      ),
    );
  }
}
