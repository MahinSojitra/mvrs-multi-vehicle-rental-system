import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class VehicleDetailViewScreen extends StatelessWidget {
  final String tripCode;
  final String model;
  final String maker;
  final String year;
  final String color;
  final String imageUrl;
  final DateTime tripStartDate;
  final DateTime tripEndDate;
  final double rentAmount;

  VehicleDetailViewScreen({
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
          'Details',
          style: TextStyle(
            color: Colors.purple,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: BorderSide(color: Colors.purple.shade100, width: 2),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Vehicle Image
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          imageUrl,
                          height: 200,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              Container(
                            height: 200,
                            color: Colors.grey[200],
                            child: Icon(
                              Icons.car_repair,
                              size: 100,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      _buildDetailRow('Trip Code', '#${tripCode}', size: 14),
                      _buildDetailRow('Model', model, isBold: true, size: 18),
                      _buildDetailRow('Maker', maker),
                      _buildDetailRow("Color", color),
                      _buildDetailRow(
                        'Trip Start Date',
                        DateFormat('MMM d, yyyy | hh:mma')
                            .format(tripStartDate),
                      ),
                      _buildDetailRow(
                        'Trip End Date',
                        DateFormat('MMM d, yyyy | hh:mma').format(tripEndDate),
                      ),
                      Divider(
                        thickness: 1,
                        color: Colors.purple.shade500,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          _buildDetailRow(
                            'Rent Amount',
                            currencyFormater.format(rentAmount),
                            isBold: true,
                            size: 20,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value,
      {bool isBold = false, double size = 16}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 3.0, horizontal: 8.0),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              Text(
                value,
                style: TextStyle(
                  fontSize: size,
                  fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
                  color: Colors.purple.shade500,
                  height: 1,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
