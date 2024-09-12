/*
  Class: AuthenticationStateMessenger
    - This class is used to return the state weather the user is authenticated or not.
    - Also returns the error message if any occurs.
    - Returns the user object if the user is authenticated.
*/

import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationStateMessenger {
  User? _user;
  String? _errorMessage;
  String? _errorCode;
  bool _isAuthenticated = false;

  AuthenticationStateMessenger(
    this._user,
    this._errorCode,
    this._errorMessage,
    this._isAuthenticated,
  );

  set user(User? user) => _user = user;
  set errorCode(String? errorCode) => _errorCode = errorCode;
  set error(String? error) => _errorMessage = error;
  set isAuthenticated(bool isAuthenticated) =>
      _isAuthenticated = isAuthenticated;

  User? get user => _user;
  String? get errorCode => _errorCode;
  String? get errorMessage => _errorMessage;
  bool get isAuthenticated => _isAuthenticated;
}
