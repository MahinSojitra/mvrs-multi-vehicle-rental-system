import 'package:flutter/material.dart';

class VehicleOverviewCardWidget extends StatefulWidget {
  final String imageUrl;
  final String vehicleName;
  final String pricePerHour;

  const VehicleOverviewCardWidget({
    super.key,
    required this.imageUrl,
    required this.vehicleName,
    required this.pricePerHour,
  });

  @override
  State<VehicleOverviewCardWidget> createState() =>
      _VehicleOverviewCardWidgetState();
}

class _VehicleOverviewCardWidgetState extends State<VehicleOverviewCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
              child: Image.network(
                widget.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.vehicleName,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(
                  widget.pricePerHour,
                  style: TextStyle(fontSize: 14, color: Colors.green),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
