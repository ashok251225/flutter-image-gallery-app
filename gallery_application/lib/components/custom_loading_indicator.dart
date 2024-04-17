import 'dart:math';

import 'package:flutter/material.dart';

class FlowerLoadingIndicator extends StatefulWidget {
  const FlowerLoadingIndicator({super.key});
  @override
  FlowerLoadingIndicatorState createState() => FlowerLoadingIndicatorState();
}

class FlowerLoadingIndicatorState extends State<FlowerLoadingIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();

    _scaleAnimation = Tween<double>(
      begin: 0.5,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _colorAnimation = ColorTween(
      begin: Colors.purple,
      end: Colors.blue,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          painter: FlowerPainter(
            scale: _scaleAnimation.value,
            color: _colorAnimation.value!,
          ),
          child: const SizedBox(
            width: 200,
            height: 200,
          ),
        );
      },
    );
  }
}

class FlowerPainter extends CustomPainter {
  final double scale;
  final Color color;

  FlowerPainter({required this.scale, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    var center = Offset(size.width / 2, size.height / 2);
    var radius = size.width / 4 * scale;

    for (int i = 0; i < 8; i++) {
      var angle = i * 45.0;
      var x = center.dx + radius * cos(angle * pi / 180);
      var y = center.dy + radius * sin(angle * pi / 180);
      canvas.drawCircle(Offset(x, y), size.width / 15, paint);
    }

    paint.color = Colors.yellow;
    canvas.drawCircle(center, size.width / 12, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
