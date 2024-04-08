// import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:ebooks/api_services.dart';
import 'package:ebooks/elements/TopBarWidget.dart';
import 'package:ebooks/helpers/settings.dart';
import 'package:ebooks/my_flutter_app_icons.dart' as icon;
import 'package:ebooks/screens/accueil.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  value values = new value();

  @override
  void initState() {
    super.initState();
    user = values.userr;
  }

  @override
  Widget build(BuildContext context) {
    var _stopNotification = true;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              decoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(20))),
              child: Column(
                children: <Widget>[
                  TopBarWidget(title: 'Edit Profile', hasBackButton: true),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(user!.image!), fit: BoxFit.cover),
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        border: Border.all(
                            color: Theme.of(context).primaryColor, width: 3.6)),
                  ),
                  SizedBox(
                    height: 7.2,
                  ),
                  Text(
                    user!.name!,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor),
                  ),
                  FlatButton(
                    child: Text(
                      "Change Your Profile Picture",
                      style: TextStyle(
                          fontSize: 12, color: Theme.of(context).primaryColor),
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: EdgeInsets.only(left: 18, right: 18),
              child: Container(
                child: Column(
                  children: <Widget>[
                    ListTile(
                      contentPadding: EdgeInsets.all(0),
                      title: Text("User Name"),
                      trailing: Text(
                        user!.username!,
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ),
                    Divider(
                      height: 1,
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.all(0),
                      title: Text("Email"),
                      trailing: Text(
                        user!.email!,
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ),
                    Divider(
                      height: 1,
                    ),
                    FlatButton(
                      padding: EdgeInsets.all(0),
                      onPressed: () {},
                      child: ListTile(
                          contentPadding: EdgeInsets.all(0),
                          title: Text("Reset Password"),
                          trailing: Icon(
                            icon.MyFlutterApp.keyboard_arrow_right,
                            size: 28,
                            color: Theme.of(context).focusColor,
                          )),
                    ),
                    Divider(
                      height: 1,
                    ),
                    MergeSemantics(
                      child: ListTile(
                        contentPadding: EdgeInsets.all(0),
                        title: Text("Notifications"),
                        trailing: CupertinoSwitch(
                          activeColor: Theme.of(context).accentColor,
                          value: _stopNotification,
                          onChanged: (v) {
                            setState(() {
                              _stopNotification = v;
                            });
                          },
                        ),
                      ),
                    ),
                    MergeSemantics(
                      child: ListTile(
                        contentPadding: EdgeInsets.all(0),
                        title: Text("Enable Dark Mode"),
                        trailing: CupertinoSwitch(
                          activeColor: Theme.of(context).accentColor,
                          value:
                              Theme.of(context).brightness == Brightness.dark,
                          onChanged: (v) {
                            // if (Theme.of(context).brightness ==
                            //     Brightness.dark) {
                            //   setBrightness(Brightness.light);
                            //   DynamicTheme.of(context)
                            //       .setBrightness(Brightness.light);
                            // } else {
                            //   setBrightness(Brightness.dark);
                            //   DynamicTheme.of(context)
                            //       .setBrightness(Brightness.dark);
                            // }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 50),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: FlatButton(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0))),
                  color: Theme.of(context).accentColor,
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => HomePage()));
                  },
                  child: Text(
                    "Done",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Theme.of(context).primaryColor),
                  ),
                ),
              ),
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
