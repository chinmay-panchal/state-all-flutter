import 'package:bloc_counter/counter/counter_event.dart';
import 'package:bloc_counter/counter/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState()) {
    on<CounterEvent>(_incrementDecrement);
  }

  void _incrementDecrement(CounterEvent event, Emitter<CounterState> emit) {
    if (event is IncrementEvent) {
      emit(state.copyWith(counter: state.counter + 1));
    } else if (event is DecrementEvent) {
      emit(state.copyWith(counter: state.counter - 1));
    }
  }
}
