import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class MessageBubble extends StatelessWidget {
  final bool isMe;
  final Color color;
  final double radius;
  final Widget child;

  const MessageBubble({
    Key? key,
    required this.isMe,
    required this.color,
    required this.radius,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: ShapePainter(
        isMe: isMe,
        color: color,
        radius: radius,
      ),
      child: child,
    );
  }
}

class ShapePainter extends CustomPainter {
  final bool isMe;
  final Color color;
  final double radius;

  ShapePainter({
    required this.isMe,
    required this.color,
    required this.radius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;
    final path = Path();

    if (isMe) {
      path.moveTo(0, radius);
      path.lineTo(radius, 0);
      path.arcToPoint(Offset(radius, radius), radius: Radius.circular(radius));
      path.lineTo(radius, size.height - radius);
      path.arcToPoint(Offset(0, size.height), radius: Radius.circular(radius));
      path.lineTo(0, radius);
    } else {
      path.moveTo(size.width, radius);
      path.lineTo(size.width - radius, 0);
      path.arcToPoint(
        Offset(size.width - radius, radius),
        radius: Radius.circular(radius),
        clockwise: false,
      );
      path.lineTo(size.width - radius, size.height - radius);
      path.arcToPoint(
        Offset(size.width, size.height),
        radius: Radius.circular(radius),
        clockwise: false,
      );
      path.lineTo(size.width, radius);
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(ShapePainter oldDelegate) =>
      oldDelegate.isMe != isMe ||
      oldDelegate.color != color ||
      oldDelegate.radius != radius;
}
