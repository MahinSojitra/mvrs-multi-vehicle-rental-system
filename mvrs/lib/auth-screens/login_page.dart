import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mvrs/auth-screens/validators/auth_input_validation_mixin.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with AuthInputValidationMixin {
  final _signInFormGlobalKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _passwordVisiblityHide = true;
  bool _isEmailValid = true;
  bool _isPasswordValid = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    // Placeholder for the image
                    Container(
                      height: 200,
                      child: SvgPicture.asset(
                        'assets/svg-images/login-page-car-banner.svg',
                      ),
                    ),
                    Text(
                      'Welcome back!',
                      style: TextStyle(
                        fontSize: 45,
                        fontFamily: "Cookie",
                      ),
                    ),
                    Text(
                      'Travel and live the new experience of rent the vehicle from your home',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 20),
                    Form(
                      key: _signInFormGlobalKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
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
                              labelText: 'Password',
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
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              style: TextButton.styleFrom(),
                              onPressed: () {
                                // Handle forgot password
                                Navigator.pushNamed(
                                    context, "/forget-password");
                              },
                              child: Text('Forgot your password?'),
                            ),
                          ),
                          SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              // Handle sign in
                              _signInFormGlobalKey.currentState!.validate();
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
                            child: Text('Sign in'),
                          ),
                          SizedBox(height: 20),
                          TextButton(
                            onPressed: () {
                              // Handle sign up
                              Navigator.pushReplacementNamed(
                                  context, "/user-signup");
                            },
                            child: Text("Don't have an account? Sign up here"),
                          ),
                          TextButton(
                            onPressed: () {
                              // Handle sign up
                              Navigator.pushReplacementNamed(
                                  context, "/host-signup");
                            },
                            child: Text("Want host your vehicle? Sign up here"),
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
