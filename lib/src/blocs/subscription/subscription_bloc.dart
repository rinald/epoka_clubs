import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

import '../../models/club.dart';

class SubscriptionBloc extends Bloc<SubscriptionEvent, SubscriptionState> {
  @override
  SubscriptionState get initialState => SubscriptionState(<Club>[]);

  void onSubscribe(Club club) {
    dispatch(SubscribeEvent(club));
  }

  void onUnsubscribe(Club club) {
    dispatch(UnsubscribeEvent(club));
  }

  @override
  Stream<SubscriptionState> mapEventToState(
    SubscriptionEvent event,
  ) async* {
    final _subscriptions = List<Club>.from(currentState.subscriptions);

    if (event is SubscribeEvent) {
      _subscriptions.add(event.club);
    } else if (event is UnsubscribeEvent) {
      _subscriptions.remove(event.club);
    }

    yield SubscriptionState(_subscriptions);
  }
}
