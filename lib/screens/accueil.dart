import 'package:ebooks/api_services.dart';
import 'package:ebooks/blocs/categories_bloc.dart';
import 'package:ebooks/blocs/categories_provider.dart';
import 'package:ebooks/blocs/welcome_provider.dart';
import 'package:ebooks/screens/accueiltabs/categories.dart';
import 'package:ebooks/screens/accueiltabs/home.dart';
import 'package:ebooks/screens/accueiltabs/mylibary.dart';
import 'package:ebooks/screens/accueiltabs/profile.dart';
import 'package:ebooks/screens/editprofile.dart';
import 'package:ebooks/screens/signin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  var isSelected;
  var _scaffoldKey = new GlobalKey<ScaffoldState>();
  var _scaffoldKey1 = new GlobalKey<ScaffoldState>();

  final _controllerP = PageController();
  bool isCollapsed = true;
  double screenWidth = 0, screenHeight = 0;
  final Duration duration = const Duration(milliseconds: 300);
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _menuScaleAnimation;
  late Animation<Offset> _slideAnimation;
  value values = new value();
  @override
  void initState() {
    isSelected = 0;
    super.initState();
    _controller = AnimationController(vsync: this, duration: duration);
    _scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(_controller);
    _menuScaleAnimation =
        Tween<double>(begin: 0.5, end: 1).animate(_controller);
    _slideAnimation = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0))
        .animate(_controller);
    value values = new value();
    user = values.userr;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Theme.of(context).accentColor,
      body: Stack(
        children: <Widget>[
          menu(context),
          dashboard(context),
          ButtMenu(context),
        ],
      ),
    );
  }

  Widget ButtMenu(context) {
    return Padding(
      padding: EdgeInsets.only(top: 30),
      child: IconButton(
        icon: Icon(
          Icons.sort,
          color: Theme.of(context).primaryColor,
        ),
        onPressed: () {
          setState(() {
            if (isCollapsed)
              _controller.forward();
            else
              _controller.reverse();

            isCollapsed = !isCollapsed;
          });
        },
      ),
    );
  }

  Widget menu(context) {
    var itemStyle =
        TextStyle(color: Theme.of(context).primaryColor, fontSize: 13);
    return SlideTransition(
      position: _slideAnimation,
      child: ScaleTransition(
        scale: _menuScaleAnimation,
        child: Padding(
          padding: EdgeInsets.only(left: 54),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 120,
                ),
                Container(
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(user!.image!), fit: BoxFit.cover),
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      border: Border.all(
                          color: Theme.of(context).primaryColor,
                          width: screenWidth * 0.01)),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    user!.name!,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor),
                  ),
                ),
                SizedBox(
                  height:
                      MediaQuery.of(context).orientation == Orientation.portrait
                          ? 80
                          : 20,
                ),
                FlatButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => EditProfilePage()));
                    },
                    child: Text(
                      "Edit Profile",
                      style: itemStyle,
                    )),
                FlatButton(
                    onPressed: () => Navigator.push(context,
                        MaterialPageRoute(builder: (_) => EditProfilePage())),
                    child: Text(
                      "Your Email",
                      style: itemStyle,
                    )),
                FlatButton(
                    onPressed: () => Navigator.push(context,
                        MaterialPageRoute(builder: (_) => EditProfilePage())),
                    child: Text(
                      "Reset Password",
                      style: itemStyle,
                    )),
                FlatButton(
                    onPressed: () => Navigator.push(
                        context, MaterialPageRoute(builder: (_) => HomePage())),
                    child: Text(
                      "My Library",
                      style: itemStyle,
                    )),
                FlatButton(
                    onPressed: () => Navigator.push(
                        context, MaterialPageRoute(builder: (_) => HomePage())),
                    child: Text(
                      "Categories",
                      style: itemStyle,
                    )),
                FlatButton(
                    onPressed: () => Navigator.push(
                        context, MaterialPageRoute(builder: (_) => Signin())),
                    child: Text(
                      "Logout",
                      style: itemStyle,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget dashboard(context) {
    var sizeH = MediaQuery.of(context).size.height;
    var sizeW = MediaQuery.of(context).size.width;
    return AnimatedPositioned(
        duration: duration,
        top: 0,
        bottom: 0,
        left: isCollapsed ? 0 : 0.6 * screenWidth,
        right: isCollapsed ? 0 : -0.2 * screenWidth,
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: Material(
            animationDuration: duration,
            color: Theme.of(context).accentColor,
            shadowColor: Theme.of(context).hintColor,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: PageView(
                      onPageChanged: (i) {
                        setState(() {
                          isSelected = i;
                        });
                      },
                      controller: _controllerP, // assign it to PageView
                      children: <Widget>[
                        WelcomeProvider(child: HomeTab()), // page1
                        CategoriesProvider(child: CategoriesTab()),
                        MyLibaryTab(),
                        CategoriesProvider(child: ProfileTab()) // page2
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                      color: Theme.of(context).primaryColor,
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: Theme.of(context).hintColor.withOpacity(0.2),
                          offset: Offset(1.0, 3.0),
                          blurRadius: 10.0,
                        ),
                      ],
                    ),
                    height: 65,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          InkWell(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Padding(
                                  padding:
                                      EdgeInsets.only(bottom: sizeH * 0.005),
                                  child: !(isSelected == 0)
                                      ? SvgPicture.asset(
                                          "assets/svgs/home.svg",
                                          height: 18,
                                          width: 18,
                                          color: Theme.of(context).focusColor,
                                        )
                                      : SvgPicture.asset(
                                          "assets/svgs/homeen.svg",
                                          height: 18,
                                          width: 18,
                                          color: Theme.of(context).accentColor,
                                        ),
                                ),
                                Text(
                                  "Home",
                                  style: TextStyle(
                                      color: isSelected == 0
                                          ? Theme.of(context).accentColor
                                          : Theme.of(context).focusColor,
                                      fontSize: 12),
                                )
                              ],
                            ),
                            onTap: () {
                              setState(() {
                                isSelected = 0;
                                _controllerP.animateToPage(0,
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.easeOut);
                              });
                            },
                          ),
                          InkWell(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                      padding: EdgeInsets.only(
                                          bottom: sizeH * 0.005),
                                      child: !(isSelected == 1)
                                          ? SvgPicture.asset(
                                              "assets/svgs/categories.svg",
                                              height: 18,
                                              width: 18,
                                              color:
                                                  Theme.of(context).focusColor,
                                            )
                                          : SvgPicture.asset(
                                              "assets/svgs/categoriesen.svg",
                                              height: 18,
                                              width: 18,
                                              color:
                                                  Theme.of(context).accentColor,
                                            )),
                                  Text(
                                    "Categories",
                                    style: TextStyle(
                                        color: isSelected == 1
                                            ? Theme.of(context).accentColor
                                            : Theme.of(context).focusColor,
                                        fontSize: 12),
                                  )
                                ],
                              ),
                              onTap: () {
                                setState(() {
                                  isSelected = 1;
                                  _controllerP.animateToPage(1,
                                      duration: Duration(milliseconds: 500),
                                      curve: Curves.easeOut);
                                });
                              }),
                          InkWell(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                      padding: EdgeInsets.only(
                                          bottom: sizeH * 0.005),
                                      child: !(isSelected == 2)
                                          ? SvgPicture.asset(
                                              "assets/svgs/mylibary.svg",
                                              height: 18,
                                              width: 18,
                                              color:
                                                  Theme.of(context).focusColor,
                                            )
                                          : SvgPicture.asset(
                                              "assets/svgs/mylibaryen.svg",
                                              height: 18,
                                              width: 18,
                                              color:
                                                  Theme.of(context).accentColor,
                                            )),
                                  Text(
                                    "My Libary",
                                    style: TextStyle(
                                        color: isSelected == 2
                                            ? Theme.of(context).accentColor
                                            : Theme.of(context).focusColor,
                                        fontSize: 12),
                                  )
                                ],
                              ),
                              onTap: () {
                                setState(() {
                                  isSelected = 2;
                                  _controllerP.animateToPage(2,
                                      duration: Duration(milliseconds: 500),
                                      curve: Curves.easeOut);
                                });
                              }),
                          InkWell(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                      padding: EdgeInsets.only(
                                          bottom: sizeH * 0.005),
                                      child: !(isSelected == 3)
                                          ? SvgPicture.asset(
                                              "assets/svgs/profile.svg",
                                              height: 18,
                                              width: 18,
                                              color:
                                                  Theme.of(context).focusColor,
                                            )
                                          : SvgPicture.asset(
                                              "assets/svgs/profileen.svg",
                                              height: 18,
                                              width: 18,
                                              color:
                                                  Theme.of(context).accentColor,
                                            )),
                                  Text(
                                    "Profile",
                                    style: TextStyle(
                                        color: isSelected == 3
                                            ? Theme.of(context).accentColor
                                            : Theme.of(context).focusColor,
                                        fontSize: 12),
                                  )
                                ],
                              ),
                              onTap: () {
                                setState(() {
                                  isSelected = 3;
                                  _controllerP.animateToPage(3,
                                      duration: Duration(milliseconds: 500),
                                      curve: Curves.easeOut);
                                });
                                print(isSelected.toString());
                              }),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
