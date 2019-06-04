import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/app/bloc.dart';
import '../blocs/authentication/bloc.dart';
import '../utils/utils.dart';

void _onAuthStateChange(BuildContext context, AuthenticationState state) {
  switch (state.runtimeType) {
    case SignedIn:
      Navigator.pushReplacementNamed(context, '/home');
      break;
    case SignedOff:
      showInvalidAccountAlert(context);
      break;
    case Offline:
      showNetworkError(context);
      break;
  }
}

class _LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _appBloc = BlocProvider.of<AppBloc>(context);
    final _appState = _appBloc.currentState as AppLoaded;
    final _authBloc = BlocProvider.of<AuthenticationBloc>(context);

    return BlocListener(
      bloc: _authBloc,
      listener: _onAuthStateChange,
      child: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Spacer(flex: 1),
              SizedBox(
                width: 175,
                height: 175,
                child: Image.asset('assets/images/epoka_icon.png'),
              ),
              Spacer(flex: 1),
              FlatButton(
                color: Theme.of(context).accentColor,
                textColor: Colors.white,
                child: SizedBox(
                  width: 300.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Icon(FontAwesomeIcons.signInAlt),
                      Text('Sign in with Epoka Mail'),
                    ],
                  ),
                ),
                onPressed: () {
                  _appState.preferences.setBool('signedIn', true);
                  _authBloc.onSignIn();
                },
              ),
              SizedBox(
                height: 75.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Epoka Clubs'),
      ),
      body: _LoginScreen(),
    );
  }
}
