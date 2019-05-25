import 'package:epokaclubs/src/utils/utils.dart';
import 'package:flutter/material.dart';

import './colors.dart';
import './text_theme.dart';
import './widget_themes.dart';

final lightTheme = ThemeData(
  fontFamily: 'FiraSans',
  primaryColor: primaryColor,
  accentColor: accentColor,
  scaffoldBackgroundColor: scaffoldBackgroundColor,
  cardTheme: cardTheme,
  buttonTheme: buttonTheme,
  textTheme: textTheme,
  primaryTextTheme: textTheme,
  accentTextTheme: textTheme,
  pageTransitionsTheme: PageTransitionsTheme(
    builders: {
      TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      TargetPlatform.fuchsia: CupertinoPageTransitionsBuilder(),
    },
  ),
);
