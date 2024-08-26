import 'package:flutter/material.dart';
import 'package:mvrs/auth-screens/forgot_password_screen.dart';
import 'package:mvrs/auth-screens/forgot_password_verification_screen.dart';
import 'package:mvrs/auth-screens/host/host_signup_screen.dart';
import 'package:mvrs/auth-screens/login_screen.dart';
import 'package:mvrs/auth-screens/reset_password_screen.dart';
import 'package:mvrs/auth-screens/user/user_signup_screen.dart';
import 'package:mvrs/screens/dashboard_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "MVRS",
      scaffoldMessengerKey: _scaffoldMessengerKey,
      theme: ThemeData(
        fontFamily: "Montserrat",
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => LoginScreen(),
        "/user-signup": (context) => UserSignUpScreen(),
        "/host-signup": (context) => HostSignUpScreen(),
        "/forget-password": (context) => ForgetPasswordScreen(),
        "/forget-password-verification": (context) =>
            ForgotPasswordVerificationScreen(),
        "/reset-password": (context) => ResetPasswordScreen(),
        "/dashboard": (context) => DashboardScreen(),
      },
    );
  }
}
