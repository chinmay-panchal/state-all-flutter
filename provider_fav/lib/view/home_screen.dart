import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_fav/view_models/todo_viewmodel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print("rebuild2");
    final vm = context.watch<TodoViewmodel>(),
        act = context.read<TodoViewmodel>();
    return Scaffold(
      appBar: AppBar(title: const Text("Favourite App")),
      floatingActionButton: FloatingActionButton(
        onPressed: () => act.addTodo('title'),
        child: const Icon(Icons.add),
      ),
      body: vm.todos.isEmpty
          ? const Center(child: Text("No todos yet!"))
          : Column(
              children: [
                if (vm.doneTodos.isNotEmpty)
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      onPressed: act.removeTodo,
                      icon: const Icon(Icons.delete, color: Colors.red),
                    ),
                  ),
                Expanded(
                  child: ListView.builder(
                    itemCount: vm.todos.length,
                    itemBuilder: (_, i) {
                      final t = vm.todos[i];
                      return ListTile(
                        leading: Checkbox(
                          value: t.isDone,
                          onChanged: (v) => act.toggleTodo(i, v!),
                        ),
                        title: Text(
                          t.title,
                          style: TextStyle(
                            decoration: t.isDone
                                ? TextDecoration.lineThrough
                                : null,
                          ),
                        ),
                        trailing: IconButton(
                          icon: Icon(
                            t.isFav ? Icons.favorite : Icons.favorite_border,
                            color: t.isFav ? Colors.red : null,
                          ),
                          onPressed: () => act.togglefav(i),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
