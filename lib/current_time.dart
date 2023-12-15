import 'package:flutter/material.dart';

class ClockWidget extends StatefulWidget {
  const ClockWidget({super.key});

  @override
  _ClockWidgetState createState() => _ClockWidgetState();
}

class _ClockWidgetState extends State<ClockWidget> {
  String _currentTime = '';

  @override
  void initState() {
    super.initState();
    // 在组件初始化时获取当前时间
    _getCurrentTime();
  }

  void _getCurrentTime() {
    DateTime now = DateTime.now();
    String formattedTime = "${_formatTime(now.hour)}:${_formatTime(now.minute)}:${_formatTime(now.second)}";
    setState(() {
      _currentTime = formattedTime;
    });
    // 每秒更新一次时间
    Future.delayed(const Duration(seconds: 1), _getCurrentTime);
  }

  String _formatTime(int time) {
    // 将时间转化为带前导零的字符串
    return time.toString().padLeft(2, '0');
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _currentTime,
      style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.indigo),
    );
  }
}
