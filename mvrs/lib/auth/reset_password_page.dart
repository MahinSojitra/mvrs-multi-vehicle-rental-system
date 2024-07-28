import 'package:flutter/material.dart';
import 'package:mvrs/auth/validators/auth_input_validation_mixin.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage>
    with AuthInputValidationMixin {
  final _resetPasswordFormGlobalKey = GlobalKey<FormState>();
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
                    Center(
                      child: const Text(
                        'Reset Password',
                        style: TextStyle(
                          fontSize: 50,
                          fontFamily: "Cookie",
                          fontWeight: FontWeight
                              .bold, // Optional: for better readability
                        ),
                      ),
                    ),
                    Center(
                      child: const Text(
                        "Create your new password below to complete your password reset.",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Form(
                      key: _resetPasswordFormGlobalKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 10),
                          TextFormField(
                            controller: _passwordController,
                            obscureText: _passwordVisiblityHide,
                            decoration: InputDecoration(
                              labelText: 'New Passsword',
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
                              labelText: 'Confirm New Password',
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
                              if (_resetPasswordFormGlobalKey.currentState!
                                  .validate()) {
                                Navigator.pushReplacementNamed(context, "/");
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
                                  horizontal: 50, vertical: 15),
                              textStyle: TextStyle(fontSize: 18),
                            ),
                            child: Text('Reset Password'),
                          ),
                          SizedBox(height: 20),
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
