import './clubs_view.dart';
import './events_view.dart';
import './user_view.dart';

import '../../utils/utils.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _index = 0;

  final _options = <Widget>[
    EventsView(),
    ClubsView(),
    UserView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Epoka Clubs',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              FontAwesomeIcons.search,
              size: 20.0,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: _options[_index],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.home),
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.compass),
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.userAlt),
          ),
        ],
        currentIndex: _index,
        onTap: (index) {
          setState(() {
            _index = index;
          });
        },
        fixedColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
