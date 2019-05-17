import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class SubscriptionBloc extends Bloc<SubscriptionEvent, SubscriptionState> {
  @override
  SubscriptionState get initialState => SubscriptionState.initial();

  @override
  Stream<SubscriptionState> mapEventToState(
    SubscriptionEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
