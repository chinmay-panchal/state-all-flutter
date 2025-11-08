import 'package:flutter_bloc/flutter_bloc.dart';
import 'todo.dart';

class TodoCubit extends Cubit<List<Todo>> {
  TodoCubit() : super([]);

  void addTodo(String title) {
    final updated = [...state, Todo(title: title, isdone: false)];
    emit(updated);
  }

  void remove(int index) {
    final updated = [...state]..removeAt(index);
    emit(updated);
  }

  void toggle(int index) {
    final updated = [...state];
    final todo = updated[index];
    updated[index] = Todo(title: todo.title, isdone: !todo.isdone);
    emit(updated);
  }
}
