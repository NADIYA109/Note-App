import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'task_list_page.dart';
import 'add_task_page.dart';
import 'settings_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Note App"),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'Settings') {
                Navigator.push(context, MaterialPageRoute(builder: (_) => SettingsPage()));
              }
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 'Settings',
                child: Text('Settings'),
              )
            ],
          )
        ],
      ),
      body: Center(
        child: ElevatedButton(
          child: Text("Go to Task List"),
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => TaskListPage())),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => AddTaskPage())),
      ),
    );
  }
}
