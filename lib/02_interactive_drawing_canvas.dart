// Interactive Drawing Canvas by maxonflutter
// YT: https://www.youtube.com/@MaxonFlutter/
// Courses: https://www.atomsbox.com/learn-flutter

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
      home: const DrawingCanvas(),
    );
  }
}

class DrawingCanvas extends StatefulWidget {
  const DrawingCanvas({super.key});

  @override
  State<DrawingCanvas> createState() => _DrawingCanvasState();
}

class _DrawingCanvasState extends State<DrawingCanvas> {
  List<Offset> offsets = <Offset>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onPanUpdate: (DragUpdateDetails details) {
          setState(() {
            offsets.add(details.globalPosition);
          });
        },
        onPanEnd: (DragEndDetails details) => setState(() {}),
        child: CustomPaint(
          painter: Draw(offsets: offsets),
          size: Size.infinite,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.clear),
        label: const Text('Clear'),
        onPressed: () {
          setState(() => offsets.clear());
        },
      ),
    );
  }
}

class Draw extends CustomPainter {
  const Draw({required this.offsets});

  final List<Offset> offsets;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint.color = Colors.blue.shade900;
    paint.strokeWidth = 5.0;

    for (int i = 0; i < offsets.length - 1; i++) {
      canvas.drawLine(offsets[i], offsets[i + 1], paint);
    }
  }

  @override
  bool shouldRepaint(Draw oldDelegate) => true;
}
