library material_spacing_checker;

import 'package:flutter/material.dart';

class MaterialSpacingChecker extends StatelessWidget {
  MaterialSpacingChecker({
    @required this.child,
    this.space = 8,
    this.lineWidth = 0.3,
    Color color,
  }) : gridColor = color ??
            Colors.red.withOpacity(
              0.7,
            );
  final Widget child;
  final Color gridColor;
  final double space;
  final double lineWidth;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Stack(
      children: [
        child,
        CustomPaint(
          painter: _GridPaint(
            screenSize: screenSize,
            gridColor: gridColor,
            space: space,
            lineWidth: lineWidth,
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
    @required this.gridColor,
    @required this.space,
    @required this.lineWidth,
  });
  final Size screenSize;
  final double space;
  final Color gridColor;
  final double lineWidth;
  @override
  void paint(Canvas canvas, Size size) {
    // Without +1, the number of lines may be insufficient
    final widthLineCount = screenSize.width ~/ space + 1;
    final heightLineCount = screenSize.height ~/ space;
    final paint = Paint()
      ..color = gridColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = lineWidth;

    for (var i = 0; i < widthLineCount; i++) {
      canvas.drawLine(
        Offset(
          (space * i).toDouble(),
          0,
        ),
        Offset(
          (space * i).toDouble(),
          screenSize.height,
        ),
        paint,
      );
    }
    for (var i = 0; i < heightLineCount; i++) {
      canvas.drawLine(
        Offset(
          0,
          (space * i).toDouble() + 4,
        ),
        Offset(
          screenSize.width,
          (space * i).toDouble() + 4,
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
