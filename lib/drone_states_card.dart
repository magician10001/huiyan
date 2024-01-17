import 'package:flutter/material.dart';

class DroneStatusCard extends StatelessWidget {
  final int speed;
  final int battery;
  final String location;
  final int height;
  final int temperature;
  final int flightTime;

  DroneStatusCard({
    required this.speed,
    required this.battery,
    required this.location,
    required this.height,
    required this.temperature,
    required this.flightTime,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/drone.png',
              width: 100,
              height: 100,
            ),
            const SizedBox(width: 30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '无人机状态',
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text('飞行速度: $speed m/s'),
                Text('电池电量: $battery%'),
                Text('飞行距离: $location'),
                Text('飞行高度: $height m'),
                Text('主板温度: $temperature °C'),
                Text('飞行时间: $flightTime s'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
