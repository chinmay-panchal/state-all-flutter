import 'package:bloc_favorite/models/todo_model.dart';
import 'package:equatable/equatable.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object?> get props => [];
}

class addTodoEvent extends TodoEvent {
  final TodoModel todoModel;
  const addTodoEvent({required this.todoModel});
}

class checkEvent extends TodoEvent {
  final TodoModel todoModel;
  const checkEvent({required this.todoModel});
}

class deleteEvent extends TodoEvent {
  final TodoModel todoModel;
  const deleteEvent({required this.todoModel});
}
