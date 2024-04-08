import 'package:ebooks/api_services.dart';
import 'package:ebooks/blocs/categories_bloc.dart';
import 'package:ebooks/blocs/categories_provider.dart';
import 'package:ebooks/elements/FeaturedBooksItem.dart';
import 'package:ebooks/elements/TopBarWidget.dart';
import 'package:ebooks/models/book.dart';
import 'package:ebooks/models/storie_model.dart';
import 'package:ebooks/screens/loading_container.dart';
import 'package:ebooks/screens/refresh.dart';
import 'package:flutter/material.dart';

class SelectedLibrary extends StatelessWidget {
  @required
  String? idOfSelectedField;
  @required
  CategoriesBloc? categoriesBloc;
  SelectedLibrary(this.idOfSelectedField, this.categoriesBloc);
  @override

  //this books list should be list of book which include in my library for specific passed field
  // List<Book> _featured = new List();
  // value values = new value();

  @override
  Widget build(BuildContext context) {
    //final bloc = CategoriesProvider.of(context);
    categoriesBloc!.setCategorySelected(idOfSelectedField);
    categoriesBloc!.loadMore();
    return Scaffold(
      body: Column(
        children: <Widget>[
          TopBarWidget(
            title: 'My Library',
            hasBackButton: true,
          ),
          selectedBooks()
        ],
      ),
    );
  }

  selectedBooks() {
    return Expanded(
      child: StreamBuilder(
          stream: categoriesBloc!.storieList,
          builder: (context, AsyncSnapshot<List<StorieModel>> snapshot) {
            if (!snapshot.hasData) {
              //new List<int>.generate(10, (i) => i + 1).map((e) => LoadingContainer());
              return LoadingContainer();
            }
            return Refresh(
              bloc: categoriesBloc,
              child: ListView.builder(
                itemCount: snapshot.data!.length,
                controller: categoriesBloc!.scrollController,
                itemBuilder: (context, int index) {
                  return FeaturedBooksItem(storie: snapshot.data![index]);
                },
              ),
            );
          }),
    );
  }
}
