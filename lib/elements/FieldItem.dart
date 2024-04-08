import 'package:ebooks/models/type.dart';
import 'package:ebooks/my_flutter_app_icons.dart' as icon;
import 'package:ebooks/screens/selected_library.dart';
import 'package:flutter/material.dart';

class FieldItem extends StatelessWidget {
  const FieldItem({
    Key? key,
    required Field field,
  })  : field = field,
        super(key: key);

  final Field field;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 20, left: 20, bottom: 15),
      child: InkWell(
        onTap: () => Navigator.push(context,
            MaterialPageRoute(builder: (_) => SelectedLibrary("1", null))),
        child: Container(
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.all(Radius.circular(8.0))),
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    this.field.name!,
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  Text(
                    this.field.number.toString() + " books",
                    style: Theme.of(context).textTheme.caption,
                  )
                ],
              ),
              Icon(
                icon.MyFlutterApp.keyboard_arrow_right,
                size: 28,
                color: Theme.of(context).focusColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
