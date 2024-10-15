class EditStateUser {
  String? profilePictureUrl;
  String firstName;
  String lastName;
  DateTime? dateOfBirth;
  String? phoneNumber;
  String address;

  EditStateUser(this.profilePictureUrl, this.firstName, this.lastName,
      this.dateOfBirth, this.phoneNumber, this.address);

  // Setters
  set setProfilePictureUrl(String? profilePictureUrl) {
    this.profilePictureUrl = profilePictureUrl;
  }

  set setFirstName(String firstName) {
    this.firstName = firstName;
  }

  set setLastName(String lastName) {
    this.lastName = lastName;
  }

  set setDateOfBirth(DateTime? dateOfBirth) {
    this.dateOfBirth = dateOfBirth;
  }

  set setPhoneNumber(String? phoneNumber) {
    this.phoneNumber = phoneNumber;
  }

  set setAddress(String address) {
    this.address = address;
  }

  // Getters
  String? get getProfilePictureUrl => profilePictureUrl;
  String get getFirstName => firstName;
  String get getLastName => lastName;
  DateTime? get getDateOfBirth => dateOfBirth;
  String? get getPhoneNumber => phoneNumber;
  String get getAddress => address;

  Map<String, dynamic> toMap() {
    return {
      'profilePictureUrl': profilePictureUrl,
      'firstName': firstName,
      'lastName': lastName,
      'dateOfBirth': dateOfBirth,
      'phoneNumber': phoneNumber,
      'address': address
    };
  }
}
