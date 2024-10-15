import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mvrs/entities/user.dart';
import 'package:mvrs/screens/bottom_navigation_screens/profile_screens/edit_profile_form_screen.dart';

class ProfileDetailsCardWidget extends StatefulWidget {
  final User user;
  final String firstName;
  final String? lastName;
  final String username;
  final String email;
  final String? phone;
  final DateTime? dob;
  final int totalRentalTrips;
  final double totalSpent;
  final String? address;

  // Format amount with Indian Rupee symbol
  final NumberFormat currencyFormater = NumberFormat.currency(
    locale: 'en_IN', // Indian locale
    symbol: '₹', // Indian Rupee symbol
  );

  ProfileDetailsCardWidget({
    super.key,
    required this.user,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.phone,
    required this.dob,
    required this.totalRentalTrips,
    required this.totalSpent,
    required this.address,
  });

  @override
  State<ProfileDetailsCardWidget> createState() =>
      _ProfileDetailsCardWidgetState();
}

class _ProfileDetailsCardWidgetState extends State<ProfileDetailsCardWidget> {
  Widget _buildInfoRow(String label, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          value == null
              ? Tooltip(
                  message: 'Not available',
                  preferBelow: true,
                  verticalOffset: 12,
                  child: Icon(
                    Icons.info_outline,
                    color: Colors.green,
                    size: 20,
                  ),
                )
              : Text(value),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16.0,
        right: 16.0,
        top: 2.0,
        bottom: 16.0,
      ),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: Colors.blue, width: 2),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Prosonal Information',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Divider(
                color: Colors.blue.shade300,
                thickness: 4,
              ),
              SizedBox(height: 10),
              _buildInfoRow('First Name', widget.firstName),
              Divider(
                color: Colors.green,
                thickness: 0.5,
              ),
              _buildInfoRow('Last Name', widget.lastName),
              Divider(
                color: Colors.green,
                thickness: 0.5,
              ),
              _buildInfoRow('Username', widget.username),
              Divider(
                color: Colors.green,
                thickness: 0.5,
              ),
              _buildInfoRow('Email', widget.email),
              Divider(
                color: Colors.green,
                thickness: 0.5,
              ),
              _buildInfoRow('Phone', widget.phone),
              Divider(
                color: Colors.green,
                thickness: 0.5,
              ),
              _buildInfoRow(
                'Date of Birth',
                widget.dob == null
                    ? null
                    : DateFormat('dd MMM, yyyy').format(widget.dob!).toString(),
              ),
              Divider(
                color: Colors.green,
                thickness: 0.5,
              ),
              _buildInfoRow(
                  'Total Rental Trips', widget.totalRentalTrips.toString()),
              Divider(
                color: Colors.green,
                thickness: 0.5,
              ),
              _buildInfoRow('Total Spent',
                  '${widget.currencyFormater.format(widget.totalSpent)}'),
              Divider(
                color: Colors.green,
                thickness: 0.5,
              ),
              _buildInfoRow('Address:', widget.address),
              SizedBox(height: 10),
              Divider(
                color: Colors.blue.shade300,
                thickness: 4,
              ),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditProfileFormScreen(
                            user: widget.user,
                          ),
                        ),
                      );
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.green, // Text color
                      padding: EdgeInsets.symmetric(
                          horizontal: 12, vertical: 12), // Padding
                      minimumSize: Size(95, 45), // Minimum size
                    ),
                    child: Text(
                      'Edit',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ), // Text size
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
