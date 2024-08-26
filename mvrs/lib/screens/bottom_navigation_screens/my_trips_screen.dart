import 'package:flutter/material.dart';
import 'package:mvrs/screens/bottom_navigation_screens/widgets/my_trip_card_widget.dart';

class MyTripsScreen extends StatefulWidget {
  const MyTripsScreen({super.key});

  @override
  State<MyTripsScreen> createState() => _MyTripsScreenState();
}

class _MyTripsScreenState extends State<MyTripsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
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
      ),
    );
  }
}
