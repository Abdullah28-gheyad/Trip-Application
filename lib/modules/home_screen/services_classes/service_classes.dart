import 'package:flutter/material.dart';

class CircleTabIndicator extends Decoration {
  Color color;

  double radius;

  CircleTabIndicator({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return CirclePainter(color: color, radius: radius);
  }
}

class CirclePainter extends BoxPainter {
  Color color;

  double radius;

  CirclePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint paint = Paint();
    paint.color = color;
    paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
        configuration.size!.width / 2, configuration.size!.height - radius);
    canvas.drawCircle(offset + circleOffset, radius, paint);
  }
}