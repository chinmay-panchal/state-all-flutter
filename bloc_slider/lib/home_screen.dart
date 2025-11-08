import 'package:bloc_slider/slide/slider_bloc.dart';
import 'package:bloc_slider/slide/slider_event.dart';
import 'package:bloc_slider/slide/slider_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool switchon = false;
  double opacity = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlocBuilder<SliderBloc, SliderState>(
            buildWhen: (previous, current) =>
                previous.isSwitchOn != current.isSwitchOn,
            builder: (context, state) {
              print("build1");
              return Switch(
                value: state.isSwitchOn,
                onChanged: (value) {
                  context.read<SliderBloc>().add(switchOnOffEvent(isOn: value));
                },
              );
            },
          ),
          SizedBox(height: 4),
          Center(
            child: BlocBuilder<SliderBloc, SliderState>(
              buildWhen: (previous, current) =>
                  previous.opacity != current.opacity,
              builder: (context, state) {
                print("build2");
                return Container(
                  height: 100,
                  width: 100,
                  color: Colors.black.withValues(alpha: state.opacity),
                );
              },
            ),
          ),
          SizedBox(height: 8),
          SizedBox(
            width: 200,
            child: BlocBuilder<SliderBloc, SliderState>(
              buildWhen: (previous, current) =>
                  previous.opacity != current.opacity,
              builder: (context, state) {
                print("build 3");
                return Slider(
                  value: state.opacity,
                  onChanged: (value) {
                    context.read<SliderBloc>().add(
                      SliderIncDecEvent(opacity: value),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
