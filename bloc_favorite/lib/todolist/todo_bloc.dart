import 'package:bloc_favorite/todolist/todo_event.dart';
import 'package:bloc_favorite/todolist/todo_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoState(todo: [])) {
    on<addTodoEvent>(_addTodo);
    on<checkEvent>((event, emit) {
      final updatedList = state.todo.map((e) {
        if (e == event.todoModel) {
          return e.copyWith(isdone: !e.isdone);
        }
        return e;
      }).toList();
      emit(state.copyWith(todo: updatedList));
    });
    on<deleteEvent>(_deleteEvent);
  }

  void _addTodo(addTodoEvent event, Emitter<TodoState> emit) {
    emit(state.copyWith(todo: List.from(state.todo)..add(event.todoModel)));
  }

  void _deleteEvent(deleteEvent event, Emitter<TodoState> emit) {
    emit(state.copyWith(todo: List.from(state.todo)..remove(event.todoModel)));
  }
}
