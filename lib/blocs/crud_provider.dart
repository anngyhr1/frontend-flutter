import 'package:ebooks/blocs/crud_bloc.dart';
import 'package:flutter/material.dart';

class CrudProvider extends InheritedWidget {
  final CrudBloc bloc;

  CrudProvider({Key? key, required Widget child})
      : bloc = CrudBloc(),
        super(key: key, child: child);

  bool updateShouldNotify(_) => true;

  static CrudBloc of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CrudProvider>()!.bloc;
  }
}
