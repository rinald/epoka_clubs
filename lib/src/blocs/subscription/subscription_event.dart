import 'package:meta/meta.dart';

import '../../models/club.dart';

@immutable
abstract class SubscriptionEvent {}

class SubscribeEvent extends SubscriptionEvent {
  SubscribeEvent(this.club);
  final Club club;
}

class UnsubscribeEvent extends SubscriptionEvent {
  UnsubscribeEvent(this.club);
  final Club club;
}
