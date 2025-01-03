import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:taski_to_do_challenge/app/core/helpers/dialog_helper.dart';
import 'package:taski_to_do_challenge/app/core/values/images.dart';
import 'package:taski_to_do_challenge/app/ui/view_models/done_view_model.dart';
import 'package:taski_to_do_challenge/app/ui/widgets/done_todo_card_widget.dart';

class DoneView extends StatefulWidget {
  const DoneView({super.key});

  @override
  State<DoneView> createState() => _DoneViewState();
}

class _DoneViewState extends State<DoneView> {
  final viewModel = DoneViewModel(GetIt.I());

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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Completed Tasks',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextButton(
              onPressed: () {},
              style: ButtonStyle(
                overlayColor: WidgetStatePropertyAll(
                  colorScheme.error.withOpacity(.1),
                ),
              ),
              child: Text(
                'Delete all',
                style: TextStyle(color: colorScheme.error),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 18,
        ),
        Expanded(
          child: ListenableBuilder(
            listenable: viewModel,
            builder: (context, child) {
              if (viewModel.isLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (viewModel.todos.isNotEmpty) {
                return ListView.separated(
                    itemBuilder: (context, index) {
                      var todo = viewModel.todos.items[index];

                      return DoneTodoCardWidget(
                        todo: todo,
                        onToggle: () => viewModel.toggleTaskById(todo.id),
                        onDelete: () {
                          DialogHelper.showDecisionDialog(
                            context,
                            title: 'Delete task',
                            content:
                                'Are you sure you want to delete the task?',
                            onConfirm: () {
                              viewModel.deleteTodoById(todo.id);
                            },
                          );
                        },
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 16,
                      );
                    },
                    itemCount: viewModel.todos.length);
              } else {
                return Center(
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
                    ],
                  ),
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
