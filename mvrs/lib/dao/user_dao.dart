import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mvrs/entities/document_with_message.dart';

class UserDao {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

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
}
