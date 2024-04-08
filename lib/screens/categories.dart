import 'package:ebooks/api_services.dart';
import 'package:ebooks/blocs/categories_provider.dart';
import 'package:ebooks/elements/HeadingIconButtonWidget.dart';
import 'package:ebooks/elements/TopBarWidget.dart';
import 'package:ebooks/helpers/bubble_tab_indicator.dart';
import 'package:ebooks/models/book.dart';
import 'package:ebooks/models/category.dart';
import 'package:ebooks/models/type.dart';
import 'package:ebooks/screens/bookdetail.dart';
import 'package:ebooks/screens/categories_chips/categories_chips.dart';
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
    sizeW = MediaQuery.of(context).size.width;
    sizeH = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      child: Column(
        children: <Widget>[
          new TopBarWidget(title: 'Categories'),
          Container(
            height: 75,
            child: TabBar(
              indicatorWeight: 3,
              indicator: new BubbleTabIndicator(
                indicatorHeight: 35,
                padding: EdgeInsets.symmetric(horizontal: 4),
                indicatorColor: Theme.of(context).accentColor,
                tabBarIndicatorSize: TabBarIndicatorSize.label,
              ),
              labelColor: Theme.of(context).primaryColor,
              unselectedLabelColor: Theme.of(context).focusColor,
              controller: tabController,
              isScrollable: true,
              tabs: List<Widget>.generate(_fields!.length, (int index) {
                return new Tab(
                    child: Text(
                  _fields![index].name!,
                ));
              }),
            ),
          ),
          Container(
            height: 400,
            child: StreamBuilder(
                stream: bloc.categories,
                builder: (context, AsyncSnapshot<List<Category>> snapshot) {
                  if (!snapshot.hasData) {
                    return Text('Cargando');
                  }
                  return CategoriesChips(options: snapshot.data);
                }),
          )
          // Expanded(
          //   child: TabBarView(
          //       controller: tabController,
          //       children: List<Widget>.generate(_fields.length, (int index) {
          //         return fieldSelectedBooks(index);
          //       })),
          // )
        ],
      ),
    );
  }

  Widget fieldSelectedBooks(int index) {
    return ListView(
      padding: EdgeInsets.symmetric(vertical: 5),
      children: <Widget>[
        Container(
          height: 365,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _books!.length,
            itemBuilder: (context, ind) {
              return Padding(
                padding: EdgeInsets.only(left: 20),
                child: Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius:
                            BorderRadius.vertical(bottom: Radius.circular(5)),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              offset: Offset(0.0, 4.0),
                              blurRadius: 10.0,
                              color:
                                  Theme.of(context).hintColor.withOpacity(0.1)),
                        ],
                      ),
                      margin: EdgeInsets.only(bottom: 28),
                      height: 350,
                      width: 190,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(bottom: 10),
                            height: 246,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(5)),
                                image: DecorationImage(
                                    image: AssetImage(_books![ind].image!),
                                    fit: BoxFit.cover)),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    Text(
                                      _books![ind].title!,
                                      maxLines: 1,
                                      softWrap: false,
                                      overflow: TextOverflow.fade,
                                      style:
                                          Theme.of(context).textTheme.bodyText1,
                                    ),
                                    Text(
                                      _books![ind].author!,
                                      maxLines: 1,
                                      textAlign: TextAlign.end,
                                      softWrap: false,
                                      overflow: TextOverflow.fade,
                                      style:
                                          Theme.of(context).textTheme.caption,
                                    ),
                                  ],
                                  mainAxisSize: MainAxisSize.max,
                                ),
                                Text("\$ ${_books![ind].price}",
                                    style:
                                        Theme.of(context).textTheme.headline1),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: InkWell(
                        child: CircleAvatar(
                          maxRadius: 28,
                          backgroundColor: Theme.of(context).accentColor,
                          child: Icon(
                            _books![ind].listened == true
                                ? Icons.play_arrow
                                : Icons.subject,
                            color: Theme.of(context).primaryColor,
                            size: 28.8,
                          ),
                        ),
                        onTap: () {
                          // print(_books[index].listened.toString());
                          // Navigator.push(context, MaterialPageRoute(builder: (_) => DetailedBook(_books[ind])));
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: HeadingIconButtonWidget(
            text: Text(
              "DESCRIPTION",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            icon: Icon(
              Icons.description,
              color: Theme.of(context).hintColor,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            _fields![index].description!,
            style: Theme.of(context).textTheme.bodyText1,
            textAlign: TextAlign.justify,
          ),
        )
      ],
    );
  }
}

void _search() {}
