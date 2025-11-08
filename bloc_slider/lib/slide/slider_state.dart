import 'package:equatable/equatable.dart';

class SliderState extends Equatable {
  final double opacity;
  final bool isSwitchOn;

  const SliderState({this.opacity = 1, this.isSwitchOn = false});

  SliderState copyWith({double? opacity, bool? isSwitchOn}) {
    return SliderState(
      opacity: opacity ?? this.opacity,
      isSwitchOn: isSwitchOn ?? this.isSwitchOn,
    );
  }

  @override
  List<Object?> get props => [opacity, isSwitchOn];
}
