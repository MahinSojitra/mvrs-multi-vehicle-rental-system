import 'dart:typed_data';

import 'package:mvrs/dao/user_dao.dart';
import 'package:mvrs/entities/custom_message.dart';
import 'package:mvrs/entities/document_with_message.dart';
import 'package:mvrs/entities/edit_state_user.dart';
import 'package:mvrs/entities/user.dart';
import 'package:mvrs/entities/user_with_message.dart';

class UserService {
  final UserDao _userDao = UserDao();

  Future<UserWithMessage> getCurrentUserDetails(String uid) async {
    DocumentWithMessage documentWithMessage =
        await _userDao.getUserDetails(uid);
    if (documentWithMessage.message == "Not Found") {
      return UserWithMessage("User's data not found", null);
    } else if (documentWithMessage.message == "Error") {
      return UserWithMessage(
          "Something went wrong, please try again after some time", null);
    } else {
      return UserWithMessage(
        "Success",
        User.fromDocument(
          documentWithMessage.document,
        ),
      );
    }
  }

  Future<CustomMessage> updateUserDetails(String uid,
      EditStateUser editStateUser, User user, Uint8List? profileImage) async {
    if (user.profilePictureUrl != null) {
      print("null check in service");
      editStateUser.profilePictureUrl = user.profilePictureUrl;
    }
    user.firstName = editStateUser.firstName;
    user.lastName = editStateUser.lastName;
    user.dateOfBirth = editStateUser.dateOfBirth;
    user.phoneNumber = editStateUser.phoneNumber;
    user.address = editStateUser.address;

    DocumentWithMessage documentWithMessage = await _userDao.updateUserDetails(
      uid,
      User.toMap(user),
      profileImage,
    );
    if (documentWithMessage.message == "Error") {
      return CustomMessage("Error", "Something went wrong, please try again");
    } else {
      return CustomMessage("Success", "Profile updated successfully");
    }
  }
}
