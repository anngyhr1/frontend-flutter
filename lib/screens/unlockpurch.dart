import 'package:ebooks/elements/TopBarWidget.dart';
import 'package:ebooks/screens/accueil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UnlockPurchasedPage extends StatefulWidget {
  @override
  _UnlockPurchasedPageState createState() => _UnlockPurchasedPageState();
}

class _UnlockPurchasedPageState extends State<UnlockPurchasedPage> {
  var sizeW;
  late var sizeH;
  int selectedPlan = 1;
  @override
  Widget build(BuildContext context) {
    sizeH = MediaQuery.of(context).size.height;
    sizeW = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TopBarWidget(
            title: 'Unlock Everything',
            hasBackButton: true,
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Center(
              child: Text(
                "Choose Your Plan",
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    setState(() {
                      selectedPlan = 1;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(7),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        color: selectedPlan == 1
                            ? Theme.of(context).accentColor
                            : Theme.of(context).accentColor.withOpacity(0.2),
                        border: Border.all(
                            color: Theme.of(context).accentColor, width: 3)),
                    width: sizeW * 0.28,
                    height: sizeW * 0.25,
                    child: Center(
                      child: Text(
                        "7 days Free Trial",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 13,
                            color: selectedPlan == 1
                                ? Theme.of(context).primaryColor
                                : Theme.of(context).accentColor),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      selectedPlan = 2;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(7),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        color: selectedPlan == 2
                            ? Theme.of(context).accentColor
                            : Theme.of(context).accentColor.withOpacity(0.2),
                        border: Border.all(
                            color: Theme.of(context).accentColor, width: 3)),
                    width: sizeW * 0.28,
                    height: sizeW * 0.25,
                    child: Center(
                      child: Text(
                        "Monthly Access",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: selectedPlan == 2
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).accentColor,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      selectedPlan = 3;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(7),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        color: selectedPlan == 3
                            ? Theme.of(context).accentColor
                            : Theme.of(context).accentColor.withOpacity(0.2),
                        border: Border.all(
                            color: Theme.of(context).accentColor, width: 3)),
                    width: sizeW * 0.28,
                    height: sizeW * 0.25,
                    child: Center(
                      child: Text(
                        "Yearly Access",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: selectedPlan == 3
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).accentColor,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(5)),
            child: Column(
              children: <Widget>[
                Text(
                  selectedPlan == 1
                      ? "7 Days Free Trial"
                      : selectedPlan == 2
                          ? "Monthly Access"
                          : "Yearly Access",
                  style: Theme.of(context).textTheme.headline1,
                ),
                SizedBox(height: 5),
                Text(
                  selectedPlan == 1
                      ? "\$9.99/6 MO After Trial"
                      : selectedPlan == 2
                          ? "\$19.99/6 MO After Trial"
                          : "\$9.99/6 MO After Trial",
                  style: Theme.of(context).textTheme.caption,
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: FlatButton(
                    padding: EdgeInsets.all(13),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    color: Theme.of(context).accentColor,
                    onPressed: () {
                      //Navigator.push(context, MaterialPageRoute(builder:(_)=>HomePage()));
                    },
                    child: Text(
                      "Done",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Theme.of(context).primaryColor),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.check,
                  color: Colors.green,
                ),
                SizedBox(
                  width: sizeW * 0.04,
                ),
                Expanded(
                  child: Text(
                    "80+ Integer to get those insictments for real realize readingnad ther and other",
                    style: TextStyle(fontSize: 12, height: sizeH * 0.0025),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.check,
                  color: Colors.green,
                ),
                SizedBox(
                  width: sizeW * 0.04,
                ),
                Expanded(
                  child: Text(
                    "80+ Integer to get those insictments for real realize readingnad ther and other",
                    style: TextStyle(fontSize: 12, height: sizeH * 0.0025),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.check,
                  color: Colors.green,
                ),
                SizedBox(
                  width: sizeW * 0.04,
                ),
                Expanded(
                  child: Text(
                    "80+ Integer to get those insictments for real realize readingnad ther and other",
                    style: TextStyle(fontSize: 12, height: sizeH * 0.0025),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Align(
            alignment: AlignmentDirectional.center,
            child: FlatButton(
              padding: EdgeInsets.fromLTRB(
                  sizeW * 0.4, sizeH * 0.02, sizeW * 0.4, sizeH * 0.02),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12.0))),
              color: Theme.of(context).accentColor,
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => HomePage()));
              },
              child: Text(
                "Done",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Theme.of(context).primaryColor),
              ),
            ),
          ),
        ],
      ),
    );
  }

  appBar() {
    return Container(
      width: sizeW,
      height: sizeH * 0.12,
      decoration: BoxDecoration(
          color: Theme.of(context).accentColor,
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(16))),
      child: Padding(
        padding: EdgeInsets.only(
            top: sizeW * 0.06, right: sizeW * 0.04, left: sizeW * 0.04),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            InkWell(
              child: SvgPicture.asset("assets/svgs/back.svg"),
              onTap: () => Navigator.pop(context),
            ),
            Text(
              "Unlock Everything",
              style: TextStyle(
                  color: Theme.of(context).primaryColor, fontSize: 18),
            ),
            InkWell(
              child: SvgPicture.asset("assets/svgs/search.svg"),
              onTap: _search,
            )
          ],
        ),
      ),
    );
  }

  void _search() {}
}
