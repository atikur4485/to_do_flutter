import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frist_project/to_do/presentation/to_do_notifier.dart';
import 'package:frist_project/to_do/widgets/custom_app_bar.dart';

class CreateToDoScreen extends ConsumerStatefulWidget {
  const CreateToDoScreen({super.key});

  @override
  ConsumerState<CreateToDoScreen> createState() => _CreateToDoScreenState();
}

class _CreateToDoScreenState extends ConsumerState<CreateToDoScreen> {
  final titleController = TextEditingController();
  final desController = TextEditingController();

  bool _titleError = false;

  void _saveToDo() {
    final title = titleController.text.trim();
    if (title.isEmpty) {
      setState(() => _titleError = true);
      return;
    }
    final notifier = ref.read(toDoNotifierProvide.notifier);
    notifier.insertToDo(name: title, des: desController.text.trim());

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: appBar(title: "Create To Do"),
    body: Container(
      padding: EdgeInsets.symmetric(vertical: 25, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Title',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 16,
              fontWeight: FontWeight.w500,
              letterSpacing: 0,
            ),
          ),
          SizedBox(height: 8),
          _textField(
            controller: titleController,
            hint: "Write To Do Title...",
            prefixIcon: Icons.edit_note_rounded,
            errorText: _titleError ? "required" : null,
          ),
          SizedBox(height: 12),
          Text(
            'Description',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 16,
              fontWeight: FontWeight.w500,
              letterSpacing: 0,
            ),
          ),
          SizedBox(height: 8),
          _textField(
            controller: desController,
            hint: "Write To Do Description...",
            prefixIcon: Icons.description_outlined,
          ),
          SizedBox(height: 35),
          _saveButton(onPressed: () => _saveToDo()),
        ],
      ),
    ),
  );
}

Widget _textField({
  required TextEditingController controller,
  required String hint,
  required IconData prefixIcon,
  String? errorText,
}) => TextField(
  controller: controller,
  cursorColor: Colors.blue,
  decoration: InputDecoration(
    border: InputBorder.none,
    prefixIcon: Icon(prefixIcon, color: Colors.blue),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: Colors.blue, width: 1.5),
    ),
    hintText: hint,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: Colors.grey, width: 1.5),
    ),
    errorText: errorText,
    errorStyle: TextStyle(color: Colors.red),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: Colors.red, width: 1.5),
    ),
  ),
);

Widget _saveButton({required Function onPressed}) => ElevatedButton(
  onPressed: () => onPressed(),
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.blue,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  ),
  child: Padding(
    padding: const EdgeInsets.symmetric(vertical: 12.0),
    child: Text(
      'Save',
      style: TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0,
      ),
    ),
  ),
);
