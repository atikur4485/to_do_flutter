import 'package:drift/drift.dart';
import 'package:to_do_flutter/data_source/app_database.dart';
import 'package:to_do_flutter/to_do/data/local/to_do_table.dart';

part 'to_do_dao.g.dart';

@DriftAccessor(tables: [ToDoTable])
class ToDoDao extends DatabaseAccessor<AppDatabase> with _$ToDoDaoMixin {
  ToDoDao(super.attachedDatabase);

  Future<List<ToDo>> getAllTodo() => select(toDoTable).get();

  Stream<List<ToDo>> watchAllTodo() => select(toDoTable).watch();

  Future<int> insertToDo(Insertable<ToDo> todo) => into(toDoTable).insert(todo);
}
