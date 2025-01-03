import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:taski_to_do_challenge/app/core/helpers/dialog_helper.dart';
import 'package:taski_to_do_challenge/app/core/values/images.dart';
import 'package:taski_to_do_challenge/app/ui/view_models/home_view_model.dart';
import 'package:taski_to_do_challenge/app/ui/widgets/create_todo_bottom_widget.dart';
import 'package:taski_to_do_challenge/app/ui/widgets/todo_card_widget.dart';

class HomeView extends StatefulWidget {
  final ChangeNotifier newTasksNotifier;
  const HomeView({super.key, required this.newTasksNotifier});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final viewModel = HomeViewModel(GetIt.I());

  @override
  void initState() {
    super.initState();
    viewModel.initState();
    widget.newTasksNotifier.addListener(viewModel.loadTodos);
  }

  @override
  void dispose() {
    widget.newTasksNotifier.removeListener(viewModel.loadTodos);
    viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

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
        ListenableBuilder(
          listenable: viewModel,
          builder: (context, child) => Text(
            viewModel.todos.isNotEmpty
                ? 'You\'ve got ${viewModel.todos.length} task(s) to do.'
                : 'Create tasks to achieve more.',
            style: TextStyle(fontSize: 16, color: colorScheme.secondary),
          ),
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
                return Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      var todo = viewModel.todos.items[index];

                      return TodoCardWidget(
                        todo: todo,
                        onToggle: () => viewModel.toggleTaskById(todo.id),
                        // onEdit: () => viewModel,
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
                    itemCount: viewModel.todos.length,
                  ),
                );
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
                      const SizedBox(
                        height: 12,
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return const CreateTodoBottomWidget();
                            },
                          ).then(
                            (value) {
                              viewModel.loadTodos();
                            },
                          );
                        },
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
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
