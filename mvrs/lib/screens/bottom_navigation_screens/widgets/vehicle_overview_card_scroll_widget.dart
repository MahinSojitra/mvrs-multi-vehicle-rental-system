import 'package:flutter/material.dart';
import 'package:mvrs/screens/bottom_navigation_screens/widgets/vehicle_overview_card_widget.dart';

class VehicleOverviewCardScrollWidget extends StatefulWidget {
  const VehicleOverviewCardScrollWidget({super.key});

  @override
  State<VehicleOverviewCardScrollWidget> createState() =>
      _VehicleOverviewCardScrollWidgetState();
}

class _VehicleOverviewCardScrollWidgetState
    extends State<VehicleOverviewCardScrollWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal, // Scroll horizontally
      padding: EdgeInsets.all(10),
      child: Row(
        children: List.generate(5, (index) {
          return Container(
            width: 200, // Fixed width for each card
            margin: EdgeInsets.only(right: 10), // Space between cards
            child: VehicleOverviewCardWidget(
              imageUrl: 'https://example.com/vehicle${index + 1}.jpg',
              vehicleName: 'Vehicle ${index + 1}',
              pricePerHour: '\$${(index + 1) * 10}',
            ),
          );
        }),
      ),
    );
  }
}
