import 'package:flutter/material.dart';
import 'package:provider_fav/models/todo.dart';

class DashboardViewmodel with ChangeNotifier {
  List<Todo> todos = [];

  void addTodo(String title) {
    todos.add(Todo(title: title, isdone: false));
    notifyListeners();
  }

  void removeTodo(int index) {
    todos.removeAt(index);
    notifyListeners();
  }

  void toggleTodo(int index) {
    todos[index].isdone = !todos[index].isdone;
    notifyListeners();
  }
}
