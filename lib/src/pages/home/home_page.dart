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
  final _controller = PageController();
  final _titles = <String>[
    'Feed',
    'Discover',
    'Account',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _titles[_index],
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
      body: PageView(
        physics: BouncingScrollPhysics(),
        controller: _controller,
        children: <Widget>[
          EventsView(),
          ClubsView(),
          UserView(),
        ],
        onPageChanged: (index) {
          setState(() {
            _index = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.home),
            title: Container(
              height: 0.0,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.compass),
            title: Container(
              height: 0.0,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.userAlt),
            title: Container(
              height: 0.0,
            ),
          ),
        ],
        currentIndex: _index,
        onTap: (index) {
          setState(() {
            _index = index;
          });

          _controller.animateToPage(
            index,
            duration: Duration(
              milliseconds: 500,
            ),
            curve: Curves.easeOutExpo,
          );
        },
        fixedColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
