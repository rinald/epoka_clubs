import 'dart:async';

import '../models/epoka_user.dart';
import '../utils/utils.dart';

class UserRepository {
  final _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  Future<EpokaUser> signIn() async {
    EpokaUser user;

    final GoogleSignInAccount _account = await _googleSignIn.signIn();
    final String _email = _account.email;

    // if (emailValid(_email)) {
    EpokaUserType _userType = EpokaUserType.Student;

    if (!_email.contains(RegExp(r'[0-9]+'))) {
      _userType = EpokaUserType.Staff;
    }

    user = EpokaUser(
      account: _account,
      userType: _userType,
    );
    // } else {
    //   user = null;
    //   _googleSignIn.signOut();
    // }

    return user;
  }

  void signOut() {
    _googleSignIn.signOut();
  }
}
