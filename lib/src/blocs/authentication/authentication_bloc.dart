import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';

import './bloc.dart';
import '../../models/epoka_user.dart';
import '../../utils/user_repository.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final _repository = UserRepository();

  @override
  AuthenticationState get initialState => AuthenticationState.initial();

  void onSignIn() {
    this.dispatch(SignInEvent());
  }

  void onSignOut() {
    this.dispatch(SignOutEvent());
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
          yield AuthenticationState.success(_user);
        } else {
          yield AuthenticationState.failure();
        }
      } catch (exception) {
        if (exception is PlatformException) {
          if (exception.code == 'ERROR_NETWORK_REQUEST_FAILED') {
            yield AuthenticationState.offline();
          }
        }
      }
    } else if (event is SignOutEvent) {
      _repository.signOut();
      yield AuthenticationState.initial();
    }
  }
}
