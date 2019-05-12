import 'package:flutter/material.dart';

import './colors.dart';
import './text_theme.dart';
import './widget_themes.dart';

final lightTheme = ThemeData(
  fontFamily: 'FiraSans',
  primaryColor: primaryColor,
  accentColor: accentColor,
  scaffoldBackgroundColor: Colors.grey[100],
  appBarTheme: appBarTheme,
  cardTheme: cardTheme,
  textTheme: textTheme,
);
