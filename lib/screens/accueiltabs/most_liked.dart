import 'package:ebooks/blocs/welcome_provider.dart';
import 'package:ebooks/elements/BooksForYouItem.dart';
import 'package:ebooks/models/storie_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

class MostLiked extends StatelessWidget {
  @required
  final Stream<List<StorieModel>> stream;
  @required
  final Stream<StorieModel>? streamTapped;
  @required
  final dynamic Function(StorieModel) setTapped;

  const MostLiked({
    required this.stream,
    this.streamTapped,
    required this.setTapped,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: stream,
        builder: (context, AsyncSnapshot<List<StorieModel>> snapshot) {
          if (!snapshot.hasData) {
            return Text('Loading ... ');
          }
          return ListView.builder(
              physics: ClampingScrollPhysics(),
              //shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                return BooksForYouItem(
                    storie: snapshot.data![index],
                    streamTapped: streamTapped,
                    setTapped: setTapped);
              });
        });
  }
}
