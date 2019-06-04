import '../../models/club.dart';

class SubscriptionState {
  SubscriptionState(this.subscriptions);
  final List<Club> subscriptions;

  @override
  String toString() {
    return 'SubscriptionState(subscriptions: $subscriptions)';
  }
}
