import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyTripCardWidget extends StatefulWidget {
  final int tripNumber;
  final String tripCode;
  final DateTime startDate;
  final DateTime endDate;
  final String vehicleModel;
  final double totalFare;

  // Format amount with Indian Rupee symbol
  final NumberFormat currencyFormater = NumberFormat.currency(
    locale: 'en_IN', // Indian locale
    symbol: '₹', // Indian Rupee symbol
  );

  MyTripCardWidget({
    super.key,
    required this.tripNumber,
    required this.tripCode,
    required this.startDate,
    required this.endDate,
    required this.vehicleModel,
    required this.totalFare,
  });

  @override
  State<MyTripCardWidget> createState() => _MyTripCardWidgetState();
}

class _MyTripCardWidgetState extends State<MyTripCardWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      hoverColor: Colors.purple.shade500,
      child: Card(
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "#${widget.tripNumber}.",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple,
                      ),
                    ),
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
                          "#${widget.tripCode}",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.purple.shade500,
                            height: 1,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 3),
                Text(
                  "${DateFormat("MMM d, ha").format(widget.startDate)} to ${DateFormat("MMM d, ha").format(widget.endDate)}",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.purple.withOpacity(0.8),
                  ),
                ),
                Text(
                  "${widget.vehicleModel}",
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
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.green, // Text color
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4), // Padding
                            minimumSize: Size(80, 30), // Minimum size
                          ),
                          child: Text(
                            'Locate ride',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                            ), // Text size
                          ),
                        ),
                        SizedBox(width: 5),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, "/feedback-form");
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.green, // Text color
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4), // Padding
                            minimumSize: Size(80, 30), // Minimum size
                          ),
                          child: Text(
                            'How are we doing?',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                            ), // Text size
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "${widget.currencyFormater.format(
                        widget.totalFare,
                      )}",
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
    );
  }
}
