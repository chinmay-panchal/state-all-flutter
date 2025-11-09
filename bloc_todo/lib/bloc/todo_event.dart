sealed class TodoEvent {}

class AddTodoEvent extends TodoEvent {
  String title;

  AddTodoEvent({required this.title});
}

class removeTodoEvent extends TodoEvent {
  int index;
  removeTodoEvent({required this.index});
}

class toggleTodoEvent extends TodoEvent {
  int index;

  toggleTodoEvent({required this.index});
}
