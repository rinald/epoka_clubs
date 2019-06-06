import '../../blocs/subscription/bloc.dart';
import '../../data/events.dart';
import '../../models/event.dart';
import '../../utils/utils.dart';

class EventsView extends StatelessWidget {
  List<Event> subscribedEvents(List<String> subscriptions) {
    final _events = <Event>[];

    for (int i = 0; i < subscriptions.length; ++i) {
      for (int j = 0; j < events.length; ++j) {
        if (events[j].clubName == subscriptions[i]) {
          _events.add(events[j]);
        }
      }
    }

    return _events;
  }

  @override
  Widget build(BuildContext context) {
    final _bloc = BlocProvider.of<SubscriptionBloc>(context);

    return BlocBuilder(
      bloc: _bloc,
      builder: (context, state) {
        final _events = subscribedEvents(state.subscriptions);

        if (_events.isEmpty) {
          return ListTile(
            leading: Icon(
              FontAwesomeIcons.infoCircle,
              size: 26.0,
            ),
            title: Text('Your feed seems to be empty...'),
          );
        } else {
          return ListView.builder(
            itemCount: _events.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(_events[index].title),
                subtitle: Text(_events[index].clubName),
              );
            },
          );
        }
      },
    );
  }
}
