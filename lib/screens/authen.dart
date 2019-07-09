import 'package:flutter/material.dart';

class Authen extends StatefulWidget {
  @override
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 60.0),
        alignment: Alignment.topCenter,
        child: Column(
          children: <Widget>[
            showlogo(),
            showText(),
          ],
        ),
      ),
    );
  }
}
