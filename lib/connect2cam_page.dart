import 'package:flutter/material.dart';

class Connect2CamPage extends StatelessWidget {
  // You can add necessary logic and UI for connecting to the drone here

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Camera Connection'),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 20),
            Image.asset(
              'assets/cctv-camera.png', // Replace with the actual path to your drone sticker
              width: 200, // Adjust the width as needed
              height: 200, // Adjust the height as needed
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to DroneStatusPage when the button is pressed
                Navigator.pop(context);
              },
              child: Text('Connect to Camera'),
            ),
          ],
        ),
      ),
    );
  }
}