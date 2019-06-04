import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

@immutable
abstract class AppState {}

class AppInitial extends AppState {}

class AppLoading extends AppState {}

class AppLoaded extends AppState {
  final SharedPreferences preferences;

  AppLoaded(this.preferences);
}
