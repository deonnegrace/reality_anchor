import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

/// Kiwi, the gradient companion. Moods and poses come later.
class Kiwi extends StatelessWidget {
  const Kiwi({super.key, this.size = 96});

  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size * 1.08,
      child: CustomPaint(painter: _KiwiPainter()),
    );
  }
}

class _KiwiPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final body = Path()
      ..moveTo(size.width * 0.50, size.height * 0.08)
      ..cubicTo(
        size.width * 0.74,
        size.height * 0.02,
        size.width * 0.96,
        size.height * 0.20,
        size.width * 0.93,
        size.height * 0.42,
      )
      ..cubicTo(
        size.width * 0.99,
        size.height * 0.66,
        size.width * 0.82,
        size.height * 0.96,
        size.width * 0.52,
        size.height * 0.97,
      )
      ..cubicTo(
        size.width * 0.18,
        size.height * 0.98,
        size.width * 0.02,
        size.height * 0.70,
        size.width * 0.08,
        size.height * 0.44,
      )
      ..cubicTo(
        size.width * 0.04,
        size.height * 0.20,
        size.width * 0.26,
        size.height * 0.04,
        size.width * 0.50,
        size.height * 0.08,
      )
      ..close();

    final bounds = body.getBounds();
    final fill = Paint()
      ..shader = const LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [Color(0xFF5FCFC2), Color(0xFF9A8FE2), Color(0xFFF3A8B8)],
        stops: [0.0, 0.48, 1.0],
      ).createShader(bounds)
      ..style = PaintingStyle.fill;
    canvas.drawShadow(body, const Color(0x228B7FD4), 6, false);
    canvas.drawPath(body, fill);

    final highlight = Paint()..color = const Color(0x55FFFFFF);
    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(size.width * 0.36, size.height * 0.30),
        width: size.width * 0.28,
        height: size.height * 0.16,
      ),
      highlight,
    );

    final eye = Paint()..color = AppColors.ink;
    final eyeRadius = size.width * 0.035;
    canvas.drawCircle(
      Offset(size.width * 0.38, size.height * 0.46),
      eyeRadius,
      eye,
    );
    canvas.drawCircle(
      Offset(size.width * 0.62, size.height * 0.46),
      eyeRadius,
      eye,
    );

    final smile = Paint()
      ..color = AppColors.ink
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.025
      ..strokeCap = StrokeCap.round;
    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(size.width * 0.50, size.height * 0.56),
        width: size.width * 0.22,
        height: size.height * 0.16,
      ),
      0.3,
      2.5,
      false,
      smile,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
