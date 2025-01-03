import 'package:flutter/material.dart';
import 'package:taski_to_do_challenge/app/ui/views/done_view.dart';
import 'package:taski_to_do_challenge/app/ui/views/home_view.dart';
import 'package:taski_to_do_challenge/app/ui/views/search_view.dart';

class DashboardViewModel extends ChangeNotifier {
  int currentIndex = 0;

  List<Widget> views = [
    const HomeView(),
    Container(),
    const SearchView(),
    const DoneView(),
  ];

  void changeIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
