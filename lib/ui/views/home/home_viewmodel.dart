import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/icon_data.dart';
import 'package:intl/intl.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:weather/app/app.locator.dart';
import 'package:weather/app/app.router.dart';
import 'package:weather/services/Weather.dart';
import 'package:weather/services/weather_service.dart';
import 'package:stacked/stacked.dart';
import 'package:weather/ui/views/MySearchDelegate.dart';
import 'package:weather_icons/weather_icons.dart';

class HomeViewModel extends BaseViewModel {
  final _weatherService = locator<WeatherService>();
  Weather? weather;
  final _navigationService = locator<NavigationService>();
  void fetchWeather(String city) async {
    weather = await _weatherService.fetchWeather(city);
    rebuildUi();
  }

  String getDay() {
    return DateFormat('EEEE')
        .format(DateTime.parse(weather!.localTime))
        .toString();
  }

  String getDayAndDate() {
    return DateFormat('EEEE, d MMMM')
        .format(DateTime.parse(weather!.localTime))
        .toString();
  }

  String getTime() {
    return DateFormat('h:mm a')
        .format(DateTime.parse(weather!.localTime))
        .toString();
  }

  IconData? getWeatherIcon() {
    return weather?.getWeatherIcon();
  }

  void showSearchBar({required BuildContext context}) {
    showSearch(context: context, delegate: MySearchDelegate());
  }

  void addToBookMark({required String location}) {
    _weatherService.addToBookMark(location: location);
  }

  void seeBookmarkedLocations() {
    _navigationService.navigateToBookmarkedPlacesView();
  }
}
