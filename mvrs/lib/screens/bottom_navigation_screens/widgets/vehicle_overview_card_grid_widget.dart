import 'package:flutter/material.dart';
import 'package:mvrs/screens/bottom_navigation_screens/widgets/vehicle_overview_card_widget.dart';

class VehicleOverviewCardGridWidget extends StatefulWidget {
  const VehicleOverviewCardGridWidget({super.key});

  @override
  State<VehicleOverviewCardGridWidget> createState() =>
      _VehicleOverviewCardGridWidgetState();
}

class _VehicleOverviewCardGridWidgetState
    extends State<VehicleOverviewCardGridWidget> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Two cards per row
        crossAxisSpacing: 10, // Horizontal space between cards
        mainAxisSpacing: 10, // Vertical space between cards
        childAspectRatio: 0.75, // Aspect ratio of the card
      ),
      itemCount: 10, // Total number of cards
      itemBuilder: (context, index) {
        return VehicleOverviewCardWidget(
          imageUrl:
              'https://example.com/vehicle${index + 1}.jpg', // Replace with your image URLs
          vehicleName: 'Vehicle ${index + 1}',
          pricePerHour: '\$${(index + 1) * 10}', // Example pricing
        );
      },
    );
  }
}
