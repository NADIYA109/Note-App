import 'package:flutter/material.dart';

class TaskProvider with ChangeNotifier {
  List<String> _tasks = [];  

  List<String> get tasks => _tasks;

  void addTask(String task) {
    _tasks.add(task);
    notifyListeners();
  }

  void editTask(int index, String newTask) {
    _tasks[index] = newTask;
    notifyListeners();
  }

  void deleteTask(int index) {
    _tasks.removeAt(index);
    notifyListeners();
  }
} 
