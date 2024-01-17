import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

Future<bool> checkID(String ip, BuildContext context) async {
  final dio = Dio(BaseOptions(baseUrl: "http://116.63.13.38:80", connectTimeout: const Duration(seconds: 3), receiveTimeout: const Duration(seconds: 3)));

  try {
    final response = await dio.get("/check_id/$ip");

    if (response.statusCode == 200) {
      // Parse the response and return the result
      final Map<String, dynamic> responseData = response.data;
      if (responseData['result'] == 1) {
        return true;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('无法找到无人机，请检查是否已成功连接到电脑')),
        );
        return false;
      }
    } else {
      // Handle errors
      print('Error: ${response.statusCode}');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${response.statusCode}')),
      );
      return false;
    }
  } on DioException catch (error) {
    // Handle Dio errors
    print('Dio error: $error');
    if (error.type == DioExceptionType.connectionTimeout) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('连接超时')),
      );
    }
    return false;
  }
}
