import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frist_project/routes/NavigationRoute.dart';
import 'package:frist_project/to_do/presentation/to_do_screen.dart';
import 'package:frist_project/to_do/create_to_do/add_to_do_content.dart';

void main() => runApp(const ProviderScope(child: ToDoApp()));

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: toDoScreen,
    theme: ThemeData(useMaterial3: true),
    routes: {
      toDoScreen: (context) => ToDoScreen(),
      createToDoScreen: (context) => CreateToDoScreen(),
    },
  );
}
