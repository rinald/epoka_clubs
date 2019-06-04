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

  // Future<FirebaseUser> get user => _firebaseAuth.currentUser();

  Future<EpokaUser> signIn() async {
    EpokaUser user;
    FirebaseUser _firebaseUser;

    _firebaseUser = await _firebaseAuth.currentUser();

    if (_firebaseUser == null) {
      final GoogleSignInAccount _account = await _googleSignIn.signIn();
      final _googleAuth = await _account.authentication;

      final AuthCredential _credential = GoogleAuthProvider.getCredential(
        accessToken: _googleAuth.accessToken,
        idToken: _googleAuth.idToken,
      );

      _firebaseUser = await _firebaseAuth.signInWithCredential(_credential);
    }

    if (emailValid(_firebaseUser.email)) {
      user = EpokaUser(account: _firebaseUser);
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
