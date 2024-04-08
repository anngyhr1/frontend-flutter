import 'package:auto_size_text/auto_size_text.dart';
import 'package:ebooks/blocs/welcome_bloc.dart';
import 'package:ebooks/models/storie_model.dart';
import 'package:ebooks/screens/bookdetail.dart';
import 'package:flutter/material.dart';

class StorieTapped extends StatelessWidget {
  const StorieTapped({
    Key? key,
    required this.welcomeBloc,
  }) : super(key: key);

  final WelcomeBloc welcomeBloc;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Flexible(
          flex: 1,
          child: StreamBuilder(
              stream: welcomeBloc.mLikedStorieTapped,
              builder: (context, AsyncSnapshot<StorieModel> snapshot) {
                if (!snapshot.hasData) {
                  return Text('Loading');
                }
                StorieModel storie = snapshot.data!;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20, right: 20, top: 5),
                      child: AutoSizeText(
                        storie.text!,
                        style: TextStyle(fontSize: 12),
                        minFontSize: 12,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20, right: 20, top: 8),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => DetailedBook(storie)));
                          },
                          child: RichText(
                              text: TextSpan(
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white70,
                                      fontWeight: FontWeight.w500),
                                  text: 'Mas detalles >')),
                        ),
                      ),
                    ),
                  ],
                );
              }) //),
          ),
    ]);
  }
}
