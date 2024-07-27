// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:mvrs/auth/login_page.dart';
// import 'package:mvrs/info/about.dart'; // Ensure this path is correct

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

enum Gender { Male, Female }

class _SignUpPageState extends State<SignUpPage> {
  Gender? _character = Gender.Male;
  final TextEditingController emailid = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController recheckpassword = TextEditingController();
  bool passwordvisibility = true;

  void dispose() {
    emailid.dispose();
    password.dispose();
    recheckpassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 7,
        title: Text("Sign Up"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 10),
            Center(
              child: const Text(
                'Welcome',
                style: TextStyle(
                  fontSize: 45,
                  fontFamily: "Cookie",
                  fontWeight:
                      FontWeight.bold, // Optional: for better readability
                ),
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: const Text(
                "Discover the city or explore beyond. Create your rental account now.",
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 30),
            TextField(
                decoration: InputDecoration(
              label: Text("First Name"),
              hintText: "First Name",
              // labelText: "Enter your first name",
              border: OutlineInputBorder(),
            )),
            SizedBox(
              height: 10,
            ),
            TextField(
                decoration: InputDecoration(
              label: Text("Last Name"),
              hintText: "Last Name",
              // labelText: "Enter your last name",
              border: OutlineInputBorder(),
            )),
            SizedBox(height: 10),
            TextField(
                decoration: InputDecoration(
              label: Text("Username"),
              hintText: "Username",
              // labelText: "Enter your username",
              border: OutlineInputBorder(),
            )),
            ListTile(
              contentPadding: EdgeInsets.all(2.0),
              title: Text("Male"),
              leading: Radio(
                  value: Gender.Male,
                  groupValue: _character,
                  onChanged: (Gender? value) {
                    setState(() {
                      _character = value;
                    });
                  }),
            ),
            ListTile(
              contentPadding: EdgeInsets.all(2.0),
              title: Text("Female"),
              leading: Radio(
                  value: Gender.Female,
                  groupValue: _character,
                  onChanged: (Gender? value) {
                    setState(() {
                      _character = value;
                    });
                  }),
            ),
            SizedBox(height: 10),
            TextField(
                controller: emailid,
                decoration: InputDecoration(
                  label: Text("Email"),
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  hintText: "Enter your Email id",
                  // labelText: "Enter your email",
                  border: OutlineInputBorder(),
                )),
            SizedBox(height: 10),
            TextField(
                controller: password,
                obscureText: passwordvisibility,
                decoration: InputDecoration(
                  label: Text("Password"),
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  hintText: "Enter your password",
                  // labelText: "Enter your password",
                  border: OutlineInputBorder(),
                )),
            SizedBox(height: 10),
            TextField(
                controller: recheckpassword,
                obscureText: passwordvisibility,
                decoration: InputDecoration(
                  label: Text("Recheck Password"),
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  hintText: "Enter password again",
                  // labelText: "Enter password again",
                  border: OutlineInputBorder(),
                )),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
              child: const Text("Sign up"),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                backgroundColor:
                    Color.fromARGB(255, 204, 116, 22), // Adjust color as needed
                textStyle: const TextStyle(fontSize: 16),
              ),
            )
          ],
        ),
      ),
    );
  }
}
