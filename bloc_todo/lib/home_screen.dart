import 'package:bloc_todo/bloc/todo_bloc.dart';
import 'package:bloc_todo/bloc/todo_event.dart';
import 'package:bloc_todo/bloc/todo_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final todoprovider = context.read<TodoBloc>();
    return Scaffold(
      appBar: AppBar(title: Text("Today's tasks")),
      body: BlocConsumer<TodoBloc, TodoState>(
        listener: (context, state) {},
        builder: (context, state) => state.todo.isEmpty
            ? Center(child: Text("No todos"))
            : ListView.builder(
                itemCount: state.todo.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Checkbox(
                      value: state.todo[index].isdone,
                      onChanged: (value) {
                        todoprovider.add(toggleTodoEvent(index: index));
                      },
                    ),
                    title: Text(state.todo[index].title),
                    trailing: IconButton(
                      onPressed: () {
                        todoprovider.add(removeTodoEvent(index: index));
                      },
                      icon: Icon(Icons.delete),
                    ),
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          todoprovider.add(AddTodoEvent(title: 'title'));
        },
      ),
    );
  }
}
