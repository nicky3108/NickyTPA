import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nicky_tpa/screens/my_service.dart';
import 'package:nicky_tpa/screens/register.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
  final formKey = GlobalKey<FormState>();
  String emailString, passwordString;
  final scaffoldKey = GlobalKey<ScaffoldState>();

//Method
  void mySnackBar(String messageString) {
    SnackBar snackBar = SnackBar(
      content: Text(messageString),
      duration: Duration(seconds: 8),backgroundColor: Colors.orange[800],
      action: SnackBarAction(
        label: 'Close',
        onPressed: () {},
      ),
    );
    scaffoldKey.currentState.showSnackBar(snackBar);
  }

  @override
  void initState() {
    super.initState();
    checkStatus();
  }

  Future<void> checkStatus() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    FirebaseUser firebaseUser = await firebaseAuth.currentUser();
    if (firebaseUser != null) {
      moveToService();
    }
  }

  void moveToService() {
    var serviceRoute =
        MaterialPageRoute(builder: (BuildContext context) => MyService());
    Navigator.of(context)
        .pushAndRemoveUntil(serviceRoute, (Route<dynamic> route) => false);
  }

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
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          labelText: 'Email :',
          hintText: 'you@email.com',
        ),
        validator: (String vale) {
          if (vale.isEmpty) {
            return 'Plaes Fill Email';
          }
        },
        onSaved: (String value) {
          emailString = value;
        },
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
        validator: (String value) {
          if (value.isEmpty) {
            return 'Plaes Fill Password';
          }
        },
        onSaved: (String value) {
          passwordString = value;
        },
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
      onPressed: () {
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          checkAuthen();
        }
      },
    );
  }

  Future<void> checkAuthen() async {
    print('email = $emailString, password = $passwordString');
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    await firebaseAuth
        .signInWithEmailAndPassword(
            email: emailString, password: passwordString)
        .then((response) {
      moveToService();
    }).catchError((response) {
      String messageString = response.message;
      print('message = $messageString');
      mySnackBar(messageString);
    });
  }

  Widget signUpBotton() {
    return RaisedButton(
      color: Colors.orange[200],
      child: Text('Sign Up'),
      onPressed: () {
        print('You Click Sign Up');

// Create Route
        var registerRoute =
            MaterialPageRoute(builder: (BuildContext context) => Register());
        Navigator.of(context).push(registerRoute);
      },
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
      key: scaffoldKey,
      resizeToAvoidBottomPadding: false,
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [Colors.white, Colors.orange[900]],
            radius: 2.0,
            center: Alignment.topCenter,
          ),
        ),
        padding: EdgeInsets.only(top: 60.0),
        alignment: Alignment.topCenter,
        child: Form(
          key: formKey,
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
      ),
    );
  }
}
