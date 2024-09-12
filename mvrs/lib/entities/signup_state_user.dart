/*
  Class: SignupStateUser
    - This class represents the state of the user during the signup process.
    - The user's first name, username, email, and password are used to create a new user.
*/

class SignupStateUser {
  String _firstName;
  String _username;
  String _email;
  String _password;

  SignupStateUser(
    this._firstName,
    this._username,
    this._email,
    this._password,
  );

  set firstName(String firstName) => _firstName = firstName;
  set username(String username) => _username = username;
  set email(String email) => _email = email;
  set password(String password) => _password = password;

  String get firstName => _firstName;
  String get username => _username;
  String get email => _email;
  String get password => _password;
}
