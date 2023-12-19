import 'package:flutter/material.dart';

class DroneStatusCard extends StatelessWidget {
  final double speed;
  final int batteryLevel;
  final String location;

  DroneStatusCard({
    required this.speed,
    required this.batteryLevel,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/drone.png',
              width: 100,
              height: 100,
            ),
            SizedBox(width: 30),
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
