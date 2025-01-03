import 'package:flutter/material.dart';
import 'package:taski_to_do_challenge/app/ui/notifiers/new_tasks_notifier.dart';
import 'package:taski_to_do_challenge/app/ui/view_models/base_view_model.dart';
import 'package:taski_to_do_challenge/app/ui/views/done_view.dart';
import 'package:taski_to_do_challenge/app/ui/views/home_view.dart';
import 'package:taski_to_do_challenge/app/ui/views/search_view.dart';

class DashboardViewModel extends BaseViewModel {
  int currentIndex = 0;

  final newTasksNotifier = NewTasksNotifier();

  late List<Widget> views;

  void changeIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  @override
  void initState() {
    super.initState();
    views = [
      HomeView(newTasksNotifier: newTasksNotifier),
      Container(),
      const SearchView(),
      DoneView(newTasksNotifier: newTasksNotifier),
    ];
  }

  @override
  void dispose() {
    newTasksNotifier.dispose();
    super.dispose();
  }
}
