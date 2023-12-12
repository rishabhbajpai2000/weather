import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:stacked/stacked.dart';
import 'package:weather/services/Weather.dart';
import 'package:weather/ui/common/ui_helpers.dart';
import 'package:weather_icons/weather_icons.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  String location;
  HomeView({Key? key, required this.location}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: Text(
              viewModel.weather == null
                  ? "Loading..."
                  : viewModel.weather!.location,
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.black,
            actions: [
              IconButton(
                  onPressed: () {
                    viewModel.showSearchBar(context: context);
                  },
                  icon: Icon(
                    Icons.search,
                    color: Colors.white,
                  )),
              IconButton(
                  onPressed: () {
                    viewModel.seeBookmarkedLocations();
                  },
                  icon: Icon(
                    Icons.bookmark_outlined,
                    color: Colors.white,
                  ))
            ],
          ),
          body: Container(
            height: screenHeight(context),
            width: screenWidth(context),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black, Colors.blue],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: viewModel.weather == null
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                        Expanded(child: Container()),
                        Text(
                          viewModel.getDayAndDate(),
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          viewModel.getTime(),
                          style: TextStyle(color: Colors.white, fontSize: 40),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onLongPress: () {
                            viewModel.addToBookMark(
                                location: viewModel.weather!.location);
                          },
                          child: Text(
                            viewModel.weather!.location,
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            viewModel.addToBookMark(location:viewModel.weather!.location);
                          },
                          child: Container(
                            height: 300,
                            child: Icon(
                              viewModel.getWeatherIcon(),
                              color: Colors.white,
                              size: 200,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          viewModel.weather!.temperature + "°C",
                          style: TextStyle(color: Colors.white, fontSize: 80),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          viewModel.getDay(),
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        Expanded(child: Container())
                      ]),
          )),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();

  @override
  void onViewModelReady(HomeViewModel viewModel) {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      viewModel.fetchWeather(this.location);
    });
  }
}
