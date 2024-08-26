import 'package:flutter/material.dart';
import 'package:mvrs/screens/bottom_navigation_screens/widgets/custom_banner_widget.dart';
import 'package:mvrs/screens/bottom_navigation_screens/widgets/search_vehicle_widget.dart';
import 'package:mvrs/screens/bottom_navigation_screens/widgets/vehicle_overview_card_scroll_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SearchVehicleWidget(),
          CustomBannerWidget(
            title: "Discover the Hottest Rental Vehicles!",
          ),
          Expanded(
            child: VehicleOverviewCardScrollWidget(),
          ),
        ],
      ),
    );
  }
}
