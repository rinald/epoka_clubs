import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './bloc.dart';

class SubscriptionBloc extends Bloc<SubscriptionEvent, SubscriptionState> {
  SharedPreferences preferences;

  SubscriptionBloc(this.preferences);

  @override
  SubscriptionState get initialState =>
      SubscriptionState(preferences.getStringList('subscriptions'));

  void onSubscribe(String clubName) {
    dispatch(SubscribeEvent(clubName));
  }

  void onUnsubscribe(String clubName) {
    dispatch(UnsubscribeEvent(clubName));
  }

  @override
  Stream<SubscriptionState> mapEventToState(
    SubscriptionEvent event,
  ) async* {
    final _subscriptions = List<String>.from(currentState.subscriptions);

    if (event is SubscribeEvent) {
      _subscriptions.add(event.clubName);
    } else if (event is UnsubscribeEvent) {
      _subscriptions.remove(event.clubName);
    }

    preferences.setStringList('subscriptions', _subscriptions);

    yield SubscriptionState(_subscriptions);
  }
}
