import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_todo/todo_provider.dart';

// /made using consumerstateful
class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final titleController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    print("rebuild");
    return Scaffold(
      floatingActionButton: Consumer(
        builder: (context, ref, child) {
          return FloatingActionButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => Dialog(
                  constraints: BoxConstraints(maxHeight: 150, maxWidth: 200),
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
                            decoration: InputDecoration(
                              hintText: "Enter title",
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "enter title";
                              }
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
                          child: Text("add"),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            child: Icon(Icons.add),
          );
        },
      ),
      appBar: AppBar(title: Text("Today's todos")),
      body: Consumer(
        builder: (context, ref, child) {
          if (ref.watch(todoprovider).isEmpty) {
            return Center(child: Text("no todos yet"));
          }

          return ListView.builder(
            itemCount: ref.watch(todoprovider).length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Checkbox(
                  value: ref.watch(todoprovider)[index].isdone,
                  onChanged: (value) {
                    ref.read(todoprovider.notifier).toggletodo(index);
                  },
                ),
                title: Text(
                  style: TextStyle(
                    decoration: ref.watch(todoprovider)[index].isdone
                        ? TextDecoration.lineThrough
                        : null,
                  ),
                  "${index}: ${(ref.watch(todoprovider)[index].title)}",
                ),
                trailing: IconButton(
                  onPressed: () {
                    ref.read(todoprovider.notifier).remove(index);
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
