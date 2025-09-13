import 'package:flutter/material.dart';

class WeatherTheme {
  MaterialColor getWeatherColor(String? condition) {
    if (condition == null) {
      return Colors.blue;
    } else {
      switch (condition.toLowerCase()) {
        case "sunny":
        case "clear":
          return Colors.orange;

        case "partly cloudy":
        case "cloudy":
        case "overcast":
          return Colors.blueGrey;

        case "mist":
        case "fog":
        case "freezing fog":
          return Colors.grey;

        case "patchy rain possible":
        case "patchy light rain":
        case "light rain":
        case "moderate rain at times":
        case "moderate rain":
        case "heavy rain at times":
        case "heavy rain":
        case "light drizzle":
        case "patchy light drizzle":
        case "patchy freezing drizzle possible":
        case "light freezing rain":
        case "moderate or heavy freezing rain":
        case "torrential rain shower":
        case "light rain shower":
        case "moderate or heavy rain shower":
          return Colors.blue;

        case "patchy snow possible":
        case "light snow":
        case "moderate snow":
        case "heavy snow":
        case "patchy light snow":
        case "patchy moderate snow":
        case "patchy heavy snow":
        case "blowing snow":
        case "blizzard":
        case "light snow showers":
        case "moderate or heavy snow showers":
        case "patchy light snow with thunder":
        case "moderate or heavy snow with thunder":
          return Colors.lightBlue;

        case "patchy sleet possible":
        case "light sleet":
        case "moderate or heavy sleet":
        case "light sleet showers":
        case "moderate or heavy sleet showers":
          return Colors.teal;

        case "ice pellets":
        case "light showers of ice pellets":
        case "moderate or heavy showers of ice pellets":
          return Colors.indigo;

        case "thundery outbreaks possible":
        case "patchy light rain with thunder":
        case "moderate or heavy rain with thunder":
          return Colors.deepPurple;

        default:
          return Colors.blue;
      }
    }
  }
}
