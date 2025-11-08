import 'package:bloc_counter/counter/counter_bloc.dart';
import 'package:bloc_counter/counter/counter_event.dart';
import 'package:bloc_counter/counter/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    print("rebuild");
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlocBuilder<CounterBloc, CounterState>(
            builder: (context, state) {
              return Text(
                "${state.counter.toString()}",
                style: const TextStyle(fontSize: 52),
              );
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  print("Rebuild1");
                  context.read<CounterBloc>().add(IncrementEvent());
                },
                child: Text("Inc"),
              ),
              ElevatedButton(
                onPressed: () {
                  print("Rebuild2");
                  context.read<CounterBloc>().add(DecrementEvent());
                },
                child: Text("Dec"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
