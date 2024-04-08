import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:ebooks/models/book.dart';
import 'package:ebooks/models/storie_model.dart';
import 'package:ebooks/screens/literature.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class BooksForYouItem extends StatelessWidget {
  @required
  final StorieModel storie;
  @required
  final Stream<StorieModel>? streamTapped;
  @required
  final Function(StorieModel)? setTapped;
  const BooksForYouItem({
    Key? key,
    required this.storie,
    this.streamTapped,
    this.setTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return //Column(children: [
        InkWell(
      onTap: () => {setTapped!(storie)},
      // Navigator.push(
      //     context, MaterialPageRoute(builder: (_) => Literature(this.book))),
      child: Padding(
        padding: EdgeInsets.only(left: 20),
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(5)),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      offset: Offset(0.0, 4.0),
                      blurRadius: 10.0,
                      color: Theme.of(context).hintColor.withOpacity(0.1)),
                ],
              ),
              margin: EdgeInsets.symmetric(vertical: 14),
              // width: 190,
              width: 120,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    // height: 246,
                    // height: 155,
                    // width: 115,
                    height: 125,
                    width: 95,
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(5)),
                        image: DecorationImage(
                            image: AssetImage(this.storie.image!),
                            fit: BoxFit.cover)),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Flexible(
                            child: RichText(
                          overflow: TextOverflow.ellipsis,
                          strutStyle: StrutStyle(fontSize: 10.0),
                          text: TextSpan(
                              style: Theme.of(context).textTheme.bodyText1,
                              text: this.storie.title),
                        )),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
    // Row(children: [
    //   Flexible(
    //       flex: 1,
    //       child:
    //           // Padding(
    //           //     padding: EdgeInsets.all(12.0),
    //           //     child:
    //           StreamBuilder(
    //               stream: streamTapped,
    //               builder: (context, AsyncSnapshot<StorieModel> snapshot) {
    //                 if (!snapshot.hasData) {
    //                   return Text('Loading');
    //                 }
    //                 return AutoSizeText(
    //                   snapshot.data.text,
    //                   style: TextStyle(fontSize: 14),
    //                   minFontSize: 10,
    //                   maxLines: 4,
    //                   overflow: TextOverflow.ellipsis,
    //                 );
    //               }) //),
    //       ),
    // ]),
    // ]);
  }
}
