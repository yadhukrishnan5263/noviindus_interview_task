import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PolygoneShape extends StatelessWidget {
  const PolygoneShape({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaint(
        painter: BodyPainter(),
        size: Size.infinite,
      ),
    );
  }
}
class BodyPainter extends CustomPainter {
  final bottomPadding = 10;
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path()
      ..lineTo(size.width, 0)
      ..lineTo(280, 250 ) //65& on left
      ..lineTo(0,0)
      ..lineTo(0, 0);

    Paint paint = Paint()..color = Color(0xffFC153B);

    canvas.drawPath(path, paint);
    // bottom line


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}