import 'package:flutter_riverpod/legacy.dart';
import 'package:riverpod_todo/todo.dart';

class TodoNotifier extends StateNotifier<List<Todo>> {
  TodoNotifier() : super([]);

  void addTodo(String title) {
    state = [...state, Todo(title: title, isdone: false)];
  }

  void toggletodo(int index) {
    var curr = [...state];
    curr[index].isdone = !curr[index].isdone;
    state = curr;
  }

  void remove(int index) {
    final updatedList = [...state];
    updatedList.removeAt(index);
    state = updatedList;
  }
}

final todoprovider = StateNotifierProvider<TodoNotifier, List<Todo>>(
  (ref) => TodoNotifier(),
);
