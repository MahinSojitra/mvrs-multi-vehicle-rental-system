/*
  Class: User
    - This class represents a whole user. It is used to handle user's data.
    - The user's first name, last name, username, email, date of birth, phone number, 
      profile picture, total number of rentals, total amount of money spent on rentals, 
      and address are used representing the user's all details.
    - It has an additional getter of geting the age of the user form the date of birth.
*/

import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String _firstName;
  String? _lastName;
  String _username;
  String _email;
  DateTime? _dateOfBirth;
  String? _phoneNumber;
  Uri? _profilePictureUrl;
  int _totalRentals;
  double _totalSpent;
  String? _address;
  DateTime _createdAt;
  DateTime _updatedAt;

  User(
    this._firstName,
    this._lastName,
    this._username,
    this._email,
    this._dateOfBirth,
    this._phoneNumber,
    this._profilePictureUrl,
    this._totalRentals,
    this._totalSpent,
    this._address,
    this._createdAt,
    this._updatedAt,
  );

  /// Setters
  set firstName(String firstName) => _firstName = firstName;
  set lastName(String? lastName) => _lastName = lastName;
  set username(String username) => _username = username;
  set email(String email) => _email = email;
  set dateOfBirth(DateTime? dateOfBirth) => _dateOfBirth = dateOfBirth;
  set phoneNumber(String? phoneNumber) => _phoneNumber = phoneNumber;
  set profilePictureUrl(Uri? profilePictureUrl) =>
      _profilePictureUrl = profilePictureUrl;
  set totalRentals(int totalRentals) => _totalRentals = totalRentals;
  set totalSpent(double totalSpent) => _totalSpent = totalSpent;
  set address(String? address) => _address = address;
  set createdAt(DateTime createdAt) => _createdAt = createdAt;
  set updatedAt(DateTime updatedAt) => _updatedAt = updatedAt;

  /// Getters
  String get firstName => _firstName;
  String? get lastName => _lastName;
  String get username => _username;
  String get email => _email;
  DateTime? get dateOfBirth => _dateOfBirth;
  String? get phoneNumber => _phoneNumber;
  Uri? get profilePictureUrl => _profilePictureUrl;
  int get totalRentals => _totalRentals;
  double get totalSpent => _totalSpent;
  String? get address => _address;
  DateTime get createdAt => _createdAt;
  DateTime get updatedAt => _updatedAt;

  static User fromDocument(DocumentSnapshot? userData) {
    return User(
      userData?['firstName'],
      userData?['lastName'],
      userData?['username'],
      userData?['email'],
      userData?['dateOfBirth']?.toDate(),
      userData?['phoneNumber'],
      userData?['profilePictureUrl'],
      userData?['totalRentals'],
      userData?['totalSpent'],
      userData?['address'],
      userData?['createdAt'].toDate(),
      userData?['updatedAt'].toDate(),
    );
  }
}
