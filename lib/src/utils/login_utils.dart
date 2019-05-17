import 'package:flutter/material.dart';

bool emailValid(String email) {
  if (email.contains('epoka.edu.al')) {
    return true;
  }

  return false;
}

void showNetworkError(BuildContext context) {
  final snackBar = SnackBar(
    content: Text(
      'You are currently offline. Please try again later.',
      style: TextStyle(
        fontSize: 15.0,
        fontWeight: FontWeight.w600,
      ),
    ),
    backgroundColor: Colors.red,
    duration: Duration(seconds: 2),
  );

  Scaffold.of(context).showSnackBar(snackBar);
}

void showInvalidAccountAlert(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('Access Denied'),
        content: Text('You can only sign in with a valid Epoka Mail account.'),
        actions: <Widget>[
          FlatButton(
            child: Text('Dismiss'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      );
    },
  );
}
