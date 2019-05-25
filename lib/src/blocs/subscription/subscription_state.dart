import '../../models/club.dart';

class SubscriptionState {
  SubscriptionState._();
  List<Club> subscriptions = <Club>[];

  void subscribe(Club club) {
    subscriptions.add(club);
  }

  void unsubscribe(Club club) {
    subscriptions.remove(club);
  }

  @override
  String toString() {
    return 'SubscriptionState(subscriptions: $subscriptions)';
  }
}

final subscriptionState = SubscriptionState._();
