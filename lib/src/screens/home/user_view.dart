import '../../blocs/app/bloc.dart';
import '../../blocs/authentication/bloc.dart';
import '../../utils/utils.dart';
import '../../widgets/google_avatar.dart';

void _onAuthStateChanged(BuildContext context, AuthenticationState state) {
  if (state is AuthenticationInitial) {
    Navigator.pushReplacementNamed(context, '/login');
  }
}

class UserView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _appBloc = BlocProvider.of<AppBloc>(context);
    final _appState = _appBloc.currentState as AppLoaded;
    final _authBloc = BlocProvider.of<AuthenticationBloc>(context);
    final _authState = _authBloc.currentState as SignedIn;

    return BlocListener(
      bloc: _authBloc,
      listener: _onAuthStateChanged,
      child: Column(
        children: <Widget>[
          ListTile(
            leading: GoogleAvatar(
              url: (_authState.user.account.photoUrl),
              radius: 20.0,
            ),
            title: Text(_authState.user.account.displayName),
            subtitle: Text(_authState.user.account.email),
          ),
          SizedBox(
            height: 8.0,
          ),
          FlatButton(
            color: Theme.of(context).accentColor,
            textColor: Colors.white,
            child: SizedBox(
              width: 300.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Icon(FontAwesomeIcons.signOutAlt),
                  Text('Sign out'),
                ],
              ),
            ),
            onPressed: () {
              _appState.preferences.setBool('signedIn', false);
              _authBloc.onSignOut();
            },
          ),
        ],
      ),
    );
  }
}
