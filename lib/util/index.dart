export 'package:flutter/material.dart';
export 'package:flutter/cupertino.dart' show CupertinoPageRoute;
export 'package:google_sign_in/google_sign_in.dart';
export 'package:cloud_firestore/cloud_firestore.dart';

bool emailValid (String email) {
  if (email.contains('epoka.edu.al')) {
    return true;
  }

  return false;
}