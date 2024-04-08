import 'package:ebooks/api_services.dart';
import 'package:ebooks/elements/BooksForYouItem.dart';
import 'package:ebooks/elements/FieldItem.dart';
import 'package:ebooks/elements/HeadingIconButtonWidget.dart';
import 'package:ebooks/elements/TopBarWidget.dart';
import 'package:ebooks/models/book.dart';
import 'package:ebooks/models/type.dart';
import 'package:flutter/material.dart';

class MyLibaryTab extends StatefulWidget {
  @override
  _MyLibaryTabState createState() => _MyLibaryTabState();
}

class _MyLibaryTabState extends State<MyLibaryTab> {
  List<Book>? _books;
  List<Field>? _fields = [];
  value values = new value();
  @override
  void initState() {
    super.initState();
    _books = values.bookss;
    _fields = values.fieldss;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        child: Column(
          children: <Widget>[
            TopBarWidget(title: 'My Library'),
            myLibraryList()
          ],
        ));
  }

  myLibraryList() {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
              child: HeadingIconButtonWidget(
                text: Text(
                  "OUR CHOICES FOR YOU",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                icon: Icon(
                  Icons.card_giftcard,
                  color: Theme.of(context).hintColor,
                ),
                showActions: true,
              ),
            ),
            SizedBox(
              height: 240,
              child: ListView.builder(
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: _books!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return null;
                    // BooksForYouItem(
                    //   storie: _books[index],
                    // );
                  } as Widget Function(BuildContext, int)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
              child: HeadingIconButtonWidget(
                text: Text(
                  "MY LIBRARY",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                icon: Icon(
                  Icons.bookmark_border,
                  color: Theme.of(context).hintColor,
                ),
                showActions: true,
              ),
            ),
            ListView.builder(
              primary: false,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: _fields!.length,
              itemBuilder: (context, index) {
                return FieldItem(field: _fields![index]);
              },
            ),
          ],
        ),
      ),
    );
  }
}
