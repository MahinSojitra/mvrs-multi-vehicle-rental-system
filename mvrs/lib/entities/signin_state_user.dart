/*
  Class: SigninStateUser
    - This class is represents the state of the user during the signin process.
    - The user's email and password are used to authenticate the user.
*/

class SigninStateUser {
  String _email;
  String _password;

  SigninStateUser(this._email, this._password);

  set email(String email) => _email = email;
  set password(String password) => _password = password;

  String get email => _email;
  String get password => _password;
}
