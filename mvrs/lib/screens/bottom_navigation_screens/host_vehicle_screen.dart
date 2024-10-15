import 'package:flutter/material.dart';
import 'package:mvrs/screens/bottom_navigation_screens/user_acknowledgement_screens/user_signin_indication_screen.dart';
import 'package:mvrs/services/user_authentication_service.dart';

class HostVehicleScreen extends StatefulWidget {
  const HostVehicleScreen({super.key});

  @override
  State<HostVehicleScreen> createState() => _HostVehicleScreenState();
}

class _HostVehicleScreenState extends State<HostVehicleScreen> {
  late bool _isSignedIn;
  late UserAuthenticationService _userAuthenticationService;

  @override
  void initState() {
    _userAuthenticationService = UserAuthenticationService();
    _isSignedIn =
        _userAuthenticationService.getCurrentUser() != null ? true : false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: UserSigninIndicationScreen(
        title: "Be a Host",
        subTitle: "Sign in to host your vehicle",
      ),
    );
  }
}
