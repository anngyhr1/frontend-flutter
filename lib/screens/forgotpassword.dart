import 'package:ebooks/screens/signin.dart';
import 'package:ebooks/screens/signup.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  var emailcntrl = TextEditingController();
  var passwordcntrl = TextEditingController();
  var cnfrmpasswordcntrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var sizeH = MediaQuery.of(context).size.height;
    var sizeW = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Text(
                "Forgot Password",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(
                height: sizeH * 0.15,
              ),
              TextField(
                controller: emailcntrl,
                decoration: InputDecoration(
                  hintText: "Your Email Adress",
                  enabledBorder: UnderlineInputBorder(
                    borderSide: new BorderSide(color: Theme.of(context).hintColor.withOpacity(0.2)),
                  ),
                ),
              ),
              SizedBox(
                height: sizeH * 0.02,
              ),
              TextField(
                controller: passwordcntrl,
                obscureText: true,
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: new BorderSide(color: Theme.of(context).hintColor.withOpacity(0.2)),
                  ),
                  hintText: "Your New Password",
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
                  enabledBorder: UnderlineInputBorder(
                    borderSide: new BorderSide(color: Theme.of(context).hintColor.withOpacity(0.2)),
                  ),
                ),
              ),
              SizedBox(
                height: sizeH * 0.06,
              ),
              SizedBox(
                width: double.infinity,
                height: 55,
                child: FlatButton(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12.0))),
                  color: Theme.of(context).accentColor,
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => Signup()));
                  },
                  child: Text(
                    "Sign in",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Theme.of(context).primaryColor),
                  ),
                ),
              ),
              SizedBox(
                height: sizeH * 0.03,
              ),
              Row(
                children: <Widget>[
                  Text("I Remember my password"),
                  FlatButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => Signin()));
                    },
                    child: Text(
                      "Go Back",
                      style: TextStyle(color: Theme.of(context).accentColor),
                    ),
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
