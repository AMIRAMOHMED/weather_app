import 'dart:developer';

import 'package:dio/dio.dart';

import '../models/weather_model.dart';

class WeatherServices {

  final Dio dio;
  final String baseUrl = "http://api.weatherapi.com/v1";
  final String apiKey = "817962283a0e4aa2997170345232311";

  WeatherServices(this.dio);

  Future<WeatherModel?> getWeathear({required String cityName}) async {
    try {
      Response response =
          await dio.get("$baseUrl/forecast.json?key=$apiKey&q=$cityName");
      WeatherModel watherModel = WeatherModel.fromJson(response.data);
      return watherModel;
    } on DioException catch (e) {
      final String errMessage = e.response?.data['error']['message'] ??
          "opos there was an error ,,try later";
      throw Exception(errMessage);
    } catch (e) {
      log(e.toString());
      throw Exception("opos there was an error ,,try later");
    }
  }
}
