import 'package:cloud_firestore/cloud_firestore.dart';

class DocumentWithMessage {
  final String _message;
  final DocumentSnapshot? _document;

  DocumentWithMessage(this._message, this._document);

  String get message => _message;
  DocumentSnapshot? get document => _document;
}
