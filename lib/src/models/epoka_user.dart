import 'package:epokaclubs/src/utils/utils.dart';

enum EpokaUserType { Staff, Student }

class EpokaUser {
  EpokaUser({this.account});

  final FirebaseUser account;
  // final EpokaUserType userType;

  @override
  String toString() {
    return 'EpokaUser {account: $account}';
  }
}
