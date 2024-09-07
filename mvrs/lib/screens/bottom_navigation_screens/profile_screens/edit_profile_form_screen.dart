import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'dart:io';
import 'package:mvrs/auth-screens/validators/auth_input_validation_mixin.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class EditProfileFormScreen extends StatefulWidget {
  const EditProfileFormScreen({super.key});

  @override
  State<EditProfileFormScreen> createState() => _EditProfileFormScreenState();
}

class _EditProfileFormScreenState extends State<EditProfileFormScreen> {
  final _editProfileFormKey = GlobalKey<FormState>();
  File? _profileImage;
  final _picker = ImagePicker();
  final _textForSetProfilePic =
      "Set your profile picture to enhance your account's visibility and personalize your experience.";
  final _textForUpdateProfilePic =
      "Make sure your profile picture reflects who you are today for a more seamless and personalized experience.";
  // ignore: unused_field
  DateTime? _selectedBirthDate;
  // ignore: unused_field
  String _selectedGender = 'Male';
  PhoneNumber _phoneNumber = PhoneNumber(
    isoCode: 'IN',
    phoneNumber: '',
  );

  bool _isfirstTimeSignin = false;
  bool _isFirstNameValid = true;
  bool _isLastNameValid = true;
  bool _isUsernameValid = true;
  bool _isEmailValid = true;
  bool _isBirthDateProvided = true;
  bool _isPhoneNumberValid = true;

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _birthDateController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: Colors.purple,
        ),
        title: Text(
          'Edit Profile',
          style: TextStyle(
            color: Colors.purple,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18.0),
        child: Form(
          key: _editProfileFormKey,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Profile Picture",
                    style: TextStyle(
                      color: Colors.purple,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              Divider(
                color: Colors.purple,
                thickness: 2,
              ),
              Center(
                child: Container(
                  width: double.infinity,
                  child: Card(
                    color: Colors.green.shade500,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Colors.purple,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    elevation: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              Stack(
                                children: [
                                  CircleAvatar(
                                    radius: 55,
                                    backgroundImage: _profileImage != null
                                        ? FileImage(_profileImage!)
                                        : AssetImage(
                                                'assets/jpg-images/profile-pic-empty-jpg.jpg')
                                            as ImageProvider,
                                    backgroundColor: Colors.grey[200],
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: Tooltip(
                                      message:
                                          "Make your profile pop with a new photo!",
                                      child: Container(
                                        padding: EdgeInsets.all(
                                            0), // Padding around the icon
                                        decoration: BoxDecoration(
                                          color:
                                              Colors.purple, // Background color
                                          shape: BoxShape.circle,
                                        ),
                                        child: SizedBox(
                                          height: 35,
                                          width: 35,
                                          child: IconButton(
                                            iconSize: 20,
                                            icon: Icon(Icons.camera_alt,
                                                color: Colors.white),
                                            onPressed: _pickImage,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(width: 20),
                              Flexible(
                                child: Text(
                                  _isfirstTimeSignin
                                      ? _textForSetProfilePic
                                      : _textForUpdateProfilePic,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                  softWrap: true,
                                  overflow: TextOverflow.visible,
                                  textAlign: TextAlign.start,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Personal Details",
                    style: TextStyle(
                      color: Colors.purple,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              Divider(
                color: Colors.purple,
                thickness: 2,
              ),
              Container(
                padding: EdgeInsets.all(4),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _firstNameController,
                            decoration: InputDecoration(
                              labelText: 'First Name',
                              labelStyle: TextStyle(
                                color: Colors.grey[700],
                                fontWeight: FontWeight.bold,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey[800]!),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.purple),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                              ),
                              suffixIcon: _isFirstNameValid
                                  ? null
                                  : Icon(Icons.error_outline_outlined),
                            ),
                            validator: (firstName) {
                              String? message =
                                  AuthInputValidationMixin.isFirstNameValid(
                                      firstName);
                              if (message == null) {
                                setState(() {
                                  _isFirstNameValid = true;
                                });
                                return null;
                              } else {
                                setState(() {
                                  _isFirstNameValid = false;
                                });
                                return message;
                              }
                            },
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: TextFormField(
                            controller: _lastNameController,
                            decoration: InputDecoration(
                              labelText: 'Last Name',
                              labelStyle: TextStyle(
                                color: Colors.grey[700],
                                fontWeight: FontWeight.bold,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey[800]!),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.purple),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                              ),
                              suffixIcon: _isLastNameValid
                                  ? null
                                  : Icon(Icons.error_outline_outlined),
                            ),
                            validator: (lastName) {
                              String? message =
                                  AuthInputValidationMixin.isLastNameValid(
                                      lastName);
                              if (message == null) {
                                setState(() {
                                  _isLastNameValid = true;
                                });
                                return null;
                              } else {
                                setState(() {
                                  _isLastNameValid = false;
                                });
                                return message;
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                        labelText: 'Username',
                        labelStyle: TextStyle(
                          color: Colors.grey[700],
                          fontWeight: FontWeight.bold,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[800]!),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.purple),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        suffixIcon: _isUsernameValid
                            ? null
                            : Icon(Icons.error_outline_outlined),
                      ),
                      validator: (username) {
                        String? message =
                            AuthInputValidationMixin.isUsernameValid(username);
                        if (message == null) {
                          setState(() {
                            _isUsernameValid = true;
                          });
                          return null;
                        } else {
                          setState(() {
                            _isUsernameValid = false;
                          });
                          return message;
                        }
                      },
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: _birthDateController,
                      readOnly: true,
                      decoration: InputDecoration(
                        labelText: 'Birth Date',
                        labelStyle: TextStyle(
                          color: Colors.grey[700],
                          fontWeight: FontWeight.bold,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[800]!),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.purple),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        suffixIcon: _isBirthDateProvided
                            ? null
                            : Icon(Icons.error_outline_outlined),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          setState(() {
                            _isBirthDateProvided = false;
                          });
                          return 'Please select your date of birth!';
                        }
                        return null;
                      },
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now(),
                        );
                        if (pickedDate != null) {
                          setState(() {
                            _selectedBirthDate = pickedDate;
                            _birthDateController.text =
                                DateFormat('dd-MM-yyyy').format(pickedDate);
                          });
                        }
                      },
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Contact Details",
                          style: TextStyle(
                            color: Colors.purple,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.purple,
                      thickness: 2,
                    ),
                    SizedBox(height: 4),
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(
                          color: Colors.grey[700],
                          fontWeight: FontWeight.bold,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[800]!),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.purple),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        suffixIcon: _isEmailValid
                            ? null
                            : Icon(Icons.error_outline_outlined),
                      ),
                      validator: (email) {
                        String? message =
                            AuthInputValidationMixin.isEmailValid(email);
                        if (message == null) {
                          setState(() {
                            _isEmailValid = true;
                          });
                          return null;
                        } else {
                          setState(() {
                            _isEmailValid = false;
                          });
                          return message;
                        }
                      },
                    ),
                    SizedBox(height: 10),
                    InternationalPhoneNumberInput(
                      onInputChanged: (PhoneNumber number) {
                        _phoneNumber = number;
                      },
                      selectorTextStyle: TextStyle(
                        color: Colors.purple,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                      selectorConfig: SelectorConfig(
                        selectorType: PhoneInputSelectorType.DIALOG,
                        leadingPadding: 10,
                        trailingSpace: false,
                      ),
                      ignoreBlank: false,
                      autoValidateMode: AutovalidateMode.onUserInteraction,
                      textFieldController: _phoneController,
                      formatInput: false,
                      initialValue: _phoneNumber,
                      keyboardType: TextInputType.phone,
                      inputDecoration: InputDecoration(
                        labelText: 'Phone Number',
                        labelStyle: TextStyle(
                          color: Colors.grey[700],
                          fontWeight: FontWeight.bold,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[800]!),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.purple),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        suffixIcon: _isPhoneNumberValid
                            ? null
                            : Icon(Icons.error_outline_outlined),
                      ),
                      validator: (phoneNumber) {
                        String? message =
                            AuthInputValidationMixin.isPhoneNumberValid(
                                PhoneNumber(phoneNumber: phoneNumber));
                        if (message == null) {
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            setState(() {
                              _isPhoneNumberValid = true;
                            });
                          });
                          return null;
                        } else {
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            setState(() {
                              _isPhoneNumberValid = false;
                            });
                          });
                          return message;
                        }
                      },
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Address",
                          style: TextStyle(
                            color: Colors.purple,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.purple,
                      thickness: 2,
                    ),
                    SizedBox(height: 4),
                    TextFormField(
                      controller: _addressController,
                      maxLines: 5,
                      maxLength: 255,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter your address here...',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[800]!),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.purple),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your address.';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  if (_editProfileFormKey.currentState!.validate()) {
                    Navigator.of(context).pop();
                  }
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.green, // Text color
                  padding: EdgeInsets.symmetric(
                      horizontal: 12, vertical: 12), // Padding
                  minimumSize: Size(95, 45), // Minimum size
                ),
                child: Text(
                  'Save',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ), // Text size
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

mixin isValidNumber {}
