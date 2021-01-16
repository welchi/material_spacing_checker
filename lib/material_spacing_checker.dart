library material_spacing_checker;

import 'package:flutter/material.dart';

class MaterialSpacingChecker extends StatelessWidget {
  MaterialSpacingChecker({
    @required this.child,
    this.lineSpacing = 8,
    this.lineWeight = 0.3,
    Color lineColor,
  }) : lineColor = lineColor ??
            Colors.red.withOpacity(
              0.7,
            );
  final Widget child;
  final Color lineColor;
  final double lineSpacing;
  final double lineWeight;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Stack(
      children: [
        child,
        CustomPaint(
          painter: _GridPaint(
            screenSize: screenSize,
            lineColor: lineColor,
            lineSpacing: lineSpacing,
            lineWeight: lineWeight,
          ),
        )
      ],
    );
  }
}

/// Draw grid
class _GridPaint extends CustomPainter {
  _GridPaint({
    @required this.screenSize,
    @required this.lineColor,
    @required this.lineSpacing,
    @required this.lineWeight,
  });
  final Size screenSize;
  final double lineSpacing;
  final Color lineColor;
  final double lineWeight;
  @override
  void paint(Canvas canvas, Size size) {
    // Without +1, the number of lines may be insufficient
    final widthLineCount = screenSize.width ~/ lineSpacing + 1;
    final heightLineCount = screenSize.height ~/ lineSpacing;
    final paint = Paint()
      ..color = lineColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = lineWeight;

    for (var i = 0; i < widthLineCount; i++) {
      canvas.drawLine(
        Offset(
          (lineSpacing * i).toDouble(),
          0,
        ),
        Offset(
          (lineSpacing * i).toDouble(),
          screenSize.height,
        ),
        paint,
      );
    }
    for (var i = 0; i < heightLineCount; i++) {
      canvas.drawLine(
        Offset(
          0,
          (lineSpacing * i).toDouble() + 4,
        ),
        Offset(
          screenSize.width,
          (lineSpacing * i).toDouble() + 4,
        ),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
