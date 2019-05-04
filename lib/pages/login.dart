import '../util/index.dart';
// import '../models/epoka_user.dart';
// import './home.dart';
import '../blocs/authentication/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    ),
  );

  @override
  Widget build(BuildContext context) {
    final _bloc = BlocProvider.of<AuthenticationBloc>(context);

    return BlocListener(
      bloc: _bloc,
      listener: (context, AuthenticationState state) {
        if (state.signedIn == true) {
          Navigator.pushNamed(context, '/home');
        } else if (state.emailValid == false) {
          _showInvalidAccountAlert();
        }
      },
      child: Scaffold(
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
                  child: Image.asset('assets/images/epoka_icon.png'),
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
                  onPressed: _bloc.onSignIn,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}