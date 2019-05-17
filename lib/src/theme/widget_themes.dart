import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import './colors.dart';

import '../utils/utils.dart';

final buttonTheme = ButtonThemeData(
  // textTheme: ButtonTextTheme.normal,
  // buttonColor: accentColor,
  splashColor: primaryColor,
  highlightColor: primaryColor,
  disabledColor: Colors.grey[100],
  padding: EdgeInsets.symmetric(
    horizontal: 10.0,
    vertical: 5.0,
  ),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(30.0),
  ),
);

final cardTheme = CardTheme(
  elevation: 1.0,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(15.0)),
  ),
);
