import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:ebooks/models/storie_model.dart';
import 'package:ebooks/screens/bookdetail.dart';
import 'package:ebooks/screens/crud/settings.dart';
import 'package:flutter/material.dart';

class FeaturedBooksItem extends StatelessWidget {
  const FeaturedBooksItem({
    Key? key,
    required StorieModel storie,
  })  : storie = storie,
        super(key: key);

  final StorieModel storie;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Row(
            children: <Widget>[
              Container(
                width: 122,
                height: 165,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    image: DecorationImage(
                        image: AssetImage(this.storie.image!),
                        fit: BoxFit.cover)),
              ),
              Expanded(
                child: Container(
                  padding:
                      EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
                  height: 130,
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            offset: Offset(0, 3.0),
                            blurRadius: 10.0,
                            color:
                                Theme.of(context).hintColor.withOpacity(0.09)),
                      ],
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(5),
                          topRight: Radius.circular(5))),
                  child: ColumnSuper(
                    alignment: Alignment.topLeft,
                    innerDistance: 4,
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        this.storie.title!,
                        maxLines: 2,
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                      AutoSizeText(
                        storie.text!,
                        style: TextStyle(fontSize: 12),
                        minFontSize: 10,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: 3,
                          ),
                          Text(" ${this.storie.rate.toString()}"),
                        ],
                      ),
                      SizedBox(
                        height: 2.16,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        onTap: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => DetailedBook(storie)))
            });
       
  }
}
