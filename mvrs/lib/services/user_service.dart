import 'package:mvrs/dao/user_dao.dart';
import 'package:mvrs/entities/document_with_message.dart';
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
}
