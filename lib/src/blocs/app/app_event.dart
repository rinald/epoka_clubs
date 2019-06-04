import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

@immutable
abstract class AppEvent {}

class AppStarted extends AppEvent {}

class AppFinishedLoading extends AppEvent {
  final SharedPreferences preferences;

  AppFinishedLoading(this.preferences);
}
