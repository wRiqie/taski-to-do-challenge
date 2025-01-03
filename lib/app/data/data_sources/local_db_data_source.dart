import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:taski_to_do_challenge/app/data/models/paginable_model.dart';
import 'package:taski_to_do_challenge/app/data/models/todo_model.dart';

import '../models/paginable_params_model.dart';

class LocalDbDataSource {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await initDB();
    return _database!;
  }

  Future<Database> initDB() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'falts.db');
    return openDatabase(
      path,
      version: 1,
      onOpen: (db) async {
        await _createTables(db);
      },
      onCreate: (Database db, int version) async {
        await _createTables(db);
      },
    );
  }

  Future<void> _createTables(Database db) async {
    await db.execute(_createTableTodo);
  }

  // Generic
  Future<int> save({required dynamic data, required String table}) async {
    final db = await database;
    var res = await db.insert(table, data.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return res;
  }

  Future<int> getTableCount(String table, {String? condition}) async {
    final db = await database;
    var sql = StringBuffer();
    sql.write(" SELECT COUNT(0) AS total ");
    sql.write(" FROM $table ");
    if (condition != null) sql.write(" $condition ");

    var res = await db.rawQuery(sql.toString());

    return res.isNotEmpty ? res.first['total'] as int : 0;
  }

  // Todos
  static const todoTable = 'todo';
  static const _todoId = 'id';
  static const _todoTitle = 'title';
  static const _todoDescription = 'description';
  static const _todoIsChecked = 'isChecked';

  static const _createTableTodo = """
    CREATE TABLE IF NOT EXISTS $todoTable(
      $_todoId TEXT NOT NULL PRIMARY KEY,
      $_todoTitle TEXT,
      $_todoDescription TEXT,
      $_todoIsChecked TEXT
    );
  """;

  Future<PaginableModel<TodoModel>> getAll(PaginableParamsModel params,
      {String? condition}) async {
    final db = await database;

    final response = await db.query(todoTable, where: condition);

    List<TodoModel> todos = response.isNotEmpty
        ? response.map((e) => TodoModel.fromMap(e)).toList()
        : [];

    bool isFirstLoad = params.offset == 0;

    return PaginableModel(
      items: todos,
      totalItemsCount: isFirstLoad ? await getTableCount(todoTable) : null,
    );
  }

  Future<PaginableModel<TodoModel>> getAllUnchecked(
      PaginableParamsModel params) {
    return getAll(params, condition: '$_todoIsChecked = 0');
  }

  Future<PaginableModel<TodoModel>> getAllChecked(PaginableParamsModel params) {
    return getAll(params, condition: '$_todoIsChecked = 1');
  }

  Future<void> deleteById(String id) async {
    final db = await database;
    await db.delete(
      todoTable,
      where: '$_todoId = ?',
      whereArgs: [id],
    );
  }

  Future<void> deleteAllUnchecked() async {
    final db = await database;
    await db.delete(
      todoTable,
      where: '$_todoIsChecked = ?',
      whereArgs: [1],
    );
  }
}
