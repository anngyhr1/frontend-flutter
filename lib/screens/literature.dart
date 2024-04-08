import 'package:ebooks/api_services.dart';
import 'package:ebooks/elements/TopBarWidget.dart';
import 'package:ebooks/models/book.dart';
import 'package:ebooks/models/chapter.dart';
import 'package:ebooks/models/comment.dart';
import 'package:ebooks/screens/booklisten.dart';
import 'package:flutter/material.dart';

class Literature extends StatefulWidget {
  Book _book;

  Literature(this._book);

  @override
  _LiteratureState createState() => _LiteratureState(this._book);
}

class _LiteratureState extends State<Literature>
    with SingleTickerProviderStateMixin {
  late var sizeW;
  late var sizeH;
  Book _book;
  List<Comment>? comments = [];
  List<Chapter>? chapters = [];
  var _tabController;
  var enabledTab = 0;

  value values = new value();

  _LiteratureState(this._book);

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    comments = values.commentss;
    chapters = values.chapterss;
  }

  @override
  Widget build(BuildContext context) {
    sizeW = MediaQuery.of(context).size.width;
    sizeH = MediaQuery.of(context).size.height;
    return Scaffold(
        body: MediaQuery.of(context).orientation == Orientation.portrait
            ? Column(
                children: <Widget>[
                  TopBarWidget(
                    title: 'Book Details',
                    hasBackButton: true,
                  ),
                  literature(context)
                ],
              )
            : landscapeView());
  }

  literature(BuildContext context) {
    return Expanded(
        child: Column(
      children: <Widget>[
        SizedBox(
          height: 20,
        ),
        literatureHead(),
        Container(
          height: 55,
          child: TabBar(
              labelColor: Theme.of(context).accentColor,
              unselectedLabelColor: Theme.of(context).focusColor,
              controller: _tabController,
              indicatorSize: TabBarIndicatorSize.label,
              indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(
                      width: 2, color: Theme.of(context).accentColor)),
              tabs: <Widget>[
                Tab(
                  text: 'Chapters',
                ),
                Tab(
                  text: 'Comments',
                ),
              ]),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              chaptersList(),
              commentsList(),
            ],
          ),
        )
      ],
    ));
  }

  commentsList() {
    enabledTab = 1;
    return ListView.builder(
      itemCount: comments!.length,
      itemBuilder: (context, index) {
        return buildCommentItem(index);
      },
    );
  }

  buildCommentItem(int index) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(right: 14.4, left: 14.4),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 7.2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    CircleAvatar(
                      backgroundColor: Theme.of(context).accentColor,
                      backgroundImage: AssetImage(
                          comments![index].profile_picture_commenter!),
                      maxRadius: 21.6,
                    ),
                    SizedBox(
                      width: 14.4,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(comments![index].name_commenter!),
                        SizedBox(
                          height: 5.4,
                        ),
                        Text(
                          comments![index].time!,
                          style: TextStyle(fontSize: 10),
                        ),
                      ],
                    ),
                  ],
                ),
                Align(
                    alignment: AlignmentDirectional.topCenter,
                    child: InkWell(
                      child: Icon(
                        comments![index].isliked!
                            ? Icons.favorite
                            : Icons.favorite_border,
                        size: 14.4,
                        color: Colors.red,
                      ),
                      onTap: () {
                        setState(() {
                          comments![index].isliked!
                              ? comments![index].isliked = false
                              : comments![index].isliked = true;
                        });
                      },
                    ))
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: sizeW * 0.04, left: sizeW * 0.14, bottom: sizeW * 0.04),
              child: Text(
                comments![index].comment!,
                maxLines: 5,
              ),
            ),
            Divider(
              height: sizeH * 0.01,
            )
          ],
        ),
      ),
    );
  }

  chaptersList() {
    return Container(
        child: ListView.builder(
      itemCount: chapters!.length,
      itemBuilder: (context, index) {
        return chaptersitem(index);
      },
    ));
  }

  landscapeView() {
    return SingleChildScrollView(
        child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
      SizedBox(
        height: 86.4,
        child: TopBarWidget(
          title: 'Book Details',
          hasBackButton: true,
        ),
      ),
      SizedBox(
        height: 158.4,
        child: literatureHead(),
      ),
      Divider(
        height: 10,
      ),
      SizedBox(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              "Chapters",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              "Comments",
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
      SizedBox(
        height: 300,
        child: Row(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                primary: false,
                itemCount: chapters!.length,
                itemBuilder: (context, index) {
                  return chaptersitem(index);
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                primary: false,
                itemCount: comments!.length,
                itemBuilder: (context, index) {
                  return buildCommentItem(index);
                },
              ),
            ),
          ],
        ),
      ),
    ]));
  }

  literatureHead() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: <Widget>[
          Container(
            height: 165,
            width: 120,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(_book.image!), fit: BoxFit.cover),
                borderRadius: BorderRadius.all(Radius.circular(4.0))),
          ),
          SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  _book.title!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.headline1,
                ),
                Text(
                  _book.author!,
                  style: Theme.of(context).textTheme.caption,
                ),
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: double.infinity,
                  child: FlatButton(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    color: Theme.of(context).accentColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.0))),
                    child: Text(
                      "Listen",
                      style: TextStyle(
                          color: Theme.of(context).primaryColor, fontSize: 15),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => BookListen(_book)));
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  chaptersitem(int index) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.4),
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
                  chapters![index].islocked! ? Icons.lock : Icons.more_horiz,
                  size: 18,
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
  }
}
