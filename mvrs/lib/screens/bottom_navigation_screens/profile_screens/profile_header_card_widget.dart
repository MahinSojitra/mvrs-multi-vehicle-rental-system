import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProfileHeaderCardWidget extends StatefulWidget {
  final String imageUrl;
  final String firstName;
  final String lastName;
  final DateTime joinedDate;

  ProfileHeaderCardWidget({
    Key? key,
    required this.imageUrl,
    required this.firstName,
    required this.lastName,
    required this.joinedDate,
  });

  @override
  State<ProfileHeaderCardWidget> createState() =>
      _ProfileHeaderCardWidgetState();
}

class _ProfileHeaderCardWidgetState extends State<ProfileHeaderCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16.0,
        right: 16.0,
        top: 16.0,
        bottom: 2.0,
      ),
      child: Card(
        color: Colors.green.shade600,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: CircleAvatar(
                  backgroundImage:
                      Image.asset("assets/jpg-images/profile-pic-empty-jpg.jpg")
                          .image,
                  radius: 40, // Adjust the radius to your needs
                ),
              ),
              SizedBox(width: 16), // Space between image and text
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${widget.firstName} ${widget.lastName}",
                    style: TextStyle(
                      fontSize: 19,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Joined us on ${DateFormat('dd MMM yyyy').format(widget.joinedDate)}.",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white70,
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