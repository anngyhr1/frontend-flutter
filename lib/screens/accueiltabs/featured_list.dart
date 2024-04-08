import 'package:ebooks/blocs/welcome_bloc.dart';
import 'package:ebooks/blocs/welcome_provider.dart';
import 'package:ebooks/elements/FeaturedBooksItem.dart';
import 'package:ebooks/models/storie_model.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class CarrouselList extends StatelessWidget {
  final _controllerP = PageController();
  @required
  final Stream<List<StorieModel>>? stream;
  final Stream<int>? streamScroll;
  final Function(int)? setMostViewedCurrPage;
  // var enabledFeatured = 0;
  CarrouselList({
    this.stream,
    this.streamScroll,
    this.setMostViewedCurrPage,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        StreamBuilder(
            stream: stream,
            builder: (context, AsyncSnapshot<List<StorieModel>> snapshot) {
              // if (snapshot.data != null) {
              //   return Text('Loading ... ');
              // }
              return Column(
                children: [
                  Container(
                    height: 200,
                    child: PageView.builder(
                      itemCount: snapshot.data!.length,
                      controller: _controllerP, // assign it to PageView
                      itemBuilder: (context, index) {
                        return FeaturedBooksItem(storie: snapshot.data![index]);
                      },
                      onPageChanged: (i) {
                        setMostViewedCurrPage!(i);
                      },
                    ),
                  ),
                  Container(
                    width: 360,
                    height: 14.4,
                    child: currentFeatured(
                        context, snapshot.data!.length, streamScroll),
                  )
                ],
              );
            }),
      ],
    );
  }
}

currentFeatured(BuildContext context, int length, Stream<int>? streamScroll) {
  var sizeW = MediaQuery.of(context).size.width;
  return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(length, (int index) {
        return Padding(
          padding: EdgeInsets.only(right: sizeW * 0.02),
          child: StreamBuilder(
              stream: streamScroll,
              builder: (context, AsyncSnapshot<int> snapshot) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    color: snapshot.data == index
                        ? Theme.of(context).accentColor
                        : Theme.of(context).accentColor.withOpacity(0.3),
                  ),
                  width: 18,
                  height: 6.5,
                );
              }),
        );
      }));
}
