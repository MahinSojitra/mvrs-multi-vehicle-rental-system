import 'package:flutter/material.dart';
import 'package:mvrs/screens/bottom_navigation_screens/profile_screens/profile_details_card_widget.dart';
import 'package:mvrs/screens/bottom_navigation_screens/profile_screens/profile_header_card_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: Column(
            children: [
              ProfileHeaderCardWidget(
                imageUrl: "https://via.placeholder.com/150",
                firstName: "Mahin",
                lastName: "Sojitra",
                joinedDate: DateTime(2003, 03, 16),
              ),
              ProfileDetailsCardWidget(
                username: "MahinSojitra",
                email: "mahinsojitra16@gmail.com",
                phone: "+91 9104851608",
                dob: DateTime(2003, 03, 16),
                totalRentalTrips: 5,
                totalSpent: 100000,
                address: "123 Main St, Anytown, USA",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
