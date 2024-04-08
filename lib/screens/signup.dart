import 'package:ebooks/screens/signin.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  var emailcntrl = TextEditingController();
  var passwordcntrl = TextEditingController();
  var cnfrmpasswordcntrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var sizeH = MediaQuery.of(context).size.height;
    var sizeW = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(sizeW * 0.05),
          child: ListView(
            padding: EdgeInsets.all(0),
            children: <Widget>[
              Align(
                alignment: AlignmentDirectional.center,
                child: Text(
                  "Sign up",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              SizedBox(
                height: sizeH * 0.15,
              ),
              TextField(
                controller: emailcntrl,
                decoration: InputDecoration(hintText: "Email"),
              ),
              SizedBox(
                height: sizeH * 0.02,
              ),
              TextField(
                controller: passwordcntrl,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Password",
                ),
              ),
              SizedBox(
                height: sizeH * 0.02,
              ),
              TextField(
                controller: cnfrmpasswordcntrl,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Confirm Password",
                ),
              ),
              SizedBox(
                height: sizeH * 0.06,
              ),
              FlatButton(
                padding: EdgeInsets.fromLTRB(sizeW * 0.35, 14.4, sizeW * 0.35, 14.4),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12.0))),
                color: Theme.of(context).accentColor,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => Signup()));
                },
                child: Text(
                  "Sign up",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Theme.of(context).primaryColor),
                ),
              ),
              Row(
                children: <Widget>[
                  Text("Already Member ? "),
                  FlatButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => Signin()));
                    },
                    child: Text(
                      "Sign in",
                      style: TextStyle(color: Theme.of(context).accentColor),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: sizeH * 0.04,
              ),
              Row(children: <Widget>[
                Expanded(
                  child: new Container(
                      margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                      child: Divider(
                        color: Theme.of(context).focusColor.withOpacity(0.5),
                        height: 36,
                      )),
                ),
                Text("OR"),
                Expanded(
                  child: new Container(
                      margin: const EdgeInsets.only(left: 20.0, right: 10.0),
                      child: Divider(
                        color: Theme.of(context).focusColor.withOpacity(0.5),
                        height: 36,
                      )),
                ),
              ]),
              SizedBox(
                height: sizeH * 0.04,
              ),
              Row(
                children: <Widget>[
                  FlatButton(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(sizeW * 0.06))),
                    color: Color(0xff3b5998),
                    child: Container(
                        width: sizeW * 0.33,
                        height: 43.2,
                        child: Center(
                          child: Text(
                            "Facebook",
                            style: TextStyle(color: Theme.of(context).primaryColor),
                          ),
                        )),
                    onPressed: () {},
                  ),
                  SizedBox(
                    width: sizeW * 0.05,
                  ),
                  FlatButton(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(sizeW * 0.06))),
                    color: Color(0xff1dcaff),
                    child: Container(
                      width: sizeW * 0.33,
                      height: 43.2,
                      child: Center(
                        child: Text(
                          "Twitter",
                          style: TextStyle(color: Theme.of(context).primaryColor),
                        ),
                      ),
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
