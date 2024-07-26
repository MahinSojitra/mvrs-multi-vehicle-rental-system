import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutState();
}

class _AboutState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About"),
        backgroundColor: Colors.grey,
      ),
      body: Text("Welcome to Multi Vehicle Rental System(MVRS).This Appplication is build to solve the problem of people who have to find different vehicles for rent at a single plathform."),
    );
  }
}