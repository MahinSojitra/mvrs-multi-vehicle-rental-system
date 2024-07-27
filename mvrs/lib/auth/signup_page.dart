// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:mvrs/auth/validators/auth_input_validation_mixin.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> with AuthInputValidationMixin {
  final _signUpFormGlobalKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _passwordVisiblityHide = true;
  bool _isFirstNameValid = true;
  bool _isUsernameValid = true;
  bool _isEmailValid = true;
  // ignore: unused_field
  bool _isPasswordValid = true;
  bool _isConfirmPasswordValid = true;

  @override
  void dispose() {
    _firstNameController.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Card(
            elevation: 7,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
              side: BorderSide(
                color: Colors.purple,
                width: 3.0,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 10),
                    Center(
                      child: const Text(
                        'Welcome',
                        style: TextStyle(
                          fontSize: 50,
                          fontFamily: "Cookie",
                          fontWeight: FontWeight
                              .bold, // Optional: for better readability
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: const Text(
                        "Discover the city or explore beyond.\nCreate your rental account now.",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Form(
                      key: _signUpFormGlobalKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextFormField(
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
                              suffixIcon: _isUsernameValid
                                  ? null
                                  : Icon(Icons.error_outline_outlined),
                            ),
                            validator: (username) {
                              String? message =
                                  AuthInputValidationMixin.isUsernameValid(
                                      username);
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
                            controller: _emailController,
                            decoration: InputDecoration(
                              labelText: 'Email',
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
                          TextFormField(
                            controller: _passwordController,
                            obscureText: _passwordVisiblityHide,
                            decoration: InputDecoration(
                              labelText: 'Passsword',
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
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _passwordVisiblityHide
                                      ? Icons.visibility_off_outlined
                                      : Icons.visibility_outlined,
                                  color: _passwordVisiblityHide
                                      ? Colors.grey[650]
                                      : Colors.blue,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _passwordVisiblityHide =
                                        !_passwordVisiblityHide;
                                  });
                                },
                              ),
                            ),
                            validator: (password) {
                              String? message =
                                  AuthInputValidationMixin.isPasswordValid(
                                      password);
                              if (message == null) {
                                setState(() {
                                  _isPasswordValid = true;
                                });
                                return null;
                              } else {
                                setState(() {
                                  _isPasswordValid = false;
                                });
                                return message;
                              }
                            },
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            controller: _confirmPasswordController,
                            obscureText: _passwordVisiblityHide,
                            decoration: InputDecoration(
                              labelText: 'Confirm Password',
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
                              suffixIcon: _isConfirmPasswordValid
                                  ? null
                                  : Icon(Icons.error_outline_outlined),
                            ),
                            validator: (confirmPassword) {
                              String? message = AuthInputValidationMixin
                                  .isConfirmPasswordValid(confirmPassword,
                                      _passwordController.text);
                              if (message == null) {
                                setState(() {
                                  _isConfirmPasswordValid = true;
                                });
                                return null;
                              } else {
                                setState(() {
                                  _isConfirmPasswordValid = false;
                                });
                                return message;
                              }
                            },
                          ),
                          SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              // Handle sign in
                              if (_signUpFormGlobalKey.currentState!
                                  .validate()) {
                                // If the form is valid, display a snackbar. If there are any
                                // errors, return them
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              foregroundColor: Colors.white,
                              shadowColor: Colors.blue,
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    color: Colors.blueAccent, width: 2),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 100, vertical: 15),
                              textStyle: TextStyle(fontSize: 18),
                            ),
                            child: Text('Sign up'),
                          ),
                          SizedBox(height: 20),
                          TextButton(
                            onPressed: () {
                              // Handle sign up
                              Navigator.pushReplacementNamed(context, "/");
                            },
                            child: Text("Already joined? Access your account!"),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
