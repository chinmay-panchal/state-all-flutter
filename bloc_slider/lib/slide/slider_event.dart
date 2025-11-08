import 'package:equatable/equatable.dart';

class SliderEvent extends Equatable {
  const SliderEvent();
  @override
  List<Object?> get props => [];
}

class SliderIncDecEvent extends SliderEvent {
  final double opacity;

  const SliderIncDecEvent({this.opacity = 1});

  @override
  List<Object?> get props => [opacity];
}

class switchOnOffEvent extends SliderEvent {
  final bool isOn;

  const switchOnOffEvent({required this.isOn});

  @override
  List<Object?> get props => [isOn];
}
