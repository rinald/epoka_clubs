import './src/blocs/blocs.dart';
import './src/pages/pages.dart';
import './src/theme/theme.dart';
import './src/utils/utils.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onTransition(Transition transition) {
    super.onTransition(transition);
    print(transition);
  }

  @override
  void onError(Object error, StackTrace stacktrace) {
    super.onError(error, stacktrace);
    print(error);
  }
}

class _AppState extends State<App> {
  AuthenticationBloc _aBloc;
  SubscriptionBloc _sBloc;

  void initState() {
    super.initState();
    _aBloc = AuthenticationBloc();
    _sBloc = SubscriptionBloc();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProviderTree(
      blocProviders: [
        BlocProvider<AuthenticationBloc>(bloc: _aBloc),
        BlocProvider<SubscriptionBloc>(bloc: _sBloc),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (_) => LoginPage(),
          '/home': (_) => HomePage(),
        },
        title: 'Epoka Clubs',
        theme: lightTheme,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _aBloc.dispose();
    _sBloc.dispose();
  }
}

void main() {
  BlocSupervisor().delegate = SimpleBlocDelegate();
  runApp(App());
}
