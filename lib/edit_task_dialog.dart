import 'package:cloud_firestore/cloud_firestore.dart';
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
  late TextEditingController _taskController;
  final CollectionReference _tasks =
      FirebaseFirestore.instance.collection('tasks');

  void _update() {
    if (_taskController.text.isNotEmpty) {
      _tasks.doc(widget.id).update({'task title': _taskController.text});
      _taskController.clear();
      Navigator.pop(context);
    }
  }

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
        ElevatedButton(
            onPressed: () {
              _update();
            },
            child: const Text("Update")),
      ],
    );
  }
}
