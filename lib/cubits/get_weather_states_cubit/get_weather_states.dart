import 'package:weather_app/models/weather_model.dart';

class WeatherState {}

class InitialState extends WeatherState {}

class WeatherLoadedState extends WeatherState {
  final WeatherModel weatherModel;

  WeatherLoadedState(this.weatherModel);
}

class WeatherLoadingState extends WeatherState {}

class WeatherFailureState extends WeatherState {
  final String errorMessage;

  WeatherFailureState(this.errorMessage);
}
