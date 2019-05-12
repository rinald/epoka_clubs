import '../../blocs/authentication/bloc.dart';
import '../../utils/utils.dart';

void _onStateChanged(BuildContext context, AuthenticationState state) {
  if (!state.signedIn) {
    Navigator.pushReplacementNamed(context, '/');
  }
}

class UserView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _bloc = BlocProvider.of<AuthenticationBloc>(context);

    return BlocListener(
      bloc: _bloc,
      listener: _onStateChanged,
      child: Column(
        children: <Widget>[
          ListTile(
            leading: GoogleUserCircleAvatar(
              identity: _bloc.currentState.user.account,
            ),
            title: Text(_bloc.currentState.user.account.displayName),
            subtitle: Text(_bloc.currentState.user.account.email),
          ),
          SizedBox(
            height: 5.0,
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 8.0,
            ),
            child: FlatButton(
              color: Theme.of(context).accentColor,
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Icon(FontAwesomeIcons.signOutAlt),
                  Text('Sign out'),
                ],
              ),
              onPressed: _bloc.onSignOut,
            ),
          ),
        ],
      ),
    );
  }
}
