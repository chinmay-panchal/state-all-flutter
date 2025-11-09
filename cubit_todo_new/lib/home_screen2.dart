import 'package:cubit_todo_new/todo.dart';
import 'package:cubit_todo_new/todo_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final todoprovider = context.read<TodoCubit>();
    final titleController = TextEditingController();
    final formkey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(title: Text("Today's tasks")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              content: SizedBox(
                height: 240,
                width: 240,
                child: Form(
                  key: formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextFormField(
                        controller: titleController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "enter your title";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: () {
                          todoprovider.addTodo(titleController.text);
                          titleController.clear();
                          Navigator.pop(context);
                        },
                        child: Text("Add"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
      body: BlocBuilder<TodoCubit, List<Todo>>(
        builder: (context, state) {
          if (state.isEmpty) {
            return Center(child: Text("No tasks today"));
          }
          return ListView.builder(
            itemCount: state.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Checkbox(
                  value: state[index].isdone,
                  onChanged: (value) {
                    todoprovider.toggle(index);
                  },
                ),
                title: Text(state[index].title),
                trailing: IconButton(
                  onPressed: () {
                    todoprovider.remove(index);
                  },
                  icon: Icon(Icons.delete),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
