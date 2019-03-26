import 'package:google_sign_in/google_sign_in.dart';

enum EpokaUserType {
  Staff,
  Student
}

class EpokaUser {
  final GoogleSignInAccount account;
  final EpokaUserType userType;
  EpokaUser({this.account, this.userType: EpokaUserType.Student});
} 