import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seye/drone_status_provider.dart';
import 'drone_states_card.dart';
import 'dart:async';
import 'detection_result_card.dart';
import 'test.dart';

class OutdoorPage extends StatefulWidget {
  final String drone_id;

  const OutdoorPage({Key? key, required this.drone_id}) : super(key: key);

  @override
  State<OutdoorPage> createState() => _OutdoorPageState();
}

class _OutdoorPageState extends State<OutdoorPage> {
  late Timer _timer;
  @override

  void initState() {
    super.initState();
    // Start a timer to get drone status every 3 seconds
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      Provider.of<DroneStatusProvider>(context, listen: false).getDroneStatus(widget.drone_id);
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drone Status'),
      ),
      body: Column(
        children: [
          DetectionResultCard(result: 'result', time: 'time'),
          SwimmingPoolDetectionCard(),
          // Use Consumer to listen to changes in DroneStatusProvider
          Consumer<DroneStatusProvider>(
            builder: (context, droneStatusProvider, child) {
              return DroneStatusCard(
                speed: droneStatusProvider.droneStatus?.speed ?? 0,
                battery: droneStatusProvider.droneStatus?.battery ?? 0,
                location: droneStatusProvider.droneStatus?.location ?? 'N/A',
                height: droneStatusProvider.droneStatus?.height ?? 0,
                temperature: droneStatusProvider.droneStatus?.temperature ?? 0,
                flightTime: droneStatusProvider.droneStatus?.flightTime ?? 0,
              );
            },
          ),
        ],
      ),
    );
  }
}
