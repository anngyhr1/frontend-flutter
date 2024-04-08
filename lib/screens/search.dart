import 'package:ebooks/api_services.dart';
import 'package:ebooks/models/book.dart';
import 'package:ebooks/screens/accueiltabs/search_bar/search_widget.dart';
import 'package:ebooks/screens/bookdetail.dart';
import 'package:flutter/material.dart';

class SEarchPage extends StatefulWidget {
  String hint;
  SEarchPage(this.hint);
  @override
  _SEarchPageState createState() => _SEarchPageState(this.hint);
}

class _SEarchPageState extends State<SEarchPage> {
  String hint;
  double? sizeW;
  double? sizeH;
  List<Book>? _searchresult = [];
  value values = value();
  _SEarchPageState(this.hint);
  var searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _searchresult = values.bookss;
  }

  @override
  Widget build(BuildContext context) {
    sizeW = MediaQuery.of(context).size.width;
    sizeH = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Column(
          // children: <Widget>[searchbar(), searchResult()],
          children: [
            Container(height: 60, child: searchbar()),
            Container(
              height: MediaQuery.of(context).size.height - 60,
              width: MediaQuery.of(context).size.width,
              child: SearchWidget(),
            )
          ],
        ),
      ),
    );
  }

  searchbar() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: <Widget>[
          // Expanded(
          //   child: Container(
          //     height: 45,
          //     decoration: BoxDecoration(),
          //     child: TextField(
          //       controller: searchController,
          //       decoration: InputDecoration(
          //         focusedBorder: UnderlineInputBorder(
          //           borderSide:
          //               BorderSide(color: Theme.of(context).primaryColor),
          //           borderRadius: BorderRadius.circular(50),
          //         ),
          //         enabledBorder: UnderlineInputBorder(
          //           borderSide:
          //               BorderSide(color: Theme.of(context).primaryColor),
          //           borderRadius: BorderRadius.circular(50),
          //         ),
          //         filled: true,
          //         fillColor: Theme.of(context).primaryColor,
          //         hintText: hint,
          //         prefixIcon: Icon(
          //           Icons.search,
          //           size: 22,
          //         ),
          //         border: OutlineInputBorder(
          //             borderRadius: BorderRadius.all(Radius.circular(16.0)),
          //             gapPadding: 0),
          //       ),
          //     ),
          //   ),
          // ),
          SizedBox(width: 10),
          InkWell(
            child: Text(
              "< Volver atras",
              style:
                  TextStyle(color: Theme.of(context).accentColor, fontSize: 12),
            ),
            onTap: () => Navigator.pop(context),
          )
        ],
      ),
    );
  }

  searchResult() {
    return Expanded(
        child: ListView.builder(
            itemCount: _searchresult!.length,
            itemBuilder: (BuildContext context, int index) {
              return buildresult(_searchresult![index]);
            }));
  }

  buildresult(Book book) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: InkWell(
            // onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => DetailedBook(book))),
            child: Row(
              children: <Widget>[
                Container(
                  height: 72,
                  width: 54,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      image: DecorationImage(
                          image: AssetImage(book.image!), fit: BoxFit.cover)),
                ),
                SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      book.title!,
                      style: Theme.of(context).textTheme.subtitle1,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      book.author!,
                      style: Theme.of(context).textTheme.caption,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        Divider(
          height: 30,
        )
      ],
    );
  }
}
