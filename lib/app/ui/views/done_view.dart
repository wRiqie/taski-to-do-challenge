import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taski_to_do_challenge/app/core/values/images.dart';
import 'package:taski_to_do_challenge/app/ui/view_models/done_view_model.dart';
import 'package:taski_to_do_challenge/app/ui/widgets/done_todo_card_widget.dart';

class DoneView extends StatefulWidget {
  const DoneView({super.key});

  @override
  State<DoneView> createState() => _DoneViewState();
}

class _DoneViewState extends State<DoneView> {
  final viewModel = DoneViewModel();

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
          child: viewModel.todos.isNotEmpty
              ? ListView.separated(
                  itemBuilder: (context, index) {
                    return DoneTodoCardWidget(todo: viewModel.todos[index]);
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 16,
                    );
                  },
                  itemCount: viewModel.todos.length)
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
                    ],
                  ),
                ),
        ),
      ],
    );
  }
}
