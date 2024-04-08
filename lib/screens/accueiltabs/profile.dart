import 'dart:convert';
import 'dart:ui';

import 'package:ebooks/api_services.dart';
import 'package:ebooks/blocs/crud_provider.dart';
import 'package:ebooks/elements/TopBarWidget.dart';
import 'package:ebooks/models/book.dart';
import 'package:ebooks/models/user.dart';
import 'package:ebooks/screens/crud/forms_decorated_field.dart';
import 'package:ebooks/screens/crud/layout_scrollable.dart';
import 'package:ebooks/screens/crud/settings.dart';
import 'package:file/local.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:zefyrka/zefyrka.dart';

class ProfileTab extends StatefulWidget {
  @override
  _ProfileTabState createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab>
    with SingleTickerProviderStateMixin {
  var _tabController;
  var enabledtab = 0;
  List<Book>? purchased = [];
  User? user;
  value values = new value();

  // +++++++++++++++++++
  ZefyrController? _controller;
  final FocusNode _focusNode = FocusNode();

  Settings? _settings;

  void _handleSettingsLoaded(Settings value) {
    setState(() {
      _settings = value;
      _loadFromAssets();
    });
  }

  // +++++++++++++++++++
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 1, vsync: this);
    purchased = values.purchasedd;
    user = values.userr;
    Settings.load().then(_handleSettingsLoaded);
  }

  Future<void> _loadFromAssets() async {
    try {
      final result = await rootBundle.loadString('welcome.note');
      final doc = NotusDocument.fromJson(jsonDecode(result));
      setState(() {
        _controller = ZefyrController(doc);
      });
    } catch (error) {
      final doc = NotusDocument()..insert(0, 'Empty asset');
      setState(() {
        _controller = ZefyrController(doc);
      });
    }
  }

  Future<void> _save() async {
    final fs = LocalFileSystem();
    final file = fs.directory(_settings!.assetsPath).childFile('welcome.note');
    final data = jsonEncode(_controller!.document);
    await file.writeAsString(data);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        child: Column(
          children: <Widget>[
            TopBarWidget(title: "Profile"),
            profileHead(),
            profletabs()
          ],
        ));
  }

  profileHead() {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 20, right: 20, top: 20),
          height: 280,
          child: Column(
            children: <Widget>[
              Container(
                  height: 201.6,
                  decoration: new BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      image: new DecorationImage(
                          image: new AssetImage(user!.image!),
                          fit: BoxFit.cover)),
                  child: new Center(
                      child: ClipRRect(
                    borderRadius: new BorderRadius.circular(8.0),
                    child: new Container(
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0))),
                        child: new SizedBox(
                          height: 201.6,
                          child: BackdropFilter(
                            filter: ImageFilter.blur(
                              sigmaX: 10,
                              sigmaY: 10,
                            ),
                            child: new Center(
                              child: new Text(
                                user!.name!,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .merge(prefix0.TextStyle(
                                        color: Theme.of(context).primaryColor)),
                              ),
                            ),
                          ),
                        )),
                  ))),
            ],
          ),
        ),
        Container(
          child: Align(
            alignment: AlignmentDirectional.bottomCenter,
            child: Container(
              width: 110,
              height: 110,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/user1.jpg"), fit: BoxFit.cover),
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                  border: Border.all(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      width: 5)),
            ),
          ),
        )
      ],
    );
  }

  profletabs() {
    return Expanded(
      child: Column(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _scrollable(),
          ),
          TabBar(
              labelColor: Theme.of(context).accentColor,
              unselectedLabelColor: Theme.of(context).focusColor,
              controller: _tabController,
              indicatorSize: TabBarIndicatorSize.label,
              indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(
                      width: 2, color: Theme.of(context).accentColor)),
              tabs: <Widget>[
               // Tab(
               //   text: 'Listned',
               // ),
               // Tab(
               //   text: 'Purchased',
               // ),
                Tab(
                  text: 'Liked',
                ),
              ]),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: <Widget>[
              //  purchasedGirdView(2),
              //  purchasedGirdView(2),
                purchasedGirdView(2),
              ],
            ),
          )
        ],
      ),
    );
  }

  purchasedGirdView(num) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: num,
              mainAxisSpacing: 20,
              childAspectRatio: 0.75,
              crossAxisSpacing: 20),
          itemCount: purchased!.length,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.only(bottom: 20),
              height: 100,
              width: 250,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  image: DecorationImage(
                      image: AssetImage(purchased![index].image!),
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.3), BlendMode.dstATop),
                      fit: BoxFit.cover)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    purchased![index].title!,
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  Text(
                    purchased![index].purchasedate!,
                    style: Theme.of(context).textTheme.caption,
                  )
                ],
              ),
            );
          }),
    );
  }

  void _scrollable() {
    print('IN scrollable');
    Navigator.push(
      context,
      // MaterialPageRoute(
      //   builder: (BuildContext context) => SettingsProvider(
      //     settings: _settings,
      //     child: DecoratedFieldDemo(),
      //   ),
      // ),
      MaterialPageRoute(
        builder: (BuildContext context) => SettingsProvider(
          settings: _settings,
          child: CrudProvider(child: DecoratedFieldDemo()),
        ),
      ),
    );
  }

//  landscapeprofile() {
//    return SingleChildScrollView(
//      child: Column(
//        mainAxisSize: MainAxisSize.min,
//        children: <Widget>[
//          SizedBox(height: 86.4, child: appBar()),
//          SizedBox(height: 273.6, child: profilehead(280.0)),
//          SizedBox(
//            height: 25,
//            child: Padding(
//              padding: const EdgeInsets.symmetric(horizontal: 100),
//              child: Row(
//                mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                children: <Widget>[
//                  Text(
//                    "Listened",
//                  ),
//                  Text(
//                    "Purchased",
//                    style: TextStyle(fontWeight: enabledtab == 0 ? FontWeight.bold : FontWeight.normal),
//                  ),
//                  Text("Liked"),
//                ],
//              ),
//            ),
//          ),
//          GridView.builder(
//              primary: false,
//              shrinkWrap: true,
//              physics: NeverScrollableScrollPhysics(),
//              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                  crossAxisCount: 4, mainAxisSpacing: 14.4, childAspectRatio: 0.75, crossAxisSpacing: 14.4),
//              itemCount: purchased.length,
//              itemBuilder: (context, index) {
//                return Container(
//                  padding: EdgeInsets.only(bottom: sizeW * 0.04),
//                  height: sizeH * 0.5,
//                  width: sizeW * 0.3,
//                  decoration: BoxDecoration(
//                      image: DecorationImage(
//                          image: AssetImage(purchased[index].image),
//                          colorFilter: ColorFilter.mode(Colors.grey.withOpacity(0.8), BlendMode.darken),
//                          fit: BoxFit.cover)),
//                  child: Column(
//                    mainAxisAlignment: MainAxisAlignment.end,
//                    children: <Widget>[
//                      Text(
//                        purchased[index].title,
//                        style: TextStyle(color: Colors.white),
//                      ),
//                      SizedBox(
//                        height: sizeH * 0.01,
//                      ),
//                      Text(purchased[index].purchasedate, style: TextStyle(color: Colors.white))
//                    ],
//                  ),
//                );
//              }),
//        ],
//      ),
//    );
//  }
}
