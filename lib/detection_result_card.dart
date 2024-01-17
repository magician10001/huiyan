import 'package:flutter/material.dart';
import 'current_time.dart';

class DetectionResultCard extends StatelessWidget {
  final String result;
  final String time;

  DetectionResultCard({
    required this.result,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(10),
      color: Colors.greenAccent[100],
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Row(
          children: [
            Column(
              children: [
                ClockWidget(),
                Text(
                  '检测结果正常',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}