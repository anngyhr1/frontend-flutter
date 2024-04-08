import 'package:flutter/material.dart';

//class Content extends StatefulWidget {
class Content extends StatelessWidget {
  final String title;
  final Widget child;

  Content({
    Key? key,
    required this.title,
    required this.child,
  }) : super(key: key);

//   @override
//   _ContentState createState() => _ContentState();
// }

// class _ContentState extends State<Content>
//     with AutomaticKeepAliveClientMixin<Content> {
//   @override
//   bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    //super.build(context);
    return Card(
      elevation: 2,
      margin: const EdgeInsets.all(5),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          title != ''
              ? Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  color: Theme.of(context)
                      .primaryColor, //Theme.of(context).scaffoldBackgroundColor,
                  child: Text(
                    //  widget.title,
                    title,
                    style: const TextStyle(
                        fontSize: 16,
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.w500),
                  ),
                )
              : Container(width: 0),
          Flexible(
            // child: widget.child,
            fit: FlexFit.loose, child: child,
          ),
        ],
      ),
    );
  }
}
