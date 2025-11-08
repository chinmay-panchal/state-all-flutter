import 'package:bloc_favorite/models/todo_model.dart';
import 'package:equatable/equatable.dart';

class TodoState extends Equatable {
  final List<TodoModel> todo;

  const TodoState({required this.todo});

  TodoState copyWith({List<TodoModel>? todo}) {
    return TodoState(todo: todo ?? this.todo);
  }

  @override
  List<Object?> get props => [todo];
}
