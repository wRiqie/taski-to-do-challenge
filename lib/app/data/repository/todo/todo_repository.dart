import '../../models/paginable_model.dart';
import '../../models/paginable_params_model.dart';
import '../../models/todo_model.dart';

abstract class TodoRepository {
  Future<void> save(TodoModel todo);

  Future<void> deleteById(String id);

  Future<void> deleteAllUnchecked();

  Future<PaginableModel<TodoModel>> getAll(PaginableParamsModel params);

  Future<PaginableModel<TodoModel>> getAllUnchecked(
      PaginableParamsModel params);

  Future<PaginableModel<TodoModel>> getAllChecked(PaginableParamsModel params);
}
