import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UserSigninIndicationScreen extends StatelessWidget {
  final String subTitle;

  const UserSigninIndicationScreen({Key? key, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/svg-images/signin-indication-page-svg.svg',
              width: 100,
              height: 100,
            ),
            SizedBox(height: 5),
            Text(
              'Discover your perfect vehicle now!',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            Text(
              subTitle,
              style: TextStyle(
                fontSize: 14,
                color: Colors.green.shade500,
              ),
            ),
            SizedBox(height: 10), // Space between text and button
            TextButton(
              onPressed: () {
                // Action to be performed
                Navigator.pushReplacementNamed(context, "/signin");
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.green, // Text color
                padding: EdgeInsets.symmetric(
                    horizontal: 12, vertical: 12), // Padding
                minimumSize: Size(95, 45), // Minimum size
              ),
              child: Text(
                'Sign in',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ), // Text size
              ),
            ),
          ],
        ),
      ),
    );
  }
}
