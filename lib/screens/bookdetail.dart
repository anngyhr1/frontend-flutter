import 'package:ebooks/bottom_nav_bar.dart';
import 'package:ebooks/elements/TopBarWidget.dart';
import 'package:ebooks/models/storie_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../layout_scrollable.dart';
// import 'package:smooth_star_rating/smooth_star_rating.dart';

class DetailedBook extends StatelessWidget {
  final StorieModel storie;
  DetailedBook(this.storie);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(storie.title),
        body: Column(
      children: <Widget>[
        TopBarWidget(title: '', hasBackButton: true),
        details(context)
      ],
    ));
  }

  details(BuildContext context) {
    var sizeH = MediaQuery.of(context).size.height;
    var sizeW = MediaQuery.of(context).size.width;
    return Expanded(
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          SizedBox(
            height: 14.4,
          ),
          imageview(),
          SizedBox(
            height: 7,
          ),
          Text(
            storie.title!,
            style: Theme.of(context).textTheme.headline1,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 7.2,
          ),
          Align(
            alignment: AlignmentDirectional.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: 5,
                ),
                Text(
                  storie.rate.toString(),
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),
          storie.text != "v"
              ? Padding(
                  padding: EdgeInsets.symmetric(horizontal: sizeW * 0.04),
                  child: ScrollableLayout(storie.text),
                )
              : SizedBox(
                  height: 7.2,
                ),
          SizedBox(
            height: 7.2,
          ),
        ],
      ),
    );
  }
  imageview() {
    return Align(
      alignment: AlignmentDirectional.center,
      child: Stack(
        children: <Widget>[
          Container(
            width: 162,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(4)),
                image: DecorationImage(
                    image: AssetImage(storie.image!), fit: BoxFit.cover)),
            height: 216,
          ),
        ],
      ),
    );
  }
}
