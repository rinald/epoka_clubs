import 'util.dart';
import 'config.dart' as config;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _signOut() {
    config.googleSignIn.signOut().then((_) {
      Navigator.popUntil(context, ModalRoute.withName(Navigator.defaultRouteName));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.blue[800],
                        ),
                        height: 100,
                      ),
                    )
                  ],
                ),
                Column (
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 20, top: 10),
                      child: GoogleUserCircleAvatar(identity: config.user.account),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20, top: 5),
                      child: Text('${config.user.account.displayName}', 
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20),
                      child: Text('${config.user.account.email}', 
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            RouteTile(text: 'Subscriptions', route: '/subscriptions'),
            Divider(height: 5.0),
            RouteTile(text: 'Clubs', route: '/clubs'),
            Divider(height: 5.0),
            RouteTile(text: 'Events', route: '/events'),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              child: RaisedButton(
                color: Colors.blue,
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Icon(Icons.exit_to_app),
                    Text('Sign out'),
                  ],
                ),
                onPressed: _signOut,
              ),
            ),
          ]
        ),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Home'),
        actions: <Widget>[],
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.error, 
                size: 100,
                color: Colors.grey,
              ),
              Text('Nothing to see'),
              // Text('${config.user.userType}'),
            ],
          ),
        ),
      ),
    );
  }
}