import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:taski_to_do_challenge/app/core/mixins/validators_mixin.dart';
import 'package:taski_to_do_challenge/app/ui/view_models/create_todo_view_model.dart';
import 'package:taski_to_do_challenge/app/ui/widgets/custom_check_box_widget.dart';

class CreateTodoBottomWidget extends StatefulWidget {
  const CreateTodoBottomWidget({super.key});

  @override
  State<CreateTodoBottomWidget> createState() => _CreateTodoBottomWidgetState();
}

class _CreateTodoBottomWidgetState extends State<CreateTodoBottomWidget>
    with ValidatorsMixin {
  final viewModel = CreateTodoViewModel(GetIt.I());

  @override
  void initState() {
    super.initState();
    
    viewModel.initState();
  }

  @override
  void dispose() {
    viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: EdgeInsets.fromLTRB(
          30, 30, 30, 30 + MediaQuery.of(context).viewInsets.bottom),
      child: Form(
        key: viewModel.formKey,
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
                    focusNode: viewModel.titleNode,
                    controller: viewModel.titleCtrl,
                    decoration: const InputDecoration(
                      hintText: 'What\'s in your mind?',
                    ),
                    validator: isNotEmpty,
                    textInputAction: TextInputAction.next,
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
                    controller: viewModel.descriptionCtrl,
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
                TextButton(
                  onPressed: () async {
                    final result = await viewModel.createTodo();
                    if (context.mounted && result) {
                      Navigator.pop(context);
                    }
                  },
                  child: const Text('Create'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
