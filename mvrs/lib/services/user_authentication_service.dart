/*
  Class: UserAuthenticationService
    - This service class is used to authenticate the user.
    - It is an additional layer of abstraction to provide proper structure to the app.
    - It's access the dao(data access object) to authenticate the user.
*/

import 'package:firebase_auth/firebase_auth.dart';
import 'package:mvrs/dao/user_authentication_dao.dart';
import 'package:mvrs/entities/authentication_state_messenger.dart';
import 'package:mvrs/entities/custom_message.dart';
import 'package:mvrs/entities/signin_state_user.dart';
import 'package:mvrs/entities/signup_state_user.dart';

class UserAuthenticationService {
  final UserAuthenticationDao _dao = UserAuthenticationDao();

  User? getCurrentUser() {
    return _dao.getCurrentUser();
  }

  String getUID() {
    return _dao.getUID();
  }

  Future<CustomMessage> signInWithEmailAndPassword(SigninStateUser user) async {
    AuthenticationStateMessenger stateMessenger =
        await _dao.signInWithEmailAndPassword(user);

    if (stateMessenger.user != null &&
        stateMessenger.errorCode == null &&
        stateMessenger.errorMessage == null) {
      return CustomMessage(
        "Success",
        "Signed in as ${stateMessenger.user!.email}",
      );
    } else if (stateMessenger.errorCode == "user-not-found") {
      return CustomMessage(
        "User not found",
        "We couldn't find an account with the email ${user.email}. Try again with a different email",
      );
    } else if (stateMessenger.errorCode == "invalid-email") {
      return CustomMessage(
        "Provided email is invalid",
        "It looks like the email address you entered is not valid. Try again with a valid email",
      );
    } else if (stateMessenger.errorCode == "invalid-credential") {
      return CustomMessage(
        "Invalid credentials",
        "The email and password you entered don't match. Try again with the correct credentials",
      );
    } else if (stateMessenger.errorCode == "wrong-password") {
      return CustomMessage(
        "Incorrect password",
        "The password you entered is incorrect. Try again with the different password",
      );
    } else if (stateMessenger.errorCode == "user-disabled") {
      return CustomMessage(
        "Account disabled",
        "This account has been disabled. Please contact support for assistance",
      );
    } else if (stateMessenger.errorCode == "network-request-failed") {
      return CustomMessage(
        "Network request failed",
        "Unable to complete the request. Please check your internet connection and try again",
      );
    } else if (stateMessenger.errorCode == "missing-password") {
      return CustomMessage(
        "Password is missing",
        "The password is missing. Try again with a password",
      );
    } else {
      return CustomMessage(
        "Error",
        "Something went wrong. Try try again after some time",
      );
    }
  }

  Future<CustomMessage> signUpWithEmailAndPassword(SignupStateUser user) async {
    AuthenticationStateMessenger stateMessenger =
        await _dao.createUserWithEmailAndPassword(user);

    if (stateMessenger.user != null &&
        stateMessenger.errorCode == null &&
        stateMessenger.errorMessage == null) {
      return CustomMessage(
        "Success",
        "Welcome to MVRS, ${stateMessenger.user!.email}.",
      );
    } else if (stateMessenger.errorCode == "username-not-available") {
      return CustomMessage(
        "Username not available",
        "It looks like the username you’ve chosen is already taken. Please try another username or modify your current choice",
      );
    } else if (stateMessenger.errorCode == "email-already-in-use") {
      return CustomMessage(
        "Account already exists",
        "It looks like an account with this email address already exists. If you already have an account, please sign in instead",
      );
    } else if (stateMessenger.errorCode == "invalid-email") {
      return CustomMessage(
        "Provided email is invalid",
        "It looks like the email address you entered is not valid. Try again with a valid email",
      );
    } else if (stateMessenger.errorCode == "weak-password") {
      return CustomMessage(
        "Weak password",
        "The password you’ve chosen is too weak. For better security, please create a stronger password",
      );
    } else if (stateMessenger.errorCode == "network-request-failed") {
      return CustomMessage(
        "Network request failed",
        "Unable to complete the request. Please check your internet connection and try again",
      );
    } else {
      return CustomMessage(
        "Error",
        "Something went wrong. Try try again after some time",
      );
    }
  }

  CustomMessage signOut(User currentlySignedInUser) {
    AuthenticationStateMessenger stateMessenger =
        _dao.signOut(currentlySignedInUser);

    if (stateMessenger.errorCode == "Success" &&
        stateMessenger.errorMessage == "Signed out") {
      return CustomMessage(
        "Success",
        "Goodbye! You're now signed out",
      );
    } else {
      return CustomMessage(
        "Error",
        "We're not able to sign you out. Please try again after some time",
      );
    }
  }
}
