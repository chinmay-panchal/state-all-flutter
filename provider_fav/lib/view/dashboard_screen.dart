import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_fav/view_models/dashboard_viewmodel.dart';
import 'package:provider_fav/view_models/todo_viewmodel.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print("building");
    final dbVM = context.read<DashboardViewmodel>();
    return Scaffold(
      appBar: AppBar(title: Text("Todays todos")),
      body: Consumer<DashboardViewmodel>(
        builder: (context, provider, child) {
          if (provider.todos.isEmpty) {
            return Center(child: Text("No todos"));
          }
          return ListView.builder(
            itemCount: provider.todos.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Checkbox(
                  value: provider.todos[index].isdone,
                  onChanged: (value) {
                    provider.toggleTodo(index);
                  },
                ),
                title: Text(provider.todos[index].title),
                trailing: IconButton(
                  onPressed: () {
                    provider.removeTodo(index);
                  },
                  icon: Icon(Icons.delete),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          dbVM.addTodo('title');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
