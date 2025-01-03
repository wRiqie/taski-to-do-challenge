import 'package:flutter/material.dart';
import 'package:taski_to_do_challenge/app/ui/view_models/dashboard_view_model.dart';
import 'package:taski_to_do_challenge/app/ui/widgets/create_todo_bottom_widget.dart';
import 'package:taski_to_do_challenge/app/ui/widgets/custom_app_bar_widget.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  final viewModel = DashboardViewModel();

  @override
  void initState() {
    super.initState();
    viewModel.initState();
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
    return Scaffold(
      bottomNavigationBar: ListenableBuilder(
        listenable: viewModel,
        builder: (context, child) {
          return BottomNavigationBar(
            selectedFontSize: 12,
            unselectedFontSize: 12,
            currentIndex: viewModel.currentIndex,
            onTap: (value) async {
              if (value == 1) {
                // create
                await showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (context) {
                    return const CreateTodoBottomWidget();
                  },
                );
                viewModel.newTasksNotifier.notify();
              } else {
                viewModel.changeIndex(value);
              }
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.list),
                label: 'Todo',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add_box_outlined),
                label: 'Create',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.check_box_outlined),
                label: 'Done',
              ),
            ],
          );
        },
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(18, 20, 18, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const CustomAppBarWidget(),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListenableBuilder(
                  listenable: viewModel,
                  builder: (context, child) {
                    return viewModel.views[viewModel.currentIndex];
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
