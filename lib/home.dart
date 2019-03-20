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
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                'Home',
                style: TextStyle(
                  fontSize: 50,
                ),
              ),
              GoogleUserCircleAvatar(identity: _account),
              Text(
                '${_account.displayName}',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              Text(
                '${_account.email}',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              RaisedButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Icon(Icons.exit_to_app),
                    Text('Sign out'),
                  ],
                ),
                onPressed: _signOut,
                color: Colors.blue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}