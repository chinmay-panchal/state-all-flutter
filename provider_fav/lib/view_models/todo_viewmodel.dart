import 'package:flutter/material.dart';
import 'package:provider_fav/models/todo_model.dart';

class TodoViewmodel extends ChangeNotifier {
  List<TodoModel> todos = [];
  List<TodoModel> doneTodos = [];

  void addTodo(String title) {
    todos.add(TodoModel(title: title, isDone: false, isFav: false));
    notifyListeners();
  }

  void removeTodo() {
    todos.removeWhere((e) => e.isDone);
    doneTodos.clear();
    notifyListeners();
  }

  void togglefav(int index) {
    todos[index].isFav = !todos[index].isFav;
    notifyListeners();
  }

  void toggleTodo(int index, bool val) {
    if (val == true) {
      todos[index].isDone = true;
      doneTodos.add(todos[index]);
      notifyListeners();
    } else {
      todos[index].isDone = false;
      doneTodos.remove(todos[index]);
      notifyListeners();
    }
  }
}
