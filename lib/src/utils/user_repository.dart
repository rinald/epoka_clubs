import 'dart:async';

import '../models/epoka_user.dart';
import '../utils/utils.dart';

class UserRepository {
  final _firebaseAuth = FirebaseAuth.instance;
  final _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  Future<EpokaUser> signIn() async {
    EpokaUser user;

    final GoogleSignInAccount _account = await _googleSignIn.signIn();
    final _googleAuth = await _account.authentication;

    final AuthCredential _credential = GoogleAuthProvider.getCredential(
      accessToken: _googleAuth.accessToken,
      idToken: _googleAuth.idToken,
    );

    final FirebaseUser _firebaseUser =
        await _firebaseAuth.signInWithCredential(_credential);

    final String _email = _account.email;
    if (emailValid(_email)) {
      EpokaUserType _userType = EpokaUserType.Student;

      if (!_email.contains(RegExp(r'[0-9]+'))) {
        _userType = EpokaUserType.Staff;
      }

      user = EpokaUser(
        account: _firebaseUser,
        userType: _userType,
      );
    } else {
      user = null;
      _firebaseAuth.signOut();
      _googleSignIn.signOut();
    }

    return user;
  }

  void signOut() {
    _firebaseAuth.signOut();
    _googleSignIn.signOut();
  }
}
