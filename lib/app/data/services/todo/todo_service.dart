import 'package:taski_to_do_challenge/app/data/models/paginable_params_model.dart';
import 'package:taski_to_do_challenge/app/data/models/todo_model.dart';

import '../../models/paginable_model.dart';

abstract class TodoService {
  Future<void> save(TodoModel todo);

  Future<void> deleteById(String id);

  Future<void> deleteAllUnchecked();

  Future<PaginableModel<TodoModel>> getAll(PaginableParamsModel params);

  Future<PaginableModel<TodoModel>> getAllUnchecked(PaginableParamsModel params);

  Future<PaginableModel<TodoModel>> getAllChecked(PaginableParamsModel params);
}