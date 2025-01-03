import 'package:get_it/get_it.dart';
import 'package:taski_to_do_challenge/app/data/data_sources/local_db_data_source.dart';
import 'package:taski_to_do_challenge/app/data/repository/todo/todo_repository.dart';
import 'package:taski_to_do_challenge/app/data/repository/todo/todo_repository_imp.dart';
import 'package:taski_to_do_challenge/app/data/services/todo/todo_service.dart';
import 'package:taski_to_do_challenge/app/data/services/todo/todo_service_imp.dart';

class Inject {
  static void init() {
    final getIt = GetIt.I;

    // datasources
    getIt.registerLazySingleton<LocalDbDataSource>(() => LocalDbDataSource());

    // services
    getIt.registerLazySingleton<TodoService>(() => TodoServiceImp(GetIt.I()));

    // repositories
    getIt.registerLazySingleton<TodoRepository>(() => TodoRepositoryImp(GetIt.I()));
  }
}
