import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

export 'package:flutter/material.dart';
export 'package:google_sign_in/google_sign_in.dart';

bool validEmail (String email) {
  if (email.contains('epoka.edu.al')) {
    return true;
  }

  return false;
}

class RouteTile extends StatelessWidget{
  RouteTile({this.text, this.route});
  final String text;
  final String route;
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapUp: (_) {
        Navigator.pushNamed(context, route);
      },
      child: ListTile (
        title: Text(
          text,
          style: TextStyle(
            fontSize: 15.0,
          ),
        ),
      ),
    );
  }
}

enum EpokaUserType {
  Staff,
  Student
}

class EpokaUser {
  EpokaUser({this.account, this.userType});

  final GoogleSignInAccount account;
  final EpokaUserType userType;
} 