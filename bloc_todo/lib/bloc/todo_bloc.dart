import 'package:bloc_todo/bloc/todo_event.dart';
import 'package:bloc_todo/bloc/todo_state.dart';
import 'package:bloc_todo/models/todo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoState(todo: [])) {
    on<AddTodoEvent>(_addTodo);
    on<toggleTodoEvent>(_toggleTodo);
    on<removeTodoEvent>(_removeTodo);
  }

  void _addTodo(AddTodoEvent event, Emitter<TodoState> emit) {
    var curr = [...state.todo];
    curr.add(Todo(title: event.title));
    emit(TodoState(todo: curr));
  }

  void _toggleTodo(toggleTodoEvent event, Emitter<TodoState> emit) {
    var curr = [...state.todo];
    curr[event.index].isdone = !curr[event.index].isdone;
    emit(TodoState(todo: curr));
  }

  void _removeTodo(removeTodoEvent event, Emitter<TodoState> emit) {
    var curr = [...state.todo];
    curr.removeAt(event.index);
    emit(TodoState(todo: curr));
  }
}
