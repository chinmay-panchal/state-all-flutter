import 'package:get/get.dart';
import 'package:getx_todo/todo_model.dart';

class TodoController extends GetxController {
  // RxList = observable list
  var todos = <Todo>[].obs;

  void addTodo(String title) {
    todos.add(Todo(title: title));
  }

  void toggleTodo(int index) {
    todos[index].isDone = !todos[index].isDone;
    todos.refresh(); // to update UI (since modifying object inside list)
  }

  void removeTodo(int index) {
    todos.removeAt(index);
  }
}
