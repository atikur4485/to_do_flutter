import 'package:drift/drift.dart';
import 'package:frist_project/data_source/app_database.dart';
import 'package:frist_project/to_do/data/local/to_do_dao.dart';

class ToDoRepository {
  late final ToDoDao _toDoDao;

  ToDoRepository(this._toDoDao);

  Future<List<ToDo>> getToDos() => _toDoDao.getAllTodo();

  Stream<List<ToDo>> watchAllToDos() => _toDoDao.watchAllTodo();

  Future<int> insertToDo({required String name, required String des}) {
    final todo = ToDoTableCompanion(name: Value(name), description: Value(des));
    return _toDoDao.insertToDo(todo);
  }
}
