import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taski_to_do_challenge/app/core/values/images.dart';
import 'package:taski_to_do_challenge/app/ui/view_models/search_view_model.dart';

import '../widgets/todo_card_widget.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final viewModel = SearchViewModel();

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
        TextField(
          decoration: InputDecoration(
            filled: true,
            fillColor: colorScheme.onSurfaceVariant,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            prefixIcon: const Icon(Icons.search),
            prefixIconColor: colorScheme.primary,
            hintText: 'Searching for...',
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Expanded(
          child: viewModel.todos.isNotEmpty
              ? ListView.separated(
                  itemBuilder: (context, index) {
                    return TodoCardWidget(todo: viewModel.todos[index]);
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 16,
                    );
                  },
                  itemCount: viewModel.todos.length,
                )
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
                        'Enter the task name or\npart of the description.',
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
