import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather_cubit/weather_cubit.dart';
import 'package:weather_app/models/weather_model.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});
  WeatherModel? weatherModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('search by city')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: TextField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(16),
              hint: Text('please enter a city'),
              suffixIcon: Icon(Icons.search),
              labelText: 'search',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onSubmitted: (value) async {
              var getWeatherCubit = await BlocProvider.of<WeatherCubit>(
                context,
              );
              getWeatherCubit.getWeather(cityName: value);
              Navigator.pop(context);
            },
          ),
        ),
      ),
    );
  }
}
