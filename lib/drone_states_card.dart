import 'package:flutter/material.dart';

class DroneStatusCard extends StatelessWidget {
  final double speed; // Speed of the drone
  final int batteryLevel; // Battery level of the drone
  final String location; // Location of the drone

  // Constructor to initialize the data
  DroneStatusCard({required this.speed, required this.batteryLevel, required this.location});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5, // Card elevation for a shadow effect
      margin: EdgeInsets.all(10), // Margin around the card
      child: Padding(
        padding: EdgeInsets.all(15), // Padding within the card
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/drone.png', // Replace with the actual path to your drone image
              width: 100, // Adjust the width as needed
              height: 100, // Adjust the height as needed
            ),
            SizedBox(width: 30), // Add some space between image and text
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Drone Status',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text('Speed: $speed m/s'),
                Text('Battery Level: $batteryLevel%'),
                Text('Location: $location'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
