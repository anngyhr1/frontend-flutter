import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:ebooks/api_services.dart';
import 'package:ebooks/blocs/welcome_bloc.dart';
import 'package:ebooks/blocs/welcome_provider.dart';
import 'package:ebooks/elements/BooksForYouItem.dart';
import 'package:ebooks/elements/FeaturedBooksItem.dart';
import 'package:ebooks/elements/HeadingIconButtonWidget.dart';
import 'package:ebooks/elements/TopBarWidget.dart';
import 'package:ebooks/models/book.dart';
import 'package:ebooks/models/storie_model.dart';
import 'package:ebooks/models/type.dart';
import 'package:ebooks/screens/accueiltabs/featured_list.dart';
import 'package:ebooks/screens/accueiltabs/most_liked.dart';
import 'package:ebooks/screens/accueiltabs/storie_tapped.dart';
import 'package:ebooks/screens/bookdetail.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';

class HomeTab extends StatefulWidget {
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  var sizeW;
  var sizeH;
  var enabledFeatured = 0;

  List<Book> _mostlistened = [
    Book(
        image: "assets/image1.jpg",
        price: 12.0,
        exprice: 09.00,
        title: "My Morning Sleep",
        author: "Philipp Anthropy",
        rate: 3,
        dure: "12:23:22",
        description:
            "open source run-time environment for executing Javascript code on the server side."),
    Book(
        image: "assets/image3.jpg",
        exprice: 09.00,
        title: "Holiday Logs",
        author: "Philipp Anthropy",
        rate: 3.5,
        dure: "12:23:22",
        description:
            "open source run-time environment for executing Javascript code on the server side. "),
    Book(
        image: "assets/image4.jpg",
        price: 0,
        exprice: 09.00,
        title: "Holiday Logs",
        author: "Philipp Anthropy",
        rate: 1,
        dure: "12:23:22",
        description:
            "open source run-time environment for executing Javascript code on the server side."),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    sizeW = MediaQuery.of(context).size.width;
    sizeH = MediaQuery.of(context).size.height;

    return Container(
        decoration:
            BoxDecoration(color: Theme.of(context).scaffoldBackgroundColor),
        child: Column(
          children: <Widget>[
            new TopBarWidget(title: 'Home'),
            homelist(context)
          ],
        ));
  }

  homelist(BuildContext context) {
    final welcomeBloc = WelcomeProvider.of(context);
    welcomeBloc.loadMostLiked();
    welcomeBloc.loadMostViewed();
    welcomeBloc.loadRecentPopular();
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
              child: HeadingIconButtonWidget(
                text: Text(
                  "Para ti",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                icon: Icon(
                  Icons.card_giftcard,
                  color: Theme.of(context).hintColor,
                ),
                showActions: true,
              ),
            ),
            SizedBox(
                height: 190,
                child: MostLiked(
                  stream: welcomeBloc.mostLikedStories,
                  streamTapped: welcomeBloc.mLikedStorieTapped,
                  setTapped: welcomeBloc.setMLikedStorieTapped,
                )),
            StorieTapped(welcomeBloc: welcomeBloc),
            // Padding(
            //   padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
            //   child: HeadingIconButtonWidget(
            //     text: Text(
            //       "CHOOSE WHAT YOU WANT",
            //       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            //     ),
            //     icon: Icon(
            //       Icons.folder_open,
            //       color: Theme.of(context).hintColor,
            //     ),
            //     showActions: true,
            //   ),
            // ),
            // SizedBox(
            //   height: 43.2,
            //   child: Container(
            //     child: ListView.builder(
            //         physics: ClampingScrollPhysics(),
            //         scrollDirection: Axis.horizontal,
            //         itemCount: _fielsd.length % 2 == 0
            //             ? _fielsd.length ~/ 2
            //             : _fielsd.length ~/ 2 + 1,
            //         itemBuilder: (BuildContext context, int index) {
            //           return itemField(context, index, 1);
            //         }),
            //   ),
            // ),
            // SizedBox(
            //   height: 43.2,
            //   child: Container(
            //     child: ListView.builder(
            //         physics: ClampingScrollPhysics(),
            //         scrollDirection: Axis.horizontal,
            //         itemCount: _fielsd.length ~/ 2,
            //         itemBuilder: (BuildContext context, int index) {
            //           int i = _fielsd.length % 2 == 0
            //               ? _fielsd.length ~/ 2
            //               : _fielsd.length ~/ 2 + 1;
            //           i = i + index;
            //           return itemField(context, i, 2);
            //         }),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: HeadingIconButtonWidget(
                text: Text(
                  "Destacados",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                icon: Icon(
                  Icons.bookmark_border,
                  color: Theme.of(context).hintColor,
                ),
              ),
            ),
            SizedBox(
              height: 216,
              child: CarrouselList(
                stream: welcomeBloc.mostViewedStories,
                streamScroll: welcomeBloc.mostViewedCurrPage,
                setMostViewedCurrPage: welcomeBloc.setMostViewedCurrPage,
              ),
              //featuredList(context),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: HeadingIconButtonWidget(
                text: Text(
                  "Top 3",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                icon: Icon(
                  Icons.headset,
                  color: Theme.of(context).hintColor,
                ),
              ),
            ),
            ListView.builder(
              primary: false,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: _mostlistened.length,
              itemBuilder: (context, index) {
                return itemMostListened(context, index);
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: HeadingIconButtonWidget(
                text: Text(
                  "Recientes",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                icon: Icon(
                  Icons.bookmark_border,
                  color: Theme.of(context).hintColor,
                ),
              ),
            ),
            //SizedBox(
            //  height: 216,
            //  child: CarrouselList(
            //    stream: welcomeBloc.recentPopularStories,
            //    streamScroll: welcomeBloc.recentPopularCurrPage,
            //    setMostViewedCurrPage: welcomeBloc.setRecentPopCurrPage,
            //  ),
            //  //featuredList(context),
            //),
          ],
        ),
      ),
    );
  }

  itemMostListened(BuildContext context, int index) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: 122,
                height: 165,
                margin: EdgeInsets.only(right: 20),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(_mostlistened[index].image!),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.all(Radius.circular(5))),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      _mostlistened[index].title!,
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                    ),
                    Text(
                      _mostlistened[index].description!,
                      style: TextStyle(height: 1.4, fontSize: 12.5),
                    ),
                    SizedBox(
                      height: 7.2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          _mostlistened[index].dure!,
                          style:
                              TextStyle(color: Theme.of(context).accentColor),
                        ),
                        (_mostlistened[index].price == null) ||
                                (_mostlistened[index].price == 0)
                            ? Container(
                                width: 54,
                                padding: EdgeInsets.only(
                                    top: 2.88,
                                    bottom: 2.88,
                                    right: 3.6,
                                    left: 3.6),
                                child: Center(
                                  child: Text(
                                    "Free",
                                    style: TextStyle(
                                        color: Theme.of(context).accentColor),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Theme.of(context).accentColor,
                                    ),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(16.0))),
                              )
                            : Text(
                                "\$${_mostlistened[index].price.toString()}",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: Theme.of(context).accentColor),
                              )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Divider(
            height: 36,
          )
        ],
      ),
    );
  }
}
