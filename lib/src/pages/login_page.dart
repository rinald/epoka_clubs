import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/authentication/bloc.dart';
import '../utils/utils.dart';

void _onStateChange(BuildContext context, AuthenticationState state) {
  if (state.signedIn) {
    Navigator.pushReplacementNamed(context, '/home');
  } else if (!state.emailValid) {
    showInvalidAccountAlert(context);
  } else if (!state.online) {
    showNetworkError(context);
  }
}

class _LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _bloc = BlocProvider.of<AuthenticationBloc>(context);

    return BlocListener(
      bloc: _bloc,
      listener: _onStateChange,
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
                onPressed: _bloc.onSignIn,
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

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Epoka Clubs'),
      ),
      body: _LoginPage(),
    );
  }
}
