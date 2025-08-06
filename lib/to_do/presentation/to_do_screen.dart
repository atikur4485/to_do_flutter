import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do_flutter/routes/NavigationRoute.dart';
import 'package:to_do_flutter/to_do/presentation/to_do_notifier.dart';

class ToDoScreen extends ConsumerWidget {
  const ToDoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) =>
      _toDoScreenContent(ref: ref, context: context);
}

void _fabOnPressed({required BuildContext context}) =>
    Navigator.pushNamed(context, createToDoScreen);

Widget _toDoScreenContent({
  required WidgetRef ref,
  required BuildContext context,
}) {
  final state = ref.watch(toDoNotifierProvide);
  print("build");
  return Scaffold(
    appBar: _appBar(),
    floatingActionButton: _toDoFab(
      onPressed: () => _fabOnPressed(context: context),
    ),
    body: Consumer(
      builder: (context, ref, child) => state.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: ${e.toString()}')),
        data: (todos) => ListView.builder(
          itemCount: todos.length,
          itemBuilder: (context, index) {
            final todo = todos[index];
            return ListTile(title: Text(todo.name)); // example
          },
        ),
      ),
    ),
  );
}

AppBar _appBar() => AppBar(
  iconTheme: IconThemeData(color: Colors.white),
  elevation: 0,
  backgroundColor: Colors.blue,
  title: Center(
    child: Text('T O  D O', style: TextStyle(color: Colors.white)),
  ),
);

Widget _toDoFab({required Function onPressed}) => FloatingActionButton(
  onPressed: () => onPressed(),
  backgroundColor: Colors.blue,
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
  child: Icon(Icons.add, color: Colors.white),
);
