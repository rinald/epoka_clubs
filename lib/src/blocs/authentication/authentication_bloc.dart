import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:epokaclubs/src/utils/utils.dart';
import 'package:flutter/services.dart';

import './bloc.dart';

import '../../models/epoka_user.dart';
import '../../utils/user_repository.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final _repository = UserRepository();

  @override
  AuthenticationState get initialState => AuthenticationInitial();

  void onSignIn() {
    dispatch(SignInEvent());
  }

  void onSignOut() {
    dispatch(SignOutEvent());
  }

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is SignInEvent) {
      EpokaUser _user;

      try {
        _user = await _repository.signIn();

        if (_user != null) {
          yield SignedIn(_user);
        } else {
          yield SignedOff();
        }
      } on PlatformException catch (exception) {
        if (exception.code == 'ERROR_NETWORK_REQUEST_FAILED') {
          yield Offline();
        }
        print(exception.code);
      }
    } else if (event is SignOutEvent) {
      _repository.signOut();
      yield AuthenticationInitial();
    }
  }
}
