import 'package:ebooks/blocs/categories_bloc.dart';
import 'package:flutter/material.dart';

class CategoriesProvider extends InheritedWidget {
  final CategoriesBloc bloc;

  CategoriesProvider({Key? key, required Widget child})
      : bloc = CategoriesBloc(),
        super(key: key, child: child);

  bool updateShouldNotify(_) => true;

  static CategoriesBloc of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CategoriesProvider>()!
        .bloc;
  }
}
