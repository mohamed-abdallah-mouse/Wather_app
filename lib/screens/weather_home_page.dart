import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather_cubit/weather_cubit.dart';
import 'package:weather_app/theme/theme.dart';

class WeatherHomePage extends StatelessWidget {
  const WeatherHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final weatherModel = BlocProvider.of<WeatherCubit>(context).weatherModel;
    if (weatherModel == null) {
      return const Center(child: CircularProgressIndicator());
    }
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            WeatherTheme()
                .getWeatherColor(
                  BlocProvider.of<WeatherCubit>(
                    context,
                  ).weatherModel?.weatherCondition,
                )
                .shade500,
            WeatherTheme()
                .getWeatherColor(
                  BlocProvider.of<WeatherCubit>(
                    context,
                  ).weatherModel?.weatherCondition,
                )
                .shade50,
          ],
          end: Alignment.bottomCenter,
          begin: Alignment.topCenter,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(weatherModel.cityName, style: TextStyle(fontSize: 25)),
          Text(
            'Updated at ${weatherModel.date.hour}:${weatherModel.date.minute}',
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ClipRRect(
                  child: Image.network(
                    "https:${weatherModel.image}",
                    fit: BoxFit.cover,
                    height: 60,
                    width: 60,
                  ),
                ),
                Text('${weatherModel.temb}', style: TextStyle(fontSize: 25)),
                Text('windSpeed: ${weatherModel.windSpeed}'),
              ],
            ),
          ),
          Text(weatherModel.weatherCondition, style: TextStyle(fontSize: 20)),
        ],
      ),
    );
  }
}
