import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bloc/bloc.dart';

import './app.dart';

class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onTransition(Transition transition) {
    super.onTransition(transition);
    print(transition);
  }

  @override
  void onError(Object error, StackTrace stacktrace) {
    super.onError(error, stacktrace);
    print(error);
  }
}

void main() {
  BlocSupervisor().delegate = SimpleBlocDelegate();
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.blue[900]));
  runApp(App());
}
