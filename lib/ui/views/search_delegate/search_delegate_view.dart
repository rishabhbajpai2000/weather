import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'search_delegate_viewmodel.dart';

class SearchDelegateView extends StackedView<SearchDelegateViewModel> {
  const SearchDelegateView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SearchDelegateViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      ),
    );
  }

  @override
  SearchDelegateViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SearchDelegateViewModel();
}
