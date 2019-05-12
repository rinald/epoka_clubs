import 'package:flutter/material.dart';

bool emailValid(String email) {
  if (email.contains('epoka.edu.al')) {
    return true;
  }

  return false;
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
