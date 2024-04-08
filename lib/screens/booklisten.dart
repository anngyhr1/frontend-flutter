import 'dart:ui';

import 'package:ebooks/api_services.dart';
import 'package:ebooks/elements/TopBarWidget.dart';
import 'package:ebooks/models/book.dart';
import 'package:ebooks/models/chapter.dart';
import 'package:ebooks/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BookListen extends StatefulWidget {
  Book playing_book;
  BookListen(this.playing_book);
  @override
  _BookListenState createState() => _BookListenState(this.playing_book);
}

class _BookListenState extends State<BookListen> {
  var sizeW;
  var sizeH;
  User? user;
  value values = new value();
  Book playing_book;
  List<Chapter>? chapters = [];
  _BookListenState(this.playing_book);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    user = values.usser;
    chapters = values.chapterss;
  }

  @override
  Widget build(BuildContext context) {
    var sizeH = MediaQuery.of(context).size.height;
    var sizeW = MediaQuery.of(context).size.width;
    return Scaffold(
      body: MediaQuery.of(context).orientation == Orientation.portrait
          ? Column(
              children: <Widget>[
                Stack(
                  alignment: AlignmentDirectional.bottomEnd,
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.only(bottom: 30),
                        height: 380,
                        decoration: new BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(sizeW * 0.1)),
                          image: new DecorationImage(
                              image: new AssetImage(playing_book.image!),
                              fit: BoxFit.cover),
                        ),
                        child: new Center(
                            child: ClipRRect(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(sizeW * 0.1)),
                          child: new Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  // Add one stop for each color. Stops should increase from 0 to 1
                                  stops: [0.1, 0.4, 0.7, 1],
                                  colors: [
                                    // Colors are easy thanks to Flutter's Colors class.
                                    Theme.of(context)
                                        .primaryColor
                                        .withOpacity(0.8),
                                    Theme.of(context)
                                        .primaryColor
                                        .withOpacity(0.2),
                                    Theme.of(context)
                                        .primaryColor
                                        .withOpacity(0.1),
                                    Colors.transparent,
                                  ],
                                ),
                              ),
                              child: new SizedBox(
                                width: double.infinity,
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(
                                    sigmaX: 5.0,
                                    sigmaY: 5.0,
                                  ),
                                  child: new Center(
                                    child: Column(
                                      children: <Widget>[
                                        TopBarWidget(
                                            title: 'Now Playing',
                                            hasBackButton: true,
                                            transparent: true),
                                        Container(
                                          width: 120,
                                          height: 165,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      playing_book.image!),
                                                  fit: BoxFit.cover)),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional.topStart,
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                left: sizeW * 0.1),
                                            child: Text(
                                              playing_book.title!,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline3,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: sizeH * 0.015,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: sizeW * 0.1),
                                          child: Row(
                                            children: <Widget>[
                                              CircleAvatar(
                                                backgroundImage:
                                                    AssetImage(user!.image!),
                                                radius: 22,
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Text(
                                                    playing_book.author!,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyText1,
                                                  ),
                                                  Text(
                                                    "Duration: 05:01:13",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .caption,
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )),
                        ))),
                    Container(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: Theme.of(context).accentColor,
                          child: Icon(
                            Icons.play_arrow,
                            color: Theme.of(context).primaryColor,
                            size: sizeW * 0.1,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Expanded(
                    child: ListView.builder(
                  itemCount: chapters!.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: sizeW * 0.04),
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(
                                  flex: 6,
                                  child: Text(
                                    "${index + 1} -  ${chapters![index].name}",
                                    style: TextStyle(fontSize: 15),
                                  )),
                              Expanded(
                                  flex: 2,
                                  child: Text(
                                    chapters![index].dure!,
                                    style: TextStyle(fontSize: 12),
                                  )),
                              Expanded(
                                flex: 1,
                                child: Icon(
                                  chapters![index].islocked!
                                      ? Icons.lock
                                      : Icons.more_horiz,
                                  size: sizeW * 0.05,
                                  color: chapters![index].islocked!
                                      ? Theme.of(context).accentColor
                                      : null,
                                ),
                              )
                            ],
                          ),
                          Divider(
                            height: sizeH * 0.06,
                          )
                        ],
                      ),
                    );
                  },
                ))
              ],
            )
          : SingleChildScrollView(
              child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
              SizedBox(
                height: 378,
                child: Stack(
                  children: <Widget>[
                    Container(
                        height: 347,
                        width: sizeW,
                        decoration: new BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(sizeW * 0.1)),
                          image: new DecorationImage(
                              image: new AssetImage(playing_book.image!),
                              fit: BoxFit.cover),
                        ),
                        child: new Center(
                            child: ClipRRect(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(sizeW * 0.1)),
                          child: new Container(
                              height: 347,
                              width: sizeW,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  // Add one stop for each color. Stops should increase from 0 to 1
                                  stops: [0.1, 0.5, 0.7, 0.9],
                                  colors: [
                                    // Colors are easy thanks to Flutter's Colors class.
                                    Colors.black.withOpacity(0.6),
                                    Colors.black.withOpacity(0.4),
                                    Colors.black.withOpacity(0.2),
                                    Colors.black.withOpacity(0.1),
                                  ],
                                ),
                              ),
                              child: new SizedBox(
                                height: 247,
                                width: sizeW - 14.4,
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(
                                    sigmaX: 5.0,
                                    sigmaY: 5.0,
                                  ),
                                  child: new Center(
                                    child: Column(
                                      children: <Widget>[
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 36,
                                              right: sizeW * 0.04,
                                              left: sizeW * 0.04),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              InkWell(
                                                child: SvgPicture.asset(
                                                    "assets/svgs/back.svg"),
                                                onTap: () =>
                                                    Navigator.pop(context),
                                              ),
                                              Text(
                                                "Now Playing",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18),
                                              ),
                                              InkWell(
                                                child: SvgPicture.asset(
                                                    "assets/svgs/search.svg"),
                                                onTap: _search,
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: sizeH * 0.03,
                                        ),
                                        Container(
                                          width: 108,
                                          height: 136.8,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      playing_book.image!),
                                                  fit: BoxFit.cover)),
                                        ),
                                        SizedBox(
                                          height: 14.4,
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional.topStart,
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                left: sizeW * 0.1),
                                            child: Text(
                                              playing_book.title!,
                                              style: TextStyle(
                                                  fontSize: 21.6,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: sizeW * 0.1),
                                          child: Row(
                                            children: <Widget>[
                                              CircleAvatar(
                                                backgroundImage:
                                                    AssetImage(user!.image!),
                                                radius: 20,
                                              ),
                                              SizedBox(
                                                width: 14.4,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Text(
                                                    playing_book.author!,
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.white),
                                                  ),
                                                  SizedBox(
                                                    height: 5.4,
                                                  ),
                                                  Text(
                                                    playing_book.author! +
                                                        " I dont know ",
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.white),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )),
                        ))),
                    Container(
                      width: sizeW,
                      height: 378,
                      child: Align(
                        alignment: AlignmentDirectional.bottomEnd,
                        child: Padding(
                          padding: EdgeInsets.only(right: sizeW * 0.08),
                          child: CircleAvatar(
                            radius: 35,
                            foregroundColor: Theme.of(context).accentColor,
                            child: Icon(
                              Icons.play_arrow,
                              color: Colors.white,
                              size: 36,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              ListView.builder(
                primary: false,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: chapters!.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: sizeW * 0.04),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Expanded(
                                flex: 6,
                                child: Text(
                                  "${index + 1} -  ${chapters![index].name}",
                                  style: TextStyle(fontSize: 15),
                                )),
                            Expanded(
                                flex: 2,
                                child: Text(
                                  chapters![index].dure!,
                                  style: TextStyle(fontSize: 12),
                                )),
                            Expanded(
                              flex: 1,
                              child: Icon(
                                chapters![index].islocked!
                                    ? Icons.lock
                                    : Icons.more_horiz,
                                size: sizeW * 0.05,
                                color: chapters![index].islocked!
                                    ? Theme.of(context).accentColor
                                    : null,
                              ),
                            )
                          ],
                        ),
                        Divider(
                          height: sizeH * 0.06,
                        )
                      ],
                    ),
                  );
                },
              ),
            ])),
    );
  }

  void _search() {}
}
