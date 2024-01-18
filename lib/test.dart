import 'package:flutter/material.dart';

class SwimmingPoolDetectionCard extends StatelessWidget {
  final int swimmerCount;
  final int drowningCount;

  SwimmingPoolDetectionCard({
    required this.swimmerCount,
    required this.drowningCount,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.black12)),
            ),
            child: const Text(
              '水域监控',
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildDetectionResult('游泳者', swimmerCount, 'assets/swimming.png'),
                _buildDetectionResult('溺水者', drowningCount, 'assets/drowning.png'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBadge(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(text),
    );
  }

  Widget _buildDetectionResult(String element, int detected, String image) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(image),
              radius: 25,
              // child: detected
              //     ? null
              //     : Text(element[0], style: const TextStyle(fontSize: 20)),
            ),
            const SizedBox(width: 50),
            Text('$element: ${detected > 0 ? '$detected' : 'Not Detected'}',
                style: const TextStyle(fontSize: 18)),
          ],
        ),
      ],
    );
  }
}

// void main() {
//   runApp(MaterialApp(
//     home: Scaffold(
//       appBar: AppBar(title: const Text('Flutter Swimming Pool Detection')),
//       body: SwimmingPoolDetectionCard(),
//     ),
//   ));
// }
