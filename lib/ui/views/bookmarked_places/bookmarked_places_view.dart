import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:weather/ui/common/ui_helpers.dart';

import 'bookmarked_places_viewmodel.dart';

class BookmarkedPlacesView extends StackedView<BookmarkedPlacesViewModel> {
  const BookmarkedPlacesView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    BookmarkedPlacesViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Bookmarked Places",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        height: screenHeight(context),
        width: screenWidth(context),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black, Colors.blue],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SizedBox(
          height: 500,
          child: ListView.builder(
            itemCount: viewModel.getBookmarkedItemcount,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  color: Colors.white,

                  child: ListTile(
                    leading: Icon(
                      Icons.location_city,
                      color: Colors.black,
                    ),
                    title: GestureDetector(
                      onTap: (){
                        viewModel.getWeatherForLocation(location: viewModel.weatherService.bookMarkedLocations[index]);
                      
                      },
                      child: Row(
                        children: [
                          Text(
                            viewModel.weatherService.bookMarkedLocations[index],
                            style: TextStyle(color: Colors.black),
                          ),
                          Expanded(child: Container())
                        ],
                      ),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        viewModel.weatherService.bookMarkedLocations.remove(
                            viewModel
                                .weatherService.bookMarkedLocations[index]);
                        viewModel.notifyListeners();
                      },
                      icon: Icon(
                        Icons.delete,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  BookmarkedPlacesViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      BookmarkedPlacesViewModel();
}
