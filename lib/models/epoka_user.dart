import 'package:google_sign_in/google_sign_in.dart';

enum EpokaUserType {
  Staff,
  Student
}

class EpokaUser {
  EpokaUser({this.account, this.userType});

  final GoogleSignInAccount account;
  final EpokaUserType userType;

  @override
  String toString() {
    return '''EpokaUser {
      account: $account,
      userType: $userType,
    }''';
  }
}

class MockUser {
  MockUser({this.name, this.email, this.userType = EpokaUserType.Student});
  final String name;
  final String email;
  final EpokaUserType userType;
}