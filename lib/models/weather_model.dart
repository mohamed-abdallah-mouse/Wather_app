class WeatherModel {
  final String cityName;
  final DateTime date;
  final String image;
  final double temb;
  final double windSpeed;
  final String weatherCondition;
  WeatherModel({
    required this.date,
    required this.image,
    required this.temb,
    required this.windSpeed,
    required this.weatherCondition,
    required this.cityName,
  });
  factory WeatherModel.json(json) {
    return WeatherModel(
      date: DateTime.parse(json['current']['last_updated']),
      image: json['current']['condition']['icon'],
      temb: (json['current']['temp_c'] as num).toDouble(),
      windSpeed: (json['current']['wind_kph'] as num).toDouble(),
      weatherCondition: json['current']['condition']['text'],
      cityName: json['location']['name'],
    );
  }
}
