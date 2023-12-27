import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/views/get_started.dart';

import '../cubits/get_weather_states_cubit/get_weather_cubit.dart';
import '../cubits/get_weather_states_cubit/get_weather_states.dart';
import '../widgets/weather_info_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body:
        BlocBuilder<GetWeatherCubit, WeatherState>(builder: (context, state) {
      if (state is InitialState) {
        return const GETStarted();
      } else if (state is WeatherLoadedState) {
        return  WeatherInfoBody(
          weatherModel: state.weatherModel);}
        else if(state is WeatherLoadingState) {
        return const Center(
          child: Center(child: CircularProgressIndicator()),
        );

      } else {
        return const Text("oops no weather");
      }
    }));
  }
}
