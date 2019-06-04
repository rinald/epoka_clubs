import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './bloc.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  @override
  AppState get initialState => AppInitial();

  void onLoadPreferences() {
    dispatch(AppStarted());
  }

  void onAppFinishedLoading(SharedPreferences preferences) {
    dispatch(AppFinishedLoading(preferences));
  }

  @override
  Stream<AppState> mapEventToState(
    AppEvent event,
  ) async* {
    if (event is AppStarted) {
      yield AppLoading();

      final _preferences = await SharedPreferences.getInstance();
      yield AppLoaded(_preferences);
    }
  }
}
