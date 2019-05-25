import '../../data/events.dart';
import '../../data/clubs.dart';
import '../../utils/utils.dart';

class EventsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: events.length,
      itemBuilder: (context, index) {
        return ListTile(
          // leading: Icon(
          //   clubs.singleWhere((_club) => _club.name == events[index].club).icon,
          //   color: Theme.of(context).accentColor,
          //   size: 30.0,
          // ),
          title: Text('${events[index].title}'),
          subtitle: Text('${events[index].clubId.toString()}'),
        );
      },
    );
  }
}
