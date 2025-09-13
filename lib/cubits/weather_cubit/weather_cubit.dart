import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather_cubit/weather_state.dart';
import 'package:weather_app/models/weather_model.dart';

import '../../services/weather_services.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherModel? weatherModel;

  WeatherCubit() : super(IntialWeatherState());
  getWeather({required String cityName}) async {
    try {
      weatherModel = await WeatherServices().getCurrentWeather(cityName);
      emit(WeatherLoadedState());
    } catch (e) {
      emit(WeatherFailureState());
    }
  }
}
