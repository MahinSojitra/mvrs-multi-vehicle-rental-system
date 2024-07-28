import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mvrs/auth/validators/auth_input_validation_mixin.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage>
    with AuthInputValidationMixin {
  final _forgotPasswordFormGlobalKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  bool _isEmailValid = true;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 7,
        backgroundColor: Colors.transparent,
        title: const Text("Forget your password"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 0,
          left: 16.0,
          right: 16.0,
          bottom: 16.0,
        ),
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
              padding: const EdgeInsets.only(
                top: 0,
                left: 30.0,
                right: 30.0,
                bottom: 30.0,
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    // Placeholder for the image
                    Container(
                      child: SvgPicture.asset(
                        'assets/svg-images/forget-password-banner.svg',
                        width: 800,
                        height: 300,
                      ),
                    ),
                    Text(
                      "Password Recovery",
                      style: TextStyle(
                        fontSize: 45,
                        fontFamily: "Cookie",
                      ),
                    ),
                    Text(
                      "Drop your email here, and we’ll send you a magic code to reset your password!",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 20),
                    Form(
                      key: _forgotPasswordFormGlobalKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          TextFormField(
                            controller: _emailController,
                            maxLength: 255,
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
                          SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              // Handle sign in
                              if (_forgotPasswordFormGlobalKey.currentState!
                                  .validate()) {
                                Navigator.pushNamed(
                                    context, "/forget-password-verification");
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
                                  horizontal: 60, vertical: 15),
                              textStyle: TextStyle(fontSize: 18),
                            ),
                            child: Text('Send Code'),
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
