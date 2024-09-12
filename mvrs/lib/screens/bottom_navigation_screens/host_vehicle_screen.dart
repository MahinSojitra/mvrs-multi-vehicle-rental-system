import 'package:flutter/material.dart';
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
      body: Placeholder(),
    );
  }
}
