import '../../models/epoka_user.dart';

class AuthenticationState {
  EpokaUser user;
  bool emailValid;
  bool signedIn;
  bool online;

  AuthenticationState._();

  factory AuthenticationState.initial() {
    return AuthenticationState._()
      ..user = null
      ..emailValid = true
      ..signedIn = false
      ..online = true;
  }

  factory AuthenticationState.success(EpokaUser user) {
    return AuthenticationState._()
      ..user = user
      ..emailValid = true
      ..signedIn = true
      ..online = true;
  }

  factory AuthenticationState.failure() {
    return AuthenticationState._()
      ..user = null
      ..emailValid = false
      ..signedIn = false
      ..online = true;
  }

  factory AuthenticationState.offline() {
    return AuthenticationState._()
      ..user = null
      ..emailValid = true
      ..signedIn = false
      ..online = false;
  }

  @override
  String toString() {
    return 'AuthenticationState {user: $user, emailValid: $emailValid, signedIn: $signedIn, online: $online}';
  }
}
