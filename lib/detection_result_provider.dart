import 'dart:async';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class DetectionResult {
  final int swimmerCount;
  final int drowningCount;

  DetectionResult({
    required this.swimmerCount,
    required this.drowningCount,
  });
}

class DetectionResultProvider with ChangeNotifier {
  DetectionResult? _detectionResult;
  late StreamController<DetectionResult?> _resultController;

  DetectionResultProvider() {
    _detectionResult = null;
    _resultController = StreamController<DetectionResult?>.broadcast();
  }

  DetectionResult? get detectionResult => _detectionResult;

  Stream<DetectionResult?> get resultStream => _resultController.stream;

  void updateDetectionResult(DetectionResult result) {
    _detectionResult = result;
    _resultController.add(_detectionResult);
    notifyListeners();
  }

  void dispose() {
    _resultController.close();
    super.dispose();
  }

  Future<void> getDetectionResult(String drone_id) async {
    final dio = Dio(BaseOptions(baseUrl: "http://116.63.13.38:80", connectTimeout: const Duration(seconds: 3), receiveTimeout: const Duration(seconds: 3)));

    try {
      final response = await dio.get("/get_result/$drone_id");
      if (response.statusCode == 200) {
        // Parse the response and return the result
        final Map<String, dynamic> responseData = response.data[0];
        print('Response data: $responseData');
        final DetectionResult result = DetectionResult(
          swimmerCount: responseData['swimmerCount'],
          drowningCount: responseData['drowningCount'],
        );
        updateDetectionResult(result);
      } else {
        print('Error getting detection result');
      }
    } on DioException catch (e) {
      print('Error getting detection result: $e');
    }
  }
}