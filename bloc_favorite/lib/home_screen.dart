import 'package:bloc_favorite/models/todo_model.dart';
import 'package:bloc_favorite/todolist/todo_bloc.dart';
import 'package:bloc_favorite/todolist/todo_event.dart';
import 'package:bloc_favorite/todolist/todo_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Favourite App")),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          return state.todo.isEmpty
              ? Center(child: Text("No todos yet"))
              : ListView.builder(
                  itemCount: state.todo.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Checkbox(
                        value: state.todo[index].isdone,
                        onChanged: (value) {
                          context.read<TodoBloc>().add(
                            checkEvent(todoModel: state.todo[index]),
                          );
                        },
                      ),
                      title: Text(state.todo[index].title),
                      trailing: IconButton(
                        onPressed: () {
                          context.read<TodoBloc>().add(
                            deleteEvent(todoModel: state.todo[index]),
                          );
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
          context.read<TodoBloc>().add(
            addTodoEvent(
              todoModel: TodoModel(title: "new title", isdone: false),
            ),
          );
        },
      ),
    );
  }
}
