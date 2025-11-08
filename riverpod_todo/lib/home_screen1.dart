import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_todo/todo_provider.dart';

// made using consumer widget
class HomeScreen extends ConsumerWidget {
  HomeScreen({super.key});

  final titleController = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("build called");

    final todos = ref.watch(todoprovider);

    return Scaffold(
      appBar: AppBar(title: const Text("Today's todos")),

      // ✅ FloatingActionButton
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (_) => Dialog(
              constraints: const BoxConstraints(maxHeight: 150, maxWidth: 200),
              child: Form(
                key: _formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextFormField(
                        controller: titleController,
                        decoration:
                            const InputDecoration(hintText: "Enter title"),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "enter title";
                          }
                          return null;
                        },
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          ref
                              .read(todoprovider.notifier)
                              .addTodo(titleController.text);
                          titleController.clear();
                          Navigator.pop(context);
                        }
                      },
                      child: const Text("add"),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),

      // ✅ Body (Reactive)
      body: todos.isEmpty
          ? const Center(child: Text("no todos yet"))
          : ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                final todo = todos[index];

                return ListTile(
                  leading: Checkbox(
                    value: todo.isdone,
                    onChanged: (_) {
                      ref.read(todoprovider.notifier).toggletodo(index);
                    },
                  ),
                  title: Text(
                    "${index}: ${todo.title}",
                    style: TextStyle(
                      decoration: todo.isdone
                          ? TextDecoration.lineThrough
                          : null,
                    ),
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      ref.read(todoprovider.notifier).remove(index);
                    },
                    icon: const Icon(Icons.delete),
                  ),
                );
              },
            ),
    );
  }
}
