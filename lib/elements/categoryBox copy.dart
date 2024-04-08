//import 'dart:ffi';

import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:ebooks/models/book.dart';
import 'package:ebooks/models/category.dart';
import 'package:ebooks/models/storie_model.dart';
import 'package:ebooks/screens/bookdetail.dart';
import 'package:ebooks/screens/literature.dart';
import 'package:flutter/material.dart';
// import 'package:smooth_star_rating/smooth_star_rating.dart';

class CategoryBox extends StatelessWidget {
  const CategoryBox({
    Key? key,
    required Category category,
  })  : category = category,
        super(key: key);

  final Category category;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        // padding: EdgeInsets.all(20),
        child: Row(
          children: <Widget>[
            Flexible(
              child: Container(
                padding:
                    EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
                height: 100,
                width: 120,
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          offset: Offset(0, 3.0),
                          blurRadius: 10.0,
                          color: Theme.of(context).hintColor.withOpacity(0.09)),
                    ],
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(5),
                        topRight: Radius.circular(5))),
                child: ColumnSuper(
                  alignment: Alignment.topCenter,
                  innerDistance: 4,
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      this.category.name!,
                      maxLines: 2,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: 60,
              height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  image: DecorationImage(
                      image: AssetImage("assets/image1.jpg"),
                      fit: BoxFit.cover)),
            ),
          ],
        ),
      ),
      // onTap: () => {
      //       Navigator.push(context,
      //           MaterialPageRoute(builder: (_) => DetailedBook()))
      //     }
    );
  }
}
