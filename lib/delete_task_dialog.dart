import 'package:flutter/material.dart';

class DeleteTaskDialog extends StatelessWidget {
  final int id;

  const DeleteTaskDialog({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Delete Task"),
      content: const Text("Are you sure want to delete?"),
      actions: [
        TextButton(
            onPressed: () {
              
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
