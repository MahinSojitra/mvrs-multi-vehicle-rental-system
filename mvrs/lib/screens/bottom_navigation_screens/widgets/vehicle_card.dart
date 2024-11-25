import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class VehicleCard extends StatelessWidget {
  final String tripCode;
  final String carImageUrl;
  final String carModel;
  final double rentAmount;
  final VoidCallback onBookPressed;

  VehicleCard({
    required this.tripCode,
    required this.carImageUrl,
    required this.carModel,
    required this.rentAmount,
    required this.onBookPressed,
  });

  @override
  Widget build(BuildContext context) {
    final NumberFormat currencyFormater = NumberFormat.currency(
      locale: 'en_IN', // Indian locale
      symbol: '₹', // Indian Rupee symbol
    );

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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Trip Code",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  "#${tripCode}",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.purple.shade500,
                    height: 1,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Model",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  carModel,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple,
                    height: 1,
                  ),
                ),
              ],
            ),
            SizedBox(height: 4),
            Divider(
              color: Colors.purple,
              thickness: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Payable\nAmount",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                        height: 1, // Adjust line spacing
                      ),
                    ),
                    const SizedBox(width: 2), // Space between text and icon
                    Tooltip(
                      richMessage: WidgetSpan(
                        child: Container(
                          width: 200,
                          height: 50,
                          child: Text(
                            "This amount is an estimate and may vary due to changes in demand or unforeseen delays.",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        Icons.info_outline,
                        size: 18,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
                Text(
                  '${currencyFormater.format(rentAmount)}',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    height: 1,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.bottomRight,
              child: TextButton(
                onPressed: onBookPressed,
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
