import 'package:mvrs/entities/user.dart';

class UserWithMessage {
  String _message;
  User? _user;

  UserWithMessage(this._message, this._user);

  User? get user => _user;
  String get message => _message;
}
