import 'package:flutter/material.dart';

class VehicleCard extends StatelessWidget {
  final String carImageUrl;
  final String carName;
  final double rentAmount;
  final VoidCallback onBookPressed;

  VehicleCard({
    required this.carImageUrl,
    required this.carName,
    required this.rentAmount,
    required this.onBookPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.green, width: 1.5),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                child: Image.network(
                  carImageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 8),
            // Car Details
            Text(
              carName,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4),
            Text(
              'Rent: \Rs. ${rentAmount.toStringAsFixed(2)} / day',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 8),
            Align(
              alignment: Alignment.bottomRight,
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  backgroundColor: Colors.green, // Text color
                  padding: EdgeInsets.symmetric(
                      horizontal: 10, vertical: 10), // Padding
                  minimumSize: Size(95, 45), // Minimum size
                ),
                child: Text(
                  'Rent',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ), // Text size
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
