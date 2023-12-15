import 'package:flutter/material.dart';
import 'dart:ui' as ui show Gradient;

class CustomPaintRoute extends StatelessWidget {
  const CustomPaintRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomPaint(
        size: const Size(300, 400), //指定画布大小
        painter: MyPainter(),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double eWidth = size.width / 10;
    final rect = Offset.zero & size;

    //画棋盘背景
    final paint = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill // 填充
      ..color = const Color(0x590482FF);

    final borderPaint = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10.0
      ..shader = ui.Gradient.linear(
        Offset(rect.left, rect.top),
        Offset(rect.right, rect.bottom),
        [const Color(0xD73873CC), const Color(0xA6131044)],
      ); // 创建线性渐变边框


    // 绘制底色
    canvas.drawRect(rect, paint);

    // 绘制边框
    canvas.drawRect(rect, borderPaint);


    //画棋盘网格
    paint
      ..style = PaintingStyle.stroke //线
      ..color = const Color(0xFF96DAFF)
      ..strokeWidth = 5.0;

    for (int i = 1; i < 10; ++i) {
      double dx = eWidth * i;
      canvas.drawLine(Offset(dx, 5), Offset(dx, size.height-5), paint);
    }

    paint
      ..style = PaintingStyle.fill
      ..color = const Color(0xFFFF7E22);
    canvas.drawCircle(const Offset(200, 300), 7, paint);
    canvas.drawCircle(const Offset(100, 50), 7, paint);
    canvas.drawCircle(const Offset(120, 70), 7, paint);
    canvas.drawCircle(const Offset(100, 90), 7, paint);
    canvas.drawCircle(const Offset(10, 243), 7, paint);
    canvas.drawCircle(const Offset(168, 248), 7, paint);
    canvas.drawCircle(const Offset(207, 158), 7, paint);
  }

  //在实际场景中正确利用此回调可以避免重绘开销，本示例我们简单的返回true
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
