import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'todo.dart';
import 'todo_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    return BlocProvider(
      create: (_) => TodoCubit(),
      child: Builder(
        builder: (context) {
          final cubit = context.read<TodoCubit>();

          return Scaffold(
            appBar: AppBar(title: const Text("Today's todos")),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) => Dialog(
                    constraints:
                        const BoxConstraints(maxHeight: 150, maxWidth: 200),
                    child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: TextFormField(
                              controller: titleController,
                              decoration: const InputDecoration(
                                hintText: "Enter title",
                              ),
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
                              if (formKey.currentState!.validate()) {
                                cubit.addTodo(titleController.text);
                                titleController.clear();
                                Navigator.pop(context);
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
            body: BlocBuilder<TodoCubit, List<Todo>>(
              builder: (context, todos) {
                if (todos.isEmpty) {
                  return const Center(child: Text("No todos yet"));
                }

                return ListView.builder(
                  itemCount: todos.length,
                  itemBuilder: (context, index) {
                    final todo = todos[index];

                    return ListTile(
                      leading: Checkbox(
                        value: todo.isdone,
                        onChanged: (value) {
                          cubit.toggle(index);
                        },
                      ),
                      title: Text(
                        todo.title,
                        style: TextStyle(
                          decoration: todo.isdone
                              ? TextDecoration.lineThrough
                              : null,
                        ),
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => cubit.remove(index),
                      ),
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
