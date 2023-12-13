import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

class Weather {
  int timeEpoch;
  String temperature;
  String weatherConditions;
  String windSpeed;
  String location;
  String weatherIconLink;
  String localTime;
  int weatherCode;

  Weather(
      {required this.timeEpoch,
      required this.temperature,
      required this.weatherConditions,
      required this.windSpeed,
      required this.location,
      required this.weatherIconLink,
      required this.localTime,
      required this.weatherCode});

  // this class can be made from a json object as well.
  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
        timeEpoch: json['location']['localtime_epoch'],
        temperature: json['current']['temperature'].toString(),
        weatherConditions: json['current']['weather_descriptions'][0],
        windSpeed: json['current']['wind_speed'].toString(),
        location: json['location']['name'],
        weatherIconLink: json['current']['weather_icons'][0],
        localTime: json['location']['localtime'],
        weatherCode: json['current']['weather_code']);
  }

  // make a function that will be used with .toSting() to print the weather object.
  @override
  String toString() {
    return '''Weather(time: $timeEpoch, 
              \n temperature: $temperature, 
              \n weatherConditions: $weatherConditions, 
              \n windSpeed: $windSpeed, 
              \n location: $location, 
              \n weatherIconLink: $weatherIconLink 
              \n localTime: $localTime 
              \n weather_code: $weatherCode)''';
  }

  IconData? getWeatherIcon() {
    switch (weatherCode) {
      case 113:
        return WeatherIcons.day_sunny;
      case 116:
        return WeatherIcons.day_cloudy;
      case 119:
        return WeatherIcons.cloud;
      case 122:
        return WeatherIcons.cloudy;
      case 143:
        return WeatherIcons.fog;
      case 176:
        return WeatherIcons.rain;
      case 179:
      case 182:
      case 185:
        return WeatherIcons.sleet;
      case 200:
        return WeatherIcons.thunderstorm;
      case 227:
      case 230:
        return WeatherIcons.snow;
      case 248:
      case 260:
        return WeatherIcons.fog;
      case 263:
      case 266:
      case 281:
      case 284:
        return WeatherIcons.rain;
      case 293:
      case 296:
        return WeatherIcons.day_showers;
      case 299:
      case 302:
      case 305:
      case 308:
        return WeatherIcons.day_rain;
      case 311:
        return WeatherIcons.rain;
      default:
        return WeatherIcons.day_sunny;
    }
  }
}
