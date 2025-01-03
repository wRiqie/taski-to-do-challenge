import 'package:taski_to_do_challenge/app/data/data_sources/local_db_data_source.dart';
import 'package:taski_to_do_challenge/app/data/models/paginable_model.dart';
import 'package:taski_to_do_challenge/app/data/models/paginable_params_model.dart';
import 'package:taski_to_do_challenge/app/data/models/todo_model.dart';
import 'package:taski_to_do_challenge/app/data/services/todo/todo_service.dart';

class TodoServiceImp implements TodoService {
  final _table = LocalDbDataSource.todoTable;
  final LocalDbDataSource _localDbDataSource;

  TodoServiceImp(this._localDbDataSource);

  @override
  Future<void> save(TodoModel todo) {
    return _localDbDataSource.save(data: todo, table: _table);
  }

  @override
  Future<void> deleteById(String id) {
    return _localDbDataSource.deleteById(id);
  }

  @override
  Future<void> deleteAllUnchecked() {
    return _localDbDataSource.deleteAllUnchecked();
  }

  @override
  Future<PaginableModel<TodoModel>> getAll(PaginableParamsModel params) {
    return _localDbDataSource.getAll(params);
  }

  @override
  Future<PaginableModel<TodoModel>> getAllChecked(PaginableParamsModel params) {
    return _localDbDataSource.getAllChecked(params);
  }

  @override
  Future<PaginableModel<TodoModel>> getAllUnchecked(
      PaginableParamsModel params) {
    return _localDbDataSource.getAllUnchecked(params);
  }
}
