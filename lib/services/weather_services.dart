import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherServices {
  final String uRL = 'https://api.weatherapi.com/v1';
  final String key = 'ac053cbf55154ae8aff150454252109';

  Dio dio = Dio();
  Future<WeatherModel> getCurrentWeather(final String cityName) async {
    try {
      Response response = await dio.get(
        '$uRL/current.json?key=$key&q=$cityName',
      );
      WeatherModel weatherModel = WeatherModel.json(response.data);
      debugPrint('----------------${response.statusCode}');
      debugPrint("Raw Response: ${response.data}");

      return weatherModel;
    } on DioException catch (e) {
      final String errorMessage =
          e.response?.data['error']['message'] ?? 'error';
      throw Exception(errorMessage);
    } catch (e) {
      log(e.toString());
      throw Exception(e.toString());
    }
  }
}
