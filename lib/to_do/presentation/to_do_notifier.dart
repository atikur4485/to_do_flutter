import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do_flutter/data_source/app_database.dart';
import 'package:to_do_flutter/di/providers.dart';
import 'package:to_do_flutter/to_do/data/repository/to_do_repository.dart';

class ToDoNotifier extends AsyncNotifier<List<ToDo>> {
  late final ToDoRepository _toDoRepository;

  @override
  FutureOr<List<ToDo>> build() {
    _toDoRepository = ref.read(toDoRepositoryProvider);
    return _toDoRepository.getToDos();
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _toDoRepository.getToDos());
  }

  Future<void> insertToDo({required String name, required String des}) async {
    await _toDoRepository.insertToDo(name: name, des: des);
    await refresh();
  }
}

// provide the notifier

final toDoNotifierProvide = AsyncNotifierProvider<ToDoNotifier, List<ToDo>>(
  () => ToDoNotifier(),
);
