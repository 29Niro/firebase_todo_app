import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddTaskDialog extends StatefulWidget {
  const AddTaskDialog({super.key});

  @override
  State<AddTaskDialog> createState() => _AddTaskDialogState();
}

class _AddTaskDialogState extends State<AddTaskDialog> {
  final TextEditingController _taskController = TextEditingController();
  final CollectionReference _tasks =
      FirebaseFirestore.instance.collection('tasks');

  void _add() {
    if (_taskController.text.isNotEmpty) {
      _tasks.add(
          {'task title': _taskController.text, 'timestamp': Timestamp.now()});
      _taskController.clear();
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Add Task"),
      content: TextField(
        controller: _taskController,
        decoration: const InputDecoration(
          hintText: "Type your task",
          border: OutlineInputBorder(),
        ),
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Cancel")),
        ElevatedButton(
            onPressed: () {
              _add();
            },
            child: const Text("Add")),
      ],
    );
  }
}
