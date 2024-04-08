import 'dart:ui';

import 'package:ebooks/api_services.dart';
import 'package:ebooks/elements/TopBarWidget.dart';
import 'package:ebooks/models/book.dart';
import 'package:ebooks/models/chapter.dart';
import 'package:flutter/material.dart';

class PlayerPage extends StatefulWidget {
  Book book;
  PlayerPage(this.book);
  @override
  _PlayerPageState createState() => _PlayerPageState(this.book);
}

class _PlayerPageState extends State<PlayerPage> {
  Book playing_book;
  List<Chapter>? _chapters = [];
  var sizeW;
  late var sizeH;
  late bool isplaying;
  value values = new value();
  _PlayerPageState(this.playing_book);
  @override
  void initState() {
    super.initState();
    isplaying = false;
    _chapters = values.chapterss;
  }

  @override
  Widget build(BuildContext context) {
    sizeH = MediaQuery.of(context).size.height;
    sizeW = MediaQuery.of(context).size.width;
    return Scaffold(
        body: MediaQuery.of(context).orientation == Orientation.portrait
            ? Column(
                children: <Widget>[
                  playerHead(),
                  Container(
                    height: 36,
                    child: Padding(
                      padding: EdgeInsets.all(7.2),
                      child: Text(
                        "My List",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  mylist()
                ],
              )
            : SingleChildScrollView(
                child:
                    Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                SizedBox(height: 300, child: playerHead()),
                SizedBox(
                  height: 35,
                  child: Container(
                    height: 36,
                    child: Padding(
                      padding: EdgeInsets.all(7.2),
                      child: Text(
                        "My List",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                ListView.builder(
                  primary: false,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: _chapters!.length,
                  itemBuilder: (context, index) {
                    return itemchapters(index);
                  },
                ),
              ])));
  }

  playerHead() {
    return Container(
        height: 330,
        decoration: new BoxDecoration(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25)),
            image: new DecorationImage(
                image: new AssetImage(playing_book.image!), fit: BoxFit.cover)),
        child: new Center(
            child: ClipRRect(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25)),
          child: new Container(
              width: sizeW,
              height: 330,
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(25)),
                gradient: LinearGradient(
                  // Where the linear gradient begins and ends
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
                width: sizeW - 14.4,
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
                          transparent: true,
                        ),
                        SizedBox(
                          height: 36,
                        ),
                        Padding(
                          padding: EdgeInsets.all(14.4),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "12:30",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14),
                              ),
                              Icon(
                                Icons.skip_previous,
                                color: Colors.white,
                                size: 28.8,
                              ),
                              InkWell(
                                child: Container(
                                    width: 72,
                                    height: 72,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.white, width: 3),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(36))),
                                    child: Icon(
                                      isplaying
                                          ? Icons.pause
                                          : Icons.play_arrow,
                                      color: Colors.white,
                                      size: 36,
                                    )),
                                onTap: () {
                                  setState(() {
                                    isplaying
                                        ? isplaying = false
                                        : isplaying = true;
                                  });
                                },
                              ),
                              Icon(
                                Icons.skip_next,
                                color: Colors.white,
                                size: 28.8,
                              ),
                              Text(
                                "03:12",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 28.8,
                        ),
                        Text(
                          playing_book.title!,
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                        SizedBox(
                          height: 10.8,
                        ),
                        Text(
                          playing_book.author!,
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              )),
        )));
  }

  mylist() {
    return Expanded(
      child: ListView.builder(
        itemCount: _chapters!.length,
        itemBuilder: (context, index) {
          return itemchapters(index);
        },
      ),
    );
  }

  itemchapters(index) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.4),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Theme.of(context).accentColor, width: 3),
                      borderRadius: BorderRadius.all(Radius.circular(25.2))),
                  child: Icon(
                    isplaying ? Icons.pause : Icons.play_arrow,
                    color: Theme.of(context).accentColor,
                    size: 21.6,
                  )),
              Expanded(
                  flex: 5,
                  child: Padding(
                    padding: EdgeInsets.only(left: 14.4),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          _chapters![index].name!,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        SizedBox(
                          height: 7.2,
                        ),
                        Text(
                          "Chapter ${_chapters![index].id.toString()}",
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ],
                    ),
                  )),
              Expanded(
                  flex: 2,
                  child: Text(
                    _chapters![index].dure!,
                    style: TextStyle(fontSize: 12),
                  )),
              Expanded(
                flex: 1,
                child: Icon(
                  _chapters![index].islocked! ? Icons.lock : Icons.more_horiz,
                  size: 18,
                ),
              )
            ],
          ),
          Divider(
            height: sizeH * 0.04,
          )
        ],
      ),
    );
  }
}

void _search() {}
