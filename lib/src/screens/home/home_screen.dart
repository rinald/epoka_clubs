import 'package:epokaclubs/src/blocs/app/app_bloc.dart';
import 'package:epokaclubs/src/blocs/blocs.dart';

import './clubs_view.dart';
import './events_view.dart';
import './user_view.dart';

import '../../utils/utils.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _index = 0;
  final _controller = PageController();
  SubscriptionBloc _subsBloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final _preferences =
        (BlocProvider.of<AppBloc>(context).currentState as AppLoaded)
            .preferences;

    _subsBloc = SubscriptionBloc(_preferences);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: _subsBloc,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Epoka Clubs',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: PageView(
          physics: NeverScrollableScrollPhysics(),
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
              title: Text('Feed'),
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.compass),
              title: Text('Discover'),
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.userAlt),
              title: Text('Account'),
            ),
          ],
          currentIndex: _index,
          onTap: (index) {
            setState(() {
              _index = index;
            });

            _controller.animateToPage(
              index,
              duration: Duration(milliseconds: 500),
              curve: Curves.easeOutExpo,
            );
          },
          fixedColor: Theme.of(context).primaryColor,
          showUnselectedLabels: false,
        ),
      ),
    );
  }
}
