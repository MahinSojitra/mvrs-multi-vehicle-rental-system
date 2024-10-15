import 'package:flutter/material.dart';

class VehicleOverviewCardWidget extends StatefulWidget {
  final String imageUrl;

  const VehicleOverviewCardWidget({
    super.key,
    required this.imageUrl,
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
        side: BorderSide(color: Colors.green, width: 2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(5.0),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: Image.network(
                  widget.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          // Padding(
          //   padding: EdgeInsets.all(8.0),
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       Text(
          //         widget.vehicleName,
          //         style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          //       ),
          //       SizedBox(height: 4),
          //       Text(
          //         widget.pricePerHour,
          //         style: TextStyle(fontSize: 14, color: Colors.green),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
