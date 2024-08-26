import 'package:flutter/material.dart';
import 'package:mvrs/screens/bottom_navigation_screens/user_acknowledgement_screens/user_signin_indication_screen.dart';

class HostVehicleScreen extends StatefulWidget {
  const HostVehicleScreen({super.key});

  @override
  State<HostVehicleScreen> createState() => _HostVehicleScreenState();
}

class _HostVehicleScreenState extends State<HostVehicleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: UserSigninIndicationScreen(
        subTitle: "Sign in to view your trips.",
      ),
    );
  }
}
