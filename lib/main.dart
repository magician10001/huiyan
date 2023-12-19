import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seye/outdoor_page.dart';
import 'current_time.dart';
import 'draw_pool.dart';
import 'drone_states_card.dart';
import 'connect2drone_page.dart';
import 'connect2cam_page.dart';
import 'drone_status_provider.dart';

String title = '';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DroneStatusProvider(),
      child: MaterialApp(
        title: 'SSEye',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _currentIndex = 0; // 当前页面索引

  final List<Widget> _pages = [
    Connect2CamPage(),
    Connect2DronePage(),
  ];

  String greeting = '';

  @override
  void initState() {
    super.initState();
    // 在组件初始化时获取当前时间
    DateTime now = DateTime.now();
    int hour = now.hour;
    if (hour >= 6 && hour < 12) {
      greeting = '早上好';
    } else if (hour >= 12 && hour < 14) {
      greeting = '中午好';
    } else if (hour >= 14 && hour < 18) {
      greeting = '下午好';
    } else if (hour >= 18 && hour < 24) {
      greeting = '晚上好';
    } else {
      greeting = '夜深了';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleTextStyle: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Color(0xFF172342)),
        title: Text(greeting),
        actions: [
          IconButton(icon: const Icon(Icons.settings), onPressed: () {}),
        ],
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(IconData(0xe60e, fontFamily: 'MyIcons')),
            label: '室内',
          ),
          BottomNavigationBarItem(
            icon: Icon(IconData(0xe92e, fontFamily: 'MyIcons')),
            label: '户外',
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
