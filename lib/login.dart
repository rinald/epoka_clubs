import 'util.dart';
import 'home.dart';
import 'config.dart' as config;

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  void _showInvalidAccountAlert () => showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Access Denied'),
        content: Text('You can only sign in with a valid Epoka Mail account.'),
        actions: <Widget>[
          FlatButton(
            child: Text('Dismiss'),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      )
  );

  void _signIn() {
    config.googleSignIn.signIn().then((_account) {
      final String _email = _account.email;

      if (validEmail(_email)) {
        var _type = EpokaUserType.Student;

        if (!_email.contains(RegExp(r'[0-9]+'))) {
          _type = EpokaUserType.Staff;
        }

        config.user = EpokaUser(
            account: _account,
            userType: _type
        );

        Navigator.push(context, MaterialPageRoute(
            builder: (_) => HomePage()
        ));
      } else {
        config.googleSignIn.signOut().then((_) {
          _showInvalidAccountAlert();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Epoka Clubs'),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Spacer(flex: 1),
              Container(
                  height: 250,
                  child: Image.asset('res/img/epoka_icon.png')
              ),
              Spacer(flex: 1),
              RaisedButton(
                color: Colors.blue,
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Icon(Icons.mail_outline),
                    Text('Sign in with Epoka Mail'),
                  ],
                ),
                onPressed: _signIn,
              ),
            ],
          ),
        ),
      ),
    );
  }
}