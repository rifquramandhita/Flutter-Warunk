import 'package:flutter/material.dart';
import 'package:warunk/theme/app_colors.dart';

class CustomDottedDivider extends StatelessWidget {
  final double height;
  final Color? color;
  final double dashWidth;
  final double dashSpace;

  const CustomDottedDivider({
    super.key,
    this.height = 1.0,
    this.color,
    this.dashWidth = 4.0,
    this.dashSpace = 4.0,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(double.infinity, height),
      painter: _DottedLinePainter(
        color: color ?? AppColors.primary.withValues(alpha: 0.3),
        strokeWidth: height,
        dashWidth: dashWidth,
        dashSpace: dashSpace,
      ),
    );
  }
}

class _DottedLinePainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double dashWidth;
  final double dashSpace;

  _DottedLinePainter({
    required this.color,
    required this.strokeWidth,
    required this.dashWidth,
    required this.dashSpace,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    double startX = 0;
    while (startX < size.width) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), paint);
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant _DottedLinePainter oldDelegate) {
    return oldDelegate.color != color ||
        oldDelegate.strokeWidth != strokeWidth ||
        oldDelegate.dashWidth != dashWidth ||
        oldDelegate.dashSpace != dashSpace;
  }
}
