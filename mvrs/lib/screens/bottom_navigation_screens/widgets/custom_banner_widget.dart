import 'package:flutter/material.dart';

class CustomBannerWidget extends StatelessWidget {
  final String title;

  const CustomBannerWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      decoration: BoxDecoration(
        gradient: RadialGradient(
          center: Alignment.center,
          radius: 5.0,
          colors: [Colors.blue, Colors.white],
          stops: [0.0, 1.0],
        ),
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
