import 'package:flutter/material.dart';

class NewTasksNotifier extends ChangeNotifier {
  void notify() {
    notifyListeners();
  }
}
