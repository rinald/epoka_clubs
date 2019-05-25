import 'package:epokaclubs/src/blocs/subscription/bloc.dart';
import '../../models/event.dart';
import '../../data/events.dart';
// import '../../data/clubs.dart';
import '../../utils/utils.dart';

class EventsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _bloc = BlocProvider.of<SubscriptionBloc>(context);

    return BlocBuilder(
      bloc: _bloc,
      builder: (context, state) {
        final _subs = state.subscriptions;
        // print(_subs.toString());
        final _events = <Event>[];

        for (int i = 0; i < _subs.length; ++i) {
          for (int j = 0; j < events.length; ++j) {
            if (events[j].club == _subs[i].name) {
              _events.add(events[j]);
            }
          }
        }

        if (_events.length == 0) {
          return ListTile(
            leading: Icon(
              FontAwesomeIcons.infoCircle,
              size: 26.0,
            ),
            title: Text('Your feed seems to be empty...'),
            // subtitle: Text('Consider going to the next page to follow clubs'),
            // trailing: Icon(FontAwesomeIcons.arrowRight),
          );
        } else {
          return ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: _events.length,
            itemBuilder: (context, index) {
              return ListTile(
                // leading: Icon(
                //   clubs.singleWhere((_club) => _club.name == events[index].club).icon,
                //   color: Theme.of(context).accentColor,
                //   size: 30.0,
                // ),
                title: Text('${_events[index].title}'),
                subtitle: Text('${_events[index].club}'),
              );
            },
          );
        }
      },
    );
  }
}
