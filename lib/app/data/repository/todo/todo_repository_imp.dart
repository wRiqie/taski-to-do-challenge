import 'package:taski_to_do_challenge/app/data/models/paginable_model.dart';
import 'package:taski_to_do_challenge/app/data/models/paginable_params_model.dart';
import 'package:taski_to_do_challenge/app/data/models/todo_model.dart';
import 'package:taski_to_do_challenge/app/data/services/todo/todo_service.dart';
import 'todo_repository.dart';

class TodoRepositoryImp implements TodoRepository {
  final TodoService _todoService;

  TodoRepositoryImp(this._todoService);

  @override
  Future<void> save(TodoModel todo) {
    return _todoService.save(todo);
  }

  @override
  Future<void> deleteById(String id) {
    return _todoService.deleteById(id);
  }

  @override
  Future<void> deleteAllUnchecked() {
    return _todoService.deleteAllUnchecked();
  }

  @override
  Future<PaginableModel<TodoModel>> getAll(PaginableParamsModel params) {
    return _todoService.getAll(params);
  }

  @override
  Future<PaginableModel<TodoModel>> getAllChecked(PaginableParamsModel params) {
    return _todoService.getAllChecked(params);
  }

  @override
  Future<PaginableModel<TodoModel>> getAllUnchecked(
      PaginableParamsModel params) {
    return _todoService.getAllUnchecked(params);
  }
}
