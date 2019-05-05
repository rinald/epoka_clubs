import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/authentication/bloc.dart';
import '../utils/utils.dart';

void _onStateChange(BuildContext context, AuthenticationState state) {
  if (state.signedIn) {
    Navigator.pushNamed(context, '/home');
  } else if (!state.emailValid) {
    showInvalidAccountAlert(context);
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _bloc = BlocProvider.of<AuthenticationBloc>(context);

    return BlocListener(
      bloc: _bloc,
      listener: _onStateChange,
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
                      Icon(FontAwesomeIcons.signInAlt),
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
