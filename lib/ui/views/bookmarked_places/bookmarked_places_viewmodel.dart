import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:weather/app/app.locator.dart';
import 'package:weather/app/app.router.dart';
import 'package:weather/services/weather_service.dart';

class BookmarkedPlacesViewModel extends BaseViewModel {
  final WeatherService weatherService = locator<WeatherService>();
  get getBookmarkedItemcount => weatherService.getBookmarkedItemcount;
  final NavigationService _navigationService = locator<NavigationService>();

  void getWeatherForLocation({required String location}) {
    _navigationService.navigateToHomeView(location: location);
  }
}
