import 'package:meta/meta.dart';

@immutable
abstract class SubscriptionEvent {}

class SubscribeEvent extends SubscriptionEvent {
  final String clubName;

  SubscribeEvent(this.clubName);
}

class UnsubscribeEvent extends SubscriptionEvent {
  final String clubName;

  UnsubscribeEvent(this.clubName);
}
