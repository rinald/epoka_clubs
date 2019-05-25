import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

import '../../models/club.dart';

class SubscriptionBloc extends Bloc<SubscriptionEvent, SubscriptionState> {
  @override
  SubscriptionState get initialState => subscriptionState;

  void onSubscribe(Club club) {
    this.dispatch(SubscribeEvent(club));
  }

  void onUnsubscribe(Club club) {
    this.dispatch(UnsubscribeEvent(club));
  }

  @override
  Stream<SubscriptionState> mapEventToState(
    SubscriptionEvent event,
  ) async* {
    if (event is SubscribeEvent) {
      yield subscriptionState..subscribe(event.club);
    } else if (event is UnsubscribeEvent) {
      yield subscriptionState..unsubscribe(event.club);
    }
  }
}
