import 'package:flutter/material.dart';
import 'package:mvrs/auth/forgot_password_page.dart';
import 'package:mvrs/auth/login_page.dart';
import 'package:mvrs/auth/signup_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "MVRS",
      theme: ThemeData(
        fontFamily: "Montserrat",
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => LoginPage(),
        "/signup": (context) => SignUpPage(),
        "/forget-password": (context) => ForgetPasswordPage(),
      },
    );
  }
}
