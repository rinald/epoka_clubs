import './src/blocs/blocs.dart';
import './src/screens/screens.dart';
import './src/theme/theme.dart';
import './src/utils/utils.dart';

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

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  AppBloc _appBloc;
  AuthenticationBloc _authBloc;

  void initState() {
    super.initState();
    _appBloc = AppBloc();
    _authBloc = AuthenticationBloc();
  }

  void _onAppStateChange(BuildContext context, AppState state) {
    if (state is AppInitial) {
      _appBloc.onLoadPreferences();
    } else if (state is AppLoaded) {
      if (state.preferences.getBool('signedIn') ?? false) {
        if (state.preferences.getStringList('subscriptions') == null) {
          state.preferences.setStringList('subscriptions', <String>[]);
        }
        _authBloc.onSignIn();
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        Navigator.pushReplacementNamed(context, '/login');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProviderTree(
      blocProviders: [
        BlocProvider<AppBloc>(bloc: _appBloc),
        BlocProvider<AuthenticationBloc>(bloc: _authBloc),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BlocListener(
          bloc: _appBloc,
          listener: _onAppStateChange,
          child: BlocBuilder(
            bloc: _appBloc,
            builder: (context, state) {
              // print('Building...');
              return SplashScreen();
            },
          ),
        ),
        routes: {
          '/login': (_) => LoginScreen(),
          '/home': (_) => HomeScreen(),
        },
        title: 'Epoka Clubs',
        theme: lightTheme,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _appBloc.dispose();
    _authBloc.dispose();
  }
}

void main() {
  BlocSupervisor().delegate = SimpleBlocDelegate();
  runApp(App());
}
