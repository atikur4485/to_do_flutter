import 'package:drift/drift.dart';

@DataClassName('ToDo')
class ToDoTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text()();

  TextColumn get description => text()();

  BoolColumn get isComplete => boolean().withDefault(const Constant(false))();
}
