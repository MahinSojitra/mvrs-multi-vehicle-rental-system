import 'package:flutter/material.dart';
import 'package:mvrs/screens/bottom_navigation_screens/widgets/vehicle_card_grid.dart';

class DiscoverSearchResultScreen extends StatefulWidget {
  final String searchCity;
  final DateTime journeyStartDate;
  final DateTime journeyEndDate;
  final String vehicleType;

  const DiscoverSearchResultScreen({
    super.key,
    required this.searchCity,
    required this.journeyStartDate,
    required this.journeyEndDate,
    required this.vehicleType,
  });

  @override
  State<DiscoverSearchResultScreen> createState() =>
      _DiscoverSearchResultScreenState();
}

class _DiscoverSearchResultScreenState
    extends State<DiscoverSearchResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: Colors.purple,
        ),
        title: Text(
          'Discover Search Result',
          style: TextStyle(
            color: Colors.purple,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: VehicleCardGrid(
            searchCity: widget.searchCity,
            journeyStartDate: widget.journeyStartDate,
            journeyEndDate: widget.journeyEndDate,
            vehicleType: widget.vehicleType,
          ),
        ),
      ),
    );
  }
}
