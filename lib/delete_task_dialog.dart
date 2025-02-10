import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DeleteTaskDialog extends StatefulWidget {
  final String id;

  const DeleteTaskDialog({
    super.key,
    required this.id,
  });

  @override
  State<DeleteTaskDialog> createState() => _DeleteTaskDialogState();
}

class _DeleteTaskDialogState extends State<DeleteTaskDialog> {
  final CollectionReference _tasks =
      FirebaseFirestore.instance.collection('tasks');

  void _delete() {
    _tasks.doc(widget.id).delete();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Delete Task"),
      content: const Text("Are you sure want to delete?"),
      actions: [
        TextButton(
            onPressed: () {
              _delete();
            },
            child: const Text("Yes")),
        ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("No")),
      ],
    );
  }
}
