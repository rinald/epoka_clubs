import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './pages/pages.dart';
import './utils/user_repository.dart';
import './blocs/authentication/bloc.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final _repository = UserRepository();
  AuthenticationBloc _bloc;

  void initState() {
    super.initState();
    _bloc = AuthenticationBloc(repository: _repository);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: _bloc,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (_) => LoginPage(),
          '/home': (_) => HomePage(),
          '/subscriptions': (_) => SubscriptionsPage(),
          '/events': (_) => EventsPage(),
          '/clubs': (_) => ClubsPage(),
        },
        title: 'Epoka Clubs',
        theme: ThemeData(
          primaryColor: Colors.blue[800],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _bloc.dispose();
  }
}
