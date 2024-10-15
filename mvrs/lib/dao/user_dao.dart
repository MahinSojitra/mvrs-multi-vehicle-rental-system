import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:mvrs/entities/document_with_message.dart';

class UserDao {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<DocumentWithMessage> getUserDetails(String uid) async {
    try {
      DocumentSnapshot documentSnapshot =
          await _firestore.collection('users').doc(uid).get();
      return documentSnapshot.exists
          ? Future.value(DocumentWithMessage("Success", documentSnapshot))
          : Future.value(DocumentWithMessage("Not Found", null));
    } catch (e) {
      return Future.value(DocumentWithMessage("Error", null));
    }
  }

  Future<String> uploadProfileImage(
      String uid, Uint8List profileImageBytes) async {
    try {
      Reference reference =
          _storage.ref().child('user-profile-pictures').child('$uid.jpg');
      await reference.putData(profileImageBytes);
      String profileImageUrl = await reference.getDownloadURL();
      return Future.value(profileImageUrl);
    } catch (e) {
      print(e);
      return Future.value("Error");
    }
  }

  Future<DocumentWithMessage> updateUserDetails(
      String uid, Map<String, dynamic> userMap, Uint8List? profileImage) async {
    if (profileImage != null) {
      print("null check in dao");
      String profilePictureUrl = await uploadProfileImage(uid, profileImage);
      print(profilePictureUrl);
      if (profilePictureUrl != "Error") {
        userMap['profilePictureUrl'] = profilePictureUrl;
      } else {
        return Future.value(DocumentWithMessage("Error", null));
      }
    }
    print(userMap);
    userMap["updatedAt"] = DateTime.now();
    try {
      await _firestore.collection('users').doc(uid).update(userMap);
      return Future.value(DocumentWithMessage("Success", null));
    } catch (e) {
      return Future.value(DocumentWithMessage("Error", null));
    }
  }
}
