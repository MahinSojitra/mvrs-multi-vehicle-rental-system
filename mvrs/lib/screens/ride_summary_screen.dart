import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mvrs/screens/vehicle_detail_view_screen.dart';

class RideSummaryScreen extends StatelessWidget {
  final String tripCode;
  final String model;
  final String maker;
  final String year;
  final String color;
  final String imageUrl;
  final DateTime tripStartDate;
  final DateTime tripEndDate;
  final double rentAmount;

  RideSummaryScreen({
    Key? key,
    required this.model,
    required this.maker,
    required this.year,
    required this.color,
    required this.imageUrl,
    required this.tripCode,
    required this.tripStartDate,
    required this.tripEndDate,
    required this.rentAmount,
  }) : super(key: key);

  final NumberFormat currencyFormater = NumberFormat.currency(
    locale: 'en_IN', // Indian locale
    symbol: '₹', // Indian Rupee symbol
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: Colors.purple,
        ),
        title: Text(
          'Ride Summary',
          style: TextStyle(
            color: Colors.purple,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Booking Details',
              style: TextStyle(
                fontSize: 22,
                color: Colors.purple,
                fontWeight: FontWeight.bold,
              ),
            ),
            Divider(
              thickness: 2,
              color: Colors.purple.shade500,
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
              elevation: 2,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.lightBlue.shade200, width: 2),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                              fontSize: 16,
                              color: Colors.purple.shade500,
                              height: 1,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 2),
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
                            model,
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.purple,
                              height: 1,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 3),
                      Text(
                        "Trip Starts at ${DateFormat('hh:mma on MMM d, yyyy').format(tripStartDate)} and ended at ${DateFormat('hh:mma on MMM d, yyyy').format(tripEndDate)}",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                      Divider(
                        color: Colors.purple,
                        thickness: 1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              TextButton(
                                onPressed: () {
                                  // Handle "More Details" button press
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          VehicleDetailViewScreen(
                                        model: model,
                                        maker: maker,
                                        year: year,
                                        color: color,
                                        imageUrl: imageUrl,
                                        tripCode: tripCode,
                                        tripStartDate: tripStartDate,
                                        tripEndDate: tripEndDate,
                                        rentAmount: rentAmount,
                                      ),
                                    ),
                                  );
                                },
                                style: TextButton.styleFrom(
                                  backgroundColor: Colors.green, // Text color
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 4), // Padding
                                  minimumSize: Size(80, 30), // Minimum size
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      'More Details',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                      ), // Text size
                                    ),
                                    const SizedBox(width: 2),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.white,
                                      size: 12,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Text(
                            '${currencyFormater.format(rentAmount)}',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.purple,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Divider(
              color: Colors.blue.shade500,
              thickness: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total Amount',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.purple,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${currencyFormater.format(rentAmount)}',
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.purple,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(vertical: 14.0),
              ),
              child: const Center(
                child: Text(
                  'Complete Booking',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.center,
              child: TextButton.icon(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, "/");
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.transparent,
                  ),
                ),
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.purple,
                ),
                label: const Text(
                  'Return to Home',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.purple,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
