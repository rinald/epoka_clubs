import '../../models/epoka_user.dart';

class AuthenticationState {
  EpokaUser user;
  bool emailValid;
  bool signedIn;

  AuthenticationState._();

  factory AuthenticationState.initial() {
    return AuthenticationState._()
      ..user = null
      ..emailValid = true
      ..signedIn = false;
  }

  factory AuthenticationState.success(EpokaUser user) {
    return AuthenticationState._()
      ..user = user
      ..emailValid = true
      ..signedIn = true;
  }

  factory AuthenticationState.failure() {
    return AuthenticationState._()
      ..user = null
      ..emailValid = false
      ..signedIn = false;
  }

  @override
  String toString() {
    return '''
    AuthenticationState {
      user: $user,
      emailValid: $emailValid,
      signedIn: $signedIn,
    }
    ''';
  }
}
