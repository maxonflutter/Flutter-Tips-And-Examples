// Bar Charts with Flutter by maxonflutter
// YT: https://www.youtube.com/@MaxonFlutter/
// Courses: https://www.atomsbox.com/
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(useMaterial3: true),
      home: BarChart(
        colors: [
          Colors.deepOrange.shade100,
          Colors.deepOrange.shade200,
          Colors.deepOrange.shade300,
          Colors.deepOrange.shade400,
        ],
      ),
    );
  }
}

const defaultSpacing = 16.0;

class BarChart extends StatelessWidget {
  const BarChart({
    Key? key,
    this.colors,
    this.values = const [200, 100, 400, 30],
  }) : super(key: key);

  final List<Color>? colors;
  final List<double> values;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bar Chart')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LayoutBuilder(
              builder: (context, constraints) {
                final barWidth =
                    (constraints.maxWidth - defaultSpacing * values.length) /
                        values.length;
                return CustomPaint(
                  size: Size(constraints.maxWidth, 200),
                  painter: BarChartPainter(
                    values: values,
                    colors: colors ??
                        List<int>.generate(values.length, (i) => i + 1).map(
                          (e) {
                            final opacity = e / values.length;
                            return Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(opacity);
                          },
                        ).toList(),
                    barWidth: barWidth,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class BarChartPainter extends CustomPainter {
  BarChartPainter({
    required this.values,
    required this.colors,
    this.barWidth = 24.0,
  });

  final List<double> values;
  final List<Color> colors;
  final double barWidth;

  @override
  void paint(Canvas canvas, Size size) {
    // Find the maximum value in the list of values.
    double max = values.reduce((a, b) => a > b ? a : b);

    // Paint object for drawing the axes.
    final axisPaint = Paint()
      ..color = Colors.black
      ..strokeWidth = 1.0;

    // Draw the y-axis.
    canvas.drawLine(
      const Offset(0, 0),
      Offset(0, size.height),
      axisPaint,
    );

    // Draw the x-axis.
    canvas.drawLine(
      Offset(0, size.height),
      Offset(size.width, size.height),
      axisPaint,
    );

    // Loop through each value and draw a bar for it.
    for (int i = 0; i < values.length; i++) {
      // Paint object for drawing the bar.
      final paint = Paint()
        ..color = colors[i]
        ..style = PaintingStyle.fill;

      // Calculate the total space for each bar, including the space between bars.
      final totalSpace = barWidth + defaultSpacing;
      // Calculate the height of the bar based on its value.
      final barHeight = values[i] / max * (size.height - defaultSpacing);
      // Calculate the left position of the bar to center it within its allocated
      // space.
      final barLeft = i * totalSpace + totalSpace / 2 - barWidth / 2;

      // Create a rectangle representing the bar.
      final barRect = Rect.fromLTWH(
        barLeft,
        size.height - barHeight,
        barWidth,
        barHeight,
      );

      // Draw the bar on the canvas.
      canvas.drawRect(barRect, paint);

      // Create a TextPainter for drawing the label.
      final labelPainter = TextPainter(
        text: TextSpan(
          text: '${(values[i])}',
          style: const TextStyle(color: Colors.black, fontSize: 16),
        ),
        textDirection: TextDirection.ltr,
      );

      // Layout the text and paint it on the canvas.
      labelPainter.layout();
      labelPainter.paint(
        canvas,
        Offset(
          i * (barWidth + defaultSpacing) + (barWidth / 2 - defaultSpacing / 2),
          size.height,
        ),
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
