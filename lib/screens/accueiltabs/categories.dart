import 'package:ebooks/api_services.dart';
import 'package:ebooks/blocs/categories_provider.dart';
import 'package:ebooks/elements/TopBarWidget.dart';
import 'package:ebooks/elements/categoryBox.dart';
import 'package:ebooks/models/book.dart';

import 'package:ebooks/models/category.dart';
import 'package:ebooks/models/type.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoriesTab extends StatefulWidget {
  @override
  _CategoriesTabState createState() => _CategoriesTabState();
}

class _CategoriesTabState extends State<CategoriesTab>
    with SingleTickerProviderStateMixin {
  value values = new value();
  var sizeW;
  var sizeH;
  var tabController;
  List<Field>? _fields = [];
  List<Book>? _books = [];
  int enabledfield = 0;
  @override
  void initState() {
    super.initState();
    _fields = values.fieldss;
    tabController = TabController(length: _fields!.length, vsync: this);
    _books = values.bookss;
  }

  @override
  Widget build(BuildContext context) {
    final bloc = CategoriesProvider.of(context);
    bloc.loadCategories();
    var sizeW = MediaQuery.of(context).size.width;
    var sizeH = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      child: Column(
        children: <Widget>[
          new TopBarWidget(title: 'Categories'),
          Container(
            height: sizeH - 150,
            child: StreamBuilder(
                stream: bloc.categories,
                builder: (context, AsyncSnapshot<List<Category>> snapshot) {
                  if (!snapshot.hasData) {
                    return Text('Cargando');
                  }
                  return createTile(snapshot.data!);
                }),
          )
        ],
      ),
    );
  }
}

Widget createTile(List<Category> categories) {
  return Padding(
    padding: const EdgeInsets.all(30.0),
    child: GridView.count(
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      childAspectRatio: 5 / 2,
      // Create a grid with 2 columns. If you change the scrollDirection to
      // horizontal, this produces 2 rows.
      crossAxisCount: 2,
      // Generate 100 widgets that display their index in the List.
      children: List.generate(categories.length, (index) {
        return Center(
          child: CategoryBox(
            category: categories[index],
            // style: Theme.of(context).textTheme.headline5,
          ),
        );
      }),
    ),
  );
}
