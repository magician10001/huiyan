import 'package:flutter/material.dart';
import 'current_time.dart';

class DetectionResultCard extends StatelessWidget {
  final int drowningCount;
  final String time;

  DetectionResultCard({
    required this.drowningCount,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    String displayText;
    Color textColor;
    Color? backgroundColor;

    if (drowningCount == '-1') {
      displayText = '检测结果未知';
      textColor = Color(0xE4B6961F);
      backgroundColor = Color(0xE4E8E8E8);
    } else if (drowningCount == 0) {
      displayText = '检测结果正常';
      textColor = Color(0xE4050B34);
      backgroundColor = Colors.greenAccent[100];
    } else {
      displayText = '检测结果异常';
      textColor = Color(0xFF961717);
      backgroundColor = Colors.redAccent[100];
    }


    return Card(
      elevation: 5,
      margin: EdgeInsets.all(10),
      color: backgroundColor,
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Row(
          children: [
            Column(
              children: [
                ClockWidget(),
                Text(
                  displayText,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: textColor,
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