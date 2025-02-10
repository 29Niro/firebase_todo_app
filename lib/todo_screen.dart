import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_todo_app/add_task_dialog.dart';
import 'package:firebase_todo_app/delete_task_dialog.dart';
import 'package:firebase_todo_app/edit_task_dialog.dart';
import 'package:flutter/material.dart';

class TodoScreen extends StatelessWidget {
  TodoScreen({super.key});

  final CollectionReference _tasks =
      FirebaseFirestore.instance.collection('tasks');

  void _addTask(BuildContext context) {
    showDialog(context: context, builder: (context) => const AddTaskDialog());
  }

  void _editTask(BuildContext context, String id, String title) {
    showDialog(
      context: context,
      builder: (context) => EditTaskDialog(
        id: id,
        currentTitle: title,
      ),
    );
  }

  void _deleteTask(BuildContext context, int id) {
    showDialog(
      context: context,
      builder: (context) => DeleteTaskDialog(
        id: id,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To-Do App'),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.only(bottom: 5, left: 10, right: 10),
              child: ListTile(
                title: const Text("task"),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {
                        _editTask(context, index.toString(), "title");
                      },
                      icon: const Icon(Icons.edit),
                    ),
                    IconButton(
                      onPressed: () {
                        _deleteTask(context, index);
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
                tileColor: const Color.fromARGB(255, 202, 199, 199),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addTask(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
