/*
  Class: UserAuthenticationDao
    - This class is used to authenticate the user.
    - It is an additional layer of abstraction to provide proper structure to the app.
    - It's access the actual Firestore database to authenticate the user.
*/

import 'package:firebase_auth/firebase_auth.dart';
import 'package:mvrs/entities/authentication_state_messenger.dart';
import 'package:mvrs/entities/signin_state_user.dart';

class UserAuthenticationDao {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? getCurrentUser() {
    return _auth.currentUser;
  }

  Future<AuthenticationStateMessenger> signInWithEmailAndPassword(
      SigninStateUser user) async {
    String email = user.email;
    String password = user.password;

    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (userCredential.user != null) {
        return AuthenticationStateMessenger(
            userCredential.user, null, null, true);
      } else {
        return AuthenticationStateMessenger(
            null, 'Error', 'Something went wrong, please try again.', false);
      }
    } on FirebaseAuthException catch (e) {
      return AuthenticationStateMessenger(null, e.code, e.message, false);
    }
  }

  AuthenticationStateMessenger signOut(User currentlySignedInUser) {
    try {
      _auth.signOut();
      return AuthenticationStateMessenger(
          currentlySignedInUser, "Success", "Signed out", false);
    } catch (e) {
      return AuthenticationStateMessenger(
        currentlySignedInUser,
        "Error",
        e.toString(),
        true,
      );
    }
  }
}
