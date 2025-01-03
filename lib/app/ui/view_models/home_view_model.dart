import 'package:flutter/material.dart';
import 'package:taski_to_do_challenge/app/data/models/paginable_model.dart';
import 'package:taski_to_do_challenge/app/data/models/paginable_params_model.dart';
import 'package:taski_to_do_challenge/app/data/repository/todo/todo_repository.dart';
import 'package:taski_to_do_challenge/app/ui/view_models/base_view_model.dart';

import '../../data/models/todo_model.dart';

class HomeViewModel extends BaseViewModel {
  final TodoRepository _todoRepository;

  final scrollCtrl = ScrollController();

  bool isLoading = false;
  bool isLoadingMore = false;

  PaginableModel<TodoModel> todos = PaginableModel.clean();

  HomeViewModel(this._todoRepository);

  @override
  void initState() {
    super.initState();
    loadTodos();
  }

  Future<void> loadTodos({bool clear = true}) async {
    if (clear) {
      isLoading = true;
      notifyListeners();
    }
    final result = await _todoRepository.getAllUnchecked(
      PaginableParamsModel(offset: clear ? 0 : todos.items.length),
    );

    if (clear) {
      todos.clear();
    }
    todos.totalItemsCount = result.totalItemsCount;
    todos.items.addAll(result.items);
    isLoading = false;
    notifyListeners();
  }

  Future<void> toggleTaskById(String id) async {
    var todo = todos.items.firstWhere((e) => e.id == id);
    todo.isChecked = !todo.isChecked;
    notifyListeners();

    await _todoRepository.save(todo);
  }

  Future<void> deleteTodoById(String id) async {
    isLoading = true;
    notifyListeners();

    await _todoRepository.deleteById(id);

    loadTodos();
  }
}
