import 'package:weather/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:weather/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:weather/ui/views/home/home_view.dart';
import 'package:weather/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:weather/services/weather_service.dart';
import 'package:weather/ui/views/search_delegate/search_delegate_view.dart';
import 'package:weather/ui/views/bookmarked_places/bookmarked_places_view.dart';
// @stacked-import

@StackedApp(
  logger: StackedLogger(),
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: SearchDelegateView),
    MaterialRoute(page: BookmarkedPlacesView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: WeatherService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
