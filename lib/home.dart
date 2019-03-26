import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

final _googleSignIn = GoogleSignIn();

class HomePage extends StatelessWidget {
  final GoogleSignInAccount _account;
  HomePage(this._account);

  @override
  Widget build(BuildContext context) {
    void _signOut() async {
      _googleSignIn.signOut().then((account) {
        Navigator.of(context).pop();
      }).catchError((error) {
        print('Error: $error');
      });
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Home'),
        actions: <Widget>[
          
        ],
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Spacer(),
              GoogleUserCircleAvatar(identity: _account),
              Spacer(),
              Text(
                '${_account.displayName}',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              Spacer(),
              Text(
                '${_account.email}',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              Spacer(flex: 5),
              RaisedButton(
                color: Colors.blue,
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                  // side: BorderSide(
                  //   color: Colors.black,
                  //   width: 2.0,
                  // ),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Icon(Icons.person_outline),
                    Text('Sign out'),
                  ],
                ),
                onPressed: _signOut,
              ),
            ],
          ),
        ),
      ),
    );
  }
}