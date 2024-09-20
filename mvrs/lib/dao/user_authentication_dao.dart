/*
  Class: UserAuthenticationDao
    - This class is used to authenticate the user.
    - It is an additional layer of abstraction to provide proper structure to the app.
    - It's access the actual Firestore database to authenticate the user.
*/

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mvrs/entities/authentication_state_messenger.dart';
import 'package:mvrs/entities/signin_state_user.dart';
import 'package:mvrs/entities/signup_state_user.dart';

class UserAuthenticationDao {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  User? getCurrentUser() {
    return _auth.currentUser;
  }

  String getUID() {
    return _auth.currentUser!.uid;
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

  Future<bool> isUsernameUnique(String username) async {
    CollectionReference users = _firestore.collection('users');

    QuerySnapshot querySnapshot =
        await users.where('username', isEqualTo: username).get();

    if (querySnapshot.docs.isEmpty) {
      return true;
    } else {
      return false;
    }
  }

  Future<AuthenticationStateMessenger> createUserWithEmailAndPassword(
      SignupStateUser user) async {
    bool isUserCreated = false;

    String uid;
    String firstName = user.firstName;
    String username = user.username;
    String email = user.email;
    String password = user.password;

    bool isUserNameUnique = await isUsernameUnique(username);

    if (!isUserNameUnique) {
      return AuthenticationStateMessenger(
          null, 'username-not-available', 'Username already exists', false);
    }

    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      if (userCredential.user != null) {
        uid = userCredential.user!.uid;
        _auth.currentUser!.updateDisplayName(username);

        DocumentReference documentReference =
            _firestore.collection("users").doc(uid);
        Map<String, dynamic> userMap = <String, dynamic>{
          "firstName": firstName,
          "lastName": null,
          "username": username,
          "email": email,
          "dateOfBirth": null,
          "phoneNumber": null,
          "profilePictureUrl": null,
          "totalRentals": 0,
          "totalSpent": 0,
          "address": null,
          "createdAt": DateTime.now(),
          "updatedAt": DateTime.now(),
        };

        await documentReference.set(userMap).then((value) {
          isUserCreated = true;
        }).onError((error, stackTrace) {
          isUserCreated = false;
        });

        if (isUserCreated) {
          _auth.currentUser!.updateDisplayName(username);
          userCredential.user!.updateDisplayName(username);
          return AuthenticationStateMessenger(
              userCredential.user, null, null, true);
        } else {
          _auth.currentUser!.delete();
          userCredential.user!.delete();
          return AuthenticationStateMessenger(
              null, 'Error', 'Something went wrong, please try again.', false);
        }
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
