import 'package:flutter/material.dart';

class DashedBorder extends StatelessWidget {
  final Widget child;
  final Color color;
  final double radius;
  final bool circle;
  final double strokeWidth;
  final double dash;
  final double gap;

  const DashedBorder({
    super.key,
    required this.child,
    required this.color,
    this.radius = 24,
    this.circle = false,
    this.strokeWidth = 1.5,
    this.dash = 6,
    this.gap = 5,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _DashedPainter(
        color: color,
        radius: radius,
        circle: circle,
        strokeWidth: strokeWidth,
        dash: dash,
        gap: gap,
      ),
      child: child,
    );
  }
}

class _DashedPainter extends CustomPainter {
  final Color color;
  final double radius;
  final bool circle;
  final double strokeWidth;
  final double dash;
  final double gap;

  _DashedPainter({
    required this.color,
    required this.radius,
    required this.circle,
    required this.strokeWidth,
    required this.dash,
    required this.gap,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final rect = (Offset.zero & size).deflate(strokeWidth / 2);
    final path = Path();
    if (circle) {
      path.addOval(rect);
    } else {
      path.addRRect(RRect.fromRectAndRadius(rect, Radius.circular(radius)));
    }

    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    for (final metric in path.computeMetrics()) {
      double d = 0;
      while (d < metric.length) {
        canvas.drawPath(metric.extractPath(d, d + dash), paint);
        d += dash + gap;
      }
    }
  }

  @override
  bool shouldRepaint(covariant _DashedPainter old) =>
      old.color != color ||
          old.radius != radius ||
          old.circle != circle ||
          old.strokeWidth != strokeWidth;
}