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
  int weather_code;

  Weather(
      {required this.timeEpoch,
      required this.temperature,
      required this.weatherConditions,
      required this.windSpeed,
      required this.location,
      required this.weatherIconLink,
      required this.localTime,
      required this.weather_code});

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
        weather_code: json['current']['weather_code']);
  }

  // make a function that will be used with .toSting() to print the weather object.
  @override
  String toString() {
    return 'Weather(time: $timeEpoch, \n temperature: $temperature, \n weatherConditions: $weatherConditions, \n windSpeed: $windSpeed, \n location: $location, \n weatherIconLink: $weatherIconLink \n localTime: $localTime \n weather_code: $weather_code) ';
  }

  IconData? getWeatherIcon() {
    if (weather_code == 113) {
      return WeatherIcons.day_sunny;
    }
    if (weather_code == 116) {
      return WeatherIcons.day_cloudy;
    }
    if (weather_code == 119) {
      return WeatherIcons.cloud;
    }
    if (weather_code == 122) {
      return WeatherIcons.cloudy;
    }
    if (weather_code == 143) {
      return WeatherIcons.fog;
    }
    if (weather_code == 176) {
      return WeatherIcons.rain;
    }
    if (weather_code == 179) {
      return WeatherIcons.sleet;
    }
    if (weather_code == 182) {
      return WeatherIcons.sleet;
    }
    if (weather_code == 185) {
      return WeatherIcons.sleet;
    }
    if (weather_code == 200) {
      return WeatherIcons.thunderstorm;
    }
    if (weather_code == 227) {
      return WeatherIcons.snow;
    }
    if (weather_code == 230) {
      return WeatherIcons.snow;
    }
    if (weather_code == 248) {
      return WeatherIcons.fog;
    }
    if (weather_code == 260) {
      return WeatherIcons.fog;
    }
    if (weather_code == 263) {
      return WeatherIcons.rain;
    }
    if (weather_code == 266) {
      return WeatherIcons.rain;
    }
    if (weather_code == 281) {
      return WeatherIcons.rain;
    }
    if (weather_code == 284) {
      return WeatherIcons.rain;
    }
    if (weather_code == 293) {
      return WeatherIcons.day_showers;
    }
    if (weather_code == 296) {
      return WeatherIcons.day_showers;
    }
    if (weather_code == 299) {
      return WeatherIcons.day_rain;
    }

    if (weather_code == 302) {
      return WeatherIcons.day_rain;
    }
    if (weather_code == 305) {
      return WeatherIcons.day_rain;
    }
    if (weather_code == 308) {
      return WeatherIcons.day_rain;
    }
    if (weather_code == 311) {
      return WeatherIcons.rain;
    }
    return WeatherIcons.day_sunny;
  }
}
