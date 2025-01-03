import 'package:flutter/material.dart';
import 'package:taski_to_do_challenge/app/data/models/todo_model.dart';
import 'package:taski_to_do_challenge/app/data/repository/todo/todo_repository.dart';
import 'package:taski_to_do_challenge/app/ui/view_models/base_view_model.dart';
import 'package:uuid/uuid.dart';

class CreateTodoViewModel extends BaseViewModel {
  final TodoRepository _todoRepository;

  final formKey = GlobalKey<FormState>();

  final titleCtrl = TextEditingController();
  final descriptionCtrl = TextEditingController();

  final titleNode = FocusNode();

  bool isChecked = false;

  bool isLoading = false;

  CreateTodoViewModel(this._todoRepository);

  @override
  void initState() {
    super.initState();
    titleNode.requestFocus();
  }

  @override
  void dispose() {
    titleCtrl.dispose();
    descriptionCtrl.dispose();
    titleNode.dispose();
    super.dispose();
  }

  void toggleIsChecked() {
    isChecked = !isChecked;
    notifyListeners();
  }

  Future<bool> createTodo() async {
    if (!(formKey.currentState?.validate() ?? false)) return false;

    isLoading = true;
    notifyListeners();

    final todo = TodoModel(
      id: const Uuid().v4(),
      title: titleCtrl.text,
      description: descriptionCtrl.text,
      isChecked: isChecked,
    );
    await _todoRepository.save(todo);

    isLoading = false;
    notifyListeners();

    return true;
  }
}
