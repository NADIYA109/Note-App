import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/task_provider.dart';

class TaskListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tasks = context.watch<TaskProvider>().tasks;
    return Scaffold(
      appBar: AppBar(title: Text("Your Tasks")),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(tasks[index]),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Icon(Icons.edit),
                onPressed: () => showDialog(
                  context: context,
                  builder: (context) {
                    final controller = TextEditingController(text: tasks[index]);
                    return AlertDialog(
                      title: Text("Edit Task"),
                      content: TextField(controller: controller),
                      actions: [
                        TextButton(
                          child: Text("Save"),
                          onPressed: () {
                            context.read<TaskProvider>().editTask(index, controller.text);
                            Navigator.pop(context);
                          },
                        )
                      ],
                    );
                  },
                ),
              ),
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () => context.read<TaskProvider>().deleteTask(index),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
