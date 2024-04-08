import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  var isSelected;
  bool isCollapsed = true;
  double screenWidth = 0, screenHeight = 0;
  @override
  void initState() {
    isSelected = 0;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;
    return dashboard(context);
       
  }

  Widget dashboard(context) {
    var sizeH = MediaQuery.of(context).size.height;
    return Container(
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
              child: Column(
                children: <Widget>[
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
                                });
                              }),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
  }
}
