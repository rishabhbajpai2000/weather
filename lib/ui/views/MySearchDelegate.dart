import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:weather/app/app.locator.dart';
import 'package:weather/app/app.router.dart';

class MySearchDelegate extends SearchDelegate {
  final _navigationService = locator<NavigationService>();
  @override
  List<Widget>? buildActions(BuildContext context) {
    IconButton(
      icon: Icon(Icons.clear),
      onPressed: () {
        if (query.isEmpty) {
          close(context, '');
        } else {
          query = '';
        }
      },
    );
  }

  @override
  Widget? buildLeading(BuildContext context) {
    IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text(
      query,
      style: TextStyle(fontSize: 64, fontWeight: FontWeight.w200),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestions = [
      "London",
      "New York",
      "Paris",
      "Tokyo",
      "New Delhi",
      "Mumbai",
      "Bangalore",
      "Hyderabad",
      "Chennai",
      "Kolkata",
      "Pune",
      "Jaipur",
      "Ahmedabad",
      "Surat",
    ];
    return ListView.builder(
      itemBuilder: (context, index) {
        final suggestion = suggestions[index];
        return ListTile(
            onTap: () {
              query = suggestion;
              showResults(
                context,
              );
              _navigationService.replaceWithHomeView(location: query);
            },
            leading: Icon(Icons.location_city),
            title: Text(suggestion));
      },
      itemCount: suggestions.length,
    );
  }
}
