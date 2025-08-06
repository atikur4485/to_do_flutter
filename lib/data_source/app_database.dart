import 'package:drift/drift.dart';

import '../to_do/data/local/to_do_table.dart';

part 'app_database.g.dart';

// Drift database
@DriftDatabase(tables: [ToDoTable])
class AppDatabase extends _$AppDatabase {
  AppDatabase(super.e);

  @override
  int get schemaVersion => 1;
}
