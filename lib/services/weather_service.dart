import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:weather/app/app.logger.dart';
import 'package:http/http.dart' as http;
import 'package:weather/services/Weather.dart';

class WeatherService {
  final _logger = getLogger('WeatherService');
  // this is a list of bookmarked locations. it by default will start with paris.
  List<String> bookMarkedLocations = ["Paris"];
  get getBookmarkedItemcount => bookMarkedLocations.length;

  // this function will fetch the weather from the api.
  Future<Weather> fetchWeather(String location) async {
    final response = await http.get(Uri.parse(
        'http://api.weatherstack.com/current?access_key=49506877b9db724fb8fc3760e10a1423&query=$location'));

    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      Weather weather = Weather.fromJson(body);
      // _logger.i(weather.toString());
      return weather;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load weather');
    }
  }

  void addToBookMark({required String location}) {
    if (bookMarkedLocations.contains(location)) {
      Fluttertoast.showToast(
        msg: "Already Bookmarked",
      );
      return;
    } else {
      bookMarkedLocations.add(location);
      Fluttertoast.showToast(
        msg: "Added to Bookmarks",
      );
      return;
    }
  }
}
