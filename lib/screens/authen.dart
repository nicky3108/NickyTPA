import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Authen extends StatefulWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return MaterialApp(
      home: Authen(),
    );
  }

  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
//Explicit

//Method
  Widget showlogo() {
    return Container(
      width: 150.0,
      height: 150.0,
      child: Image.asset(
        'images/logo.png',
      ),
    );
  }

  Widget showText() {
    return Text(
      'Nicky TPA',
      style: TextStyle(
        fontSize: 30.0,
        color: Colors.orange[900],
        fontWeight: FontWeight.bold,
        fontFamily: 'Athiti',
      ),
    );
  }

  Widget emailText() {
    return Container(
      width: 250.0,
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          labelText: 'Email :',
          hintText: 'you@email.com',
        ),
      ),
    );
  }

  Widget passwordText() {
    return Container(
      width: 250.0,
      child: TextFormField(
        obscureText: true,
        decoration: InputDecoration(
          labelText: 'Password :',
          hintText: 'More 6 Charactor',
        ),
      ),
    );
  }

  Widget signInBotton() {
    return RaisedButton(
      color: Colors.orange[900],
      child: Text(
        'Sign In',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {},
    );
  }

  Widget signUpBotton() {
    return RaisedButton(
      color: Colors.orange[200],
      child: Text('Sign Up'),
      onPressed: () {},
    );
  }

  Widget showButton() {
    return Container(
      width: 250.0,
      child: Row(
        children: <Widget>[
          Expanded(
            child: signInBotton(),
          ),
          mySizeBOx(),
          Expanded(
            child: signUpBotton(),
          ),
        ],
      ),
    );
  }

  Widget mySizeBOx() {
    return SizedBox(
      width: 8.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [Colors.white, Colors.orange[900]],
            radius: 2.0,
            center: Alignment.topcenter,
          ),
        ),
        padding: EdgeInsets.only(top: 60.0),
        alignment: Alignment.topCenter,
        child: Column(
          children: <Widget>[
            showlogo(),
            showText(),
            emailText(),
            passwordText(),
            showButton(),
          ],
        ),
      ),
    );
  }
}
