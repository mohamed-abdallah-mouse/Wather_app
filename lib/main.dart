import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather_cubit/weather_cubit.dart';
import 'package:weather_app/cubits/weather_cubit/weather_state.dart';

import 'screens/home_page.dart';
import 'theme/theme.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});
  @override
  Widget build(BuildContext context) {
    final WeatherTheme theme = WeatherTheme();
    return BlocProvider(
      create: (context) => WeatherCubit(),
      child: Builder(
        builder: (BuildContext context) {
          return BlocBuilder<WeatherCubit, WeatherState>(
            builder: (context, state) {
              return MaterialApp(
                theme: ThemeData(
                  primarySwatch: WeatherTheme().getWeatherColor(
                    BlocProvider.of<WeatherCubit>(
                      context,
                    ).weatherModel?.weatherCondition,
                  ),

                  useMaterial3: false,
                ),
                debugShowCheckedModeBanner: false,
                home: HomePage(),
              );
            },
          );
        },
      ),
    );
  }
}
