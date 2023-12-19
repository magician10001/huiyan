import 'dart:async';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class DroneStatus {
  final double speed;
  final int battery;
  final String location;

  DroneStatus({
    required this.speed,
    required this.battery,
    required this.location,
  });
}

class DroneStatusProvider with ChangeNotifier {
  DroneStatus? _droneStatus;
  late StreamController<DroneStatus?> _statusController;

  DroneStatusProvider() {
    _droneStatus = null;
    _statusController = StreamController<DroneStatus?>.broadcast();
  }

  DroneStatus? get droneStatus => _droneStatus;

  Stream<DroneStatus?> get statusStream => _statusController.stream;

  void updateDroneStatus(DroneStatus status) {
    _droneStatus = status;
    _statusController.add(_droneStatus);
    notifyListeners();
  }

  void dispose() {
    _statusController.close();
    super.dispose();
  }

  Future<void> getDroneStatus() async {
    final dio = Dio(BaseOptions(baseUrl: "http://10.15.229.17:5000", connectTimeout: const Duration(seconds: 3), receiveTimeout: const Duration(seconds: 3)));

    try {
      final response = await dio.get("/get_data");
      if (response.statusCode == 200) {
        // Parse the response and return the result
        final Map<String, dynamic> responseData = response.data[0];
        print('Response data: $responseData');
        final DroneStatus status = DroneStatus(
          speed: responseData['speed'],
          battery: responseData['battery'],
          location: responseData['location'],
        );
        updateDroneStatus(status);
      } else {
        // Handle errors
        print('Error: ${response.statusCode}');
      }
    } on DioException catch (error) {
      // Handle Dio errors
      print('Dio error: $error');
      if (error.type == DioExceptionType.connectionTimeout) {
        print('Connection timeout');
      }
    }
  }
}
