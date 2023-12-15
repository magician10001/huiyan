import 'package:dio/dio.dart';

Future<int> checkIP(String ip) async {
  final dio = Dio(BaseOptions(baseUrl: "http://10.15.229.17:5000"));

  try {
    final response = await dio.get("/check_ip/$ip");

    if (response.statusCode == 200) {
      // Parse the response and return the result
      final Map<String, dynamic> responseData = response.data;
      return responseData['result'];
    } else {
      // Handle errors
      print('Error: ${response.statusCode}');
      return 0;
    }
  } catch (error) {
    // Handle Dio errors
    print('Dio error: $error');
    return 0;
  }
}
