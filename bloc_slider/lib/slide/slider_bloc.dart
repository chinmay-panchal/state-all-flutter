import 'package:bloc_slider/slide/slider_event.dart';
import 'package:bloc_slider/slide/slider_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SliderBloc extends Bloc<SliderEvent, SliderState> {
  SliderBloc() : super(SliderState()) {
    on<SliderIncDecEvent>((event, emit) {
      emit(state.copyWith(opacity: event.opacity));
    });
    on<switchOnOffEvent>((_switchEvents));
  }

  void _switchEvents(switchOnOffEvent event, Emitter<SliderState> emit) {
    emit(state.copyWith(isSwitchOn: event.isOn));
  }
}
