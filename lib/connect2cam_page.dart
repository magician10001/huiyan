import 'package:flutter/material.dart';

class Connect2CamPage extends StatelessWidget {
  // You can add necessary logic and UI for connecting to the drone here

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('连接到监控摄像头'),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 20),
            Image.asset(
              'assets/cctv-camera.png', // Replace with the actual path to your drone sticker
              width: 300, // Adjust the width as needed
              height: 200, // Adjust the height as needed
            ),
            SizedBox(height: 70),
            Padding(
              padding: const EdgeInsets.only(left: 35, right: 35, bottom: 20),
              child: TextFormField(
                decoration: InputDecoration(
                  contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  labelText: '输入摄像头ID',
                  hintText: 'e.g., webcam-01',
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                    const BorderSide(color: Colors.lightBlue, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.circular(10),
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