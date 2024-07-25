import 'package:flutter/material.dart';
import 'auth/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "MVRS",
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
