import 'package:flutter/material.dart';
import 'drone_states_card.dart';

class OutdoorPage extends StatelessWidget {
  // You can add necessary logic and UI for displaying the drone status here

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drone Status'),
      ),
      body: Column(
        children: [
          DroneStatusCard(
            speed: 10.5,
            batteryLevel: 75,
            location: '37.77, -122.41',
          )
        ],
      ),
    );
  }
}
