import '../utils/utils.dart';
import '../models/club.dart';
import '../data/events.dart';

class ClubInfoPage extends StatelessWidget {
  ClubInfoPage(this.club);
  final Club club;

  @override
  Widget build(BuildContext context) {
    final _events = events.where((event) => event.clubId == club.id).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(club.name),
      ),
      body: ListView.builder(
        itemCount: _events.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_events[index].title),
            subtitle: Text(_events[index].clubId.toString()),
          );
        },
      ),
    );
  }
}
