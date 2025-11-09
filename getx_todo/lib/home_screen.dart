import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_todo/todo_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final titleController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  // initialize controller (same instance used everywhere)
  final TodoController todoController = Get.put(TodoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Today's todos")),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (_) => Dialog(
              constraints: const BoxConstraints(maxHeight: 150, maxWidth: 200),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextFormField(
                        controller: titleController,
                        decoration:
                            const InputDecoration(hintText: "Enter title"),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter title";
                          }
                          return null;
                        },
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          todoController.addTodo(titleController.text);
                          titleController.clear();
                          Get.back();
                        }
                      },
                      child: const Text("Add"),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),

      body: Obx(() {
        final todos = todoController.todos;
        if (todos.isEmpty) {
          return const Center(child: Text("No todos yet"));
        }
        return ListView.builder(
          itemCount: todos.length,
          itemBuilder: (context, index) {
            final todo = todos[index];
            return ListTile(
              leading: Checkbox(
                value: todo.isDone,
                onChanged: (_) => todoController.toggleTodo(index),
              ),
              title: Text(
                "${index + 1}: ${todo.title}",
                style: TextStyle(
                  decoration:
                      todo.isDone ? TextDecoration.lineThrough : null,
                ),
              ),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () => todoController.removeTodo(index),
              ),
            );
          },
        );
      }),
    );
  }
}
