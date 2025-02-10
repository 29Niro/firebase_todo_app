import 'package:flutter/material.dart';

class EditTaskDialog extends StatefulWidget {
  final String id;
  final String currentTitle;

  const EditTaskDialog(
      {super.key, required this.id, required this.currentTitle});

  @override
  State<EditTaskDialog> createState() => _EditTaskDialogState();
}

class _EditTaskDialogState extends State<EditTaskDialog> {
  // TextEditingController _taskController = TextEditingController(text: widget.currentTitle);

  late TextEditingController _taskController;

  @override
  void initState() {
    super.initState();
    _taskController = TextEditingController(text: widget.currentTitle);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Edit Task'),
      content: TextField(
        controller: _taskController,
        decoration: const InputDecoration(
          hintText: "Edit your task",
          border: OutlineInputBorder(),
        ),
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Cancel")),
        ElevatedButton(onPressed: () {}, child: const Text("Update")),
      ],
    );
  }
}
