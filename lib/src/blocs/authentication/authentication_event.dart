import 'package:meta/meta.dart';

@immutable
abstract class AuthenticationEvent {}

class SignInEvent extends AuthenticationEvent {}

class SignOutEvent extends AuthenticationEvent {}
