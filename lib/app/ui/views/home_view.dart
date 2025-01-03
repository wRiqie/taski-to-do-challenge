import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taski_to_do_challenge/app/core/values/images.dart';
import 'package:taski_to_do_challenge/app/ui/view_models/home_view_model.dart';
import 'package:taski_to_do_challenge/app/ui/widgets/todo_card_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final viewModel = HomeViewModel();

  @override
  void initState() {
    super.initState();
    viewModel.addListener(() {
      setState(() {});
    });
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
          viewModel.todos.isNotEmpty
              ? 'You\'ve got ${viewModel.todos.length} task(s) to do.'
              : 'Create tasks to achieve more.',
          style: TextStyle(fontSize: 16, color: colorScheme.secondary),
        ),
        Expanded(
          child: viewModel.todos.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        return TodoCardWidget(todo: viewModel.todos[index]);
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: 16,
                        );
                      },
                      itemCount: viewModel.todos.length))
              : Center(
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
