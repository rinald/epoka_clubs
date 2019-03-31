// import 'dart:async';
import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'home.dart';

// final _auth = FirebaseAuth.instance;
final _googleSignIn = GoogleSignIn();

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  void _signIn() async {
    try {
      GoogleSignInAccount googleAccount = await _googleSignIn.signIn();

      Navigator.push(context, MaterialPageRoute(
        builder: (_) => HomePage(googleAccount, _googleSignIn)
      ));

    } catch (error) {
      print(error);
    }
    
    // GoogleSignInAuthentication googleAuth = await googleAccount.authentication;

    // AuthCredential credential = GoogleAuthProvider.getCredential(
    //   idToken: googleAuth.idToken,
    //   accessToken: googleAuth.accessToken
    // );

    // FirebaseUser user = await _auth.signInWithCredential(credential);

    // return user;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Epoka Clubs'),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Spacer(flex: 1),
              Container(
                height: 250,
                child: Image.asset('res/img/epoka_icon.png')
              ),
              Spacer(flex: 1),
              RaisedButton(
                color: Colors.blue,
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Icon(Icons.mail_outline),
                    Text('Sign in with Epoka Mail'),
                  ],
                ),
                onPressed: _signIn,
              ),
            ],
          ),
        ),
      ),
    );
  }
}