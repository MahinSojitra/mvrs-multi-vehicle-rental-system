import 'package:flutter/material.dart';
import 'package:mvrs/screens/bottom_navigation_screens/user_acknowledgement_screens/user_signin_indication_screen.dart';
import 'package:mvrs/screens/bottom_navigation_screens/widgets/my_trip_card_widget.dart';
import 'package:mvrs/services/user_authentication_service.dart';

class MyTripsScreen extends StatefulWidget {
  const MyTripsScreen({super.key});

  @override
  State<MyTripsScreen> createState() => _MyTripsScreenState();
}

class _MyTripsScreenState extends State<MyTripsScreen> {
  late bool _isSignedIn;
  late UserAuthenticationService _userAuthenticationService;

  @override
  void initState() {
    _userAuthenticationService = UserAuthenticationService();
    _isSignedIn =
        _userAuthenticationService.getCurrentUser() != null ? true : false;
    super.initState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isSignedIn
          ? ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return MyTripCardWidget(
                  tripNumber: index + 1,
                  tripCode: "TRIPMAJJK${index + 100}",
                  startDate: DateTime.now(),
                  endDate: DateTime.now().add(Duration(days: 3)),
                  vehicleModel: "Mercedes-Benz C-Class",
                  totalFare: (150 * (index + 1)).toDouble(),
                );
              },
            )
          : UserSigninIndicationScreen(
              title: "Review Your Trips!",
              subTitle: "Sign in to view and manage your all the trips",
            ),
    );
  }
}
