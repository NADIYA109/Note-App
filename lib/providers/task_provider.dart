// import 'package:flutter/material.dart';

// class TaskProvider with ChangeNotifier {
//   List<String> _tasks = [];  

//   List<String> get tasks => _tasks;

//   void addTask(String task) {
//     _tasks.add(task);
//     notifyListeners();
//   }

//   void editTask(int index, String newTask) {
//     _tasks[index] = newTask;
//     notifyListeners();
//   }

//   void deleteTask(int index) {
//     _tasks.removeAt(index);
//     notifyListeners();
//   }
// } 


import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TaskProvider with ChangeNotifier {
  List<String> _tasks = [];

  List<String> get tasks => _tasks;

  TaskProvider() {
    _loadTasks(); //  Load saved tasks when provider is created
  }

  //  Load tasks from SharedPreferences
  void _loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    _tasks = prefs.getStringList('taskList') ?? [];
    notifyListeners();
  }

  //  Save current tasks to SharedPreferences
  void _saveTasks() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList('taskList', _tasks);
  }

  void addTask(String task) {
    _tasks.add(task);
    _saveTasks();      //  Save updated task list
    notifyListeners();
  }

  void editTask(int index, String newTask) {
    _tasks[index] = newTask;
    _saveTasks();      //  Save updated task list
    notifyListeners();
  }

  void deleteTask(int index) {
    _tasks.removeAt(index);
    _saveTasks();      //  Save updated task list
    notifyListeners();
  }
}
