import 'package:epokaclubs/src/utils/utils.dart';

class EpokaUser {
  final FirebaseUser account;

  EpokaUser({this.account});

  @override
  String toString() {
    return 'EpokaUser {account: $account}';
  }
}
