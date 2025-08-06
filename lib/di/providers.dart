import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do_flutter/data_source/app_database.dart';
import 'package:to_do_flutter/to_do/data/local/to_do_dao.dart';
import 'package:to_do_flutter/to_do/data/repository/to_do_repository.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

final databaseProvider = Provider<AppDatabase>(
  (ref) => AppDatabase(_openConnection()),
);

LazyDatabase _openConnection() => LazyDatabase(() async {
  final dbFolder = await getApplicationDocumentsDirectory();
  final file = File(p.join(dbFolder.path, 'app.sqlite'));
  return NativeDatabase(file);
});

final toDoDaoProvider = Provider<ToDoDao>(
  (ref) => ToDoDao(ref.read(databaseProvider)),
);

final toDoRepositoryProvider = Provider<ToDoRepository>(
  (ref) => ToDoRepository(ref.read(toDoDaoProvider)),
);
