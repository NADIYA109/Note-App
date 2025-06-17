import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/task_provider.dart';

class AddTaskPage extends StatelessWidget {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Task")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(labelText: "Enter task"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text("Add"),
              onPressed: () {
                context.read<TaskProvider>().addTask(controller.text);
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
