import 'package:ebooks/screens/accueiltabs/search_bar/search_bloc.dart';
import 'package:flutter/material.dart';

class SearchProvider extends InheritedWidget {
  final SearchBloc bloc;

  SearchProvider({Key? key, required Widget child})
      : bloc = SearchBloc(),
        super(key: key, child: child);

  bool updateShouldNotify(_) => true;

  static SearchBloc of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<SearchProvider>()!.bloc;
  }
}
