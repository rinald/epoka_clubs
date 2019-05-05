import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/authentication/bloc.dart';
import '../utils/utils.dart';
import '../widgets/widgets.dart';

void _onStateChange(BuildContext context, AuthenticationState state) {
  if (!state.signedIn) {
    Navigator.popUntil(context, ModalRoute.withName('/'));
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _bloc = BlocProvider.of<AuthenticationBloc>(context);

    return BlocListener(
      bloc: _bloc,
      listener: _onStateChange,
      child: Scaffold(
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
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 20, top: 10),
                        child: GoogleUserCircleAvatar(
                            identity: _bloc.currentState.user.account),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20, top: 5),
                        child: Text(
                          '${_bloc.currentState.user.account.displayName}',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        child: Text(
                          '${_bloc.currentState.user.account.email}',
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
                      Icon(FontAwesomeIcons.signOutAlt),
                      Text('Sign out'),
                    ],
                  ),
                  onPressed: _bloc.onSignOut,
                ),
              ),
            ],
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
                Icon(
                  Icons.error,
                  size: 100,
                  color: Colors.grey,
                ),
                Text('Nothing to see'),
                Text('${_bloc.currentState.user.userType}'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
