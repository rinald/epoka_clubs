import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';


import 'home.dart';

final _googleSignIn = GoogleSignIn(
  scopes: [
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  void _query() {
    Firestore.instance.collection('Clubs')
      .snapshots()
      .listen((data) {
        data.documents.forEach((doc) {
          print(doc['admin']);
        });
      });
  }

  void _signInGoogle() async {
     String _adminName = await getFirstClub();
    _googleSignIn.signIn().then((account) {
      print(account.displayName);
      print(account.email);
      print(account.photoUrl);
      print(_adminName);
      print(account.id);
      // _query();

      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => HomePage(account),
      ));
    }).catchError((error) {
      print('Error: $error');
    });
  }

  Future<String> getFirstClub() async {
    DocumentSnapshot querySnapshot = await Firestore.instance
      .collection('Clubs')
      .document('1')
      .get();
    if (querySnapshot.exists && querySnapshot.data.containsKey('admin')) {
      return querySnapshot.data['admin'];
    } else {
      return 'empty';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                'Login',
                style: TextStyle(
                  fontSize: 50,
                ),
              ),
              RaisedButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Icon(Icons.person_outline),
                    Text('Sign in with Google'),
                  ],
                ),
                onPressed: _signInGoogle,
                color: Colors.blue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}