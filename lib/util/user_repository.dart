import 'dart:async';
import '../util/index.dart';
import '../models/epoka_user.dart';

class UserRepository {
  final _googleSignIn = GoogleSignIn();

  Future<EpokaUser> signIn() async {
    EpokaUser user;
    final GoogleSignInAccount _account = await _googleSignIn.signIn();
    final String _email = _account.email;

    if (emailValid(_email)) {
      EpokaUserType _userType = EpokaUserType.Student;

      if (!_email.contains(RegExp(r'[0-9]+'))) {
        _userType = EpokaUserType.Staff;
      }

      user = EpokaUser(
        account: _account,
        userType: _userType,
      );
    } else {
      user = null;
      _googleSignIn.signOut();
    }

    return user;
  }

  void signOut() {
    _googleSignIn.signOut();
  }
}