import '../../models/epoka_user.dart';

abstract class AuthenticationState {}

class AuthenticationInitial extends AuthenticationState {}

class SignedIn extends AuthenticationState {
  final EpokaUser user;

  SignedIn(this.user);
}

class SignedOff extends AuthenticationState {}

class Offline extends AuthenticationState {}
