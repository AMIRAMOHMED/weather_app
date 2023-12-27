import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:weather_app/cubits/get_weather_states_cubit/get_weather_states.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_services.dart';

import '../../services/get_current_loction.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(InitialState());
  WeatherModel? weatherModel;


  getWeather({required String cityName}) async {
    try {
      weatherModel =
      await WeatherServices(Dio()).getWeathear(cityName: cityName);
      emit(WeatherLoadedState(weatherModel!));
    } catch (e) {
      emit(WeatherFailureState(e.toString()));
    }
  }

  void getWeatherFromLoction() async {
    emit(WeatherLoadingState());
    try {
      List<Placemark> placemark = await GetCurrentLoction().getCurrentLoction();
      weatherModel = await WeatherServices(Dio()).getWeathear(
          cityName: placemark[0].locality!);
      emit(WeatherLoadedState(weatherModel!));
    } catch (e) {
      emit(WeatherFailureState(e.toString()));
    }
  }


}