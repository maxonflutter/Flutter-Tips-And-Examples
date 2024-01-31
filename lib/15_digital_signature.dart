// Digital signature
// YT: https://www.youtube.com/@MaxonFlutter/
// Courses: https://www.atomsbox.com/
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:signature/signature.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      home: const DigitaSignatureExample(),
    );
  }
}

class DigitaSignatureExample extends StatefulWidget {
  const DigitaSignatureExample({super.key});

  @override
  State<DigitaSignatureExample> createState() => _DigitaSignatureExampleState();
}

class _DigitaSignatureExampleState extends State<DigitaSignatureExample> {
  final SignatureController _controller = SignatureController(
    penStrokeWidth: 1,
    penColor: Colors.black,
    exportBackgroundColor: Colors.transparent,
    exportPenColor: Colors.black,
    onDrawStart: () => print('onDrawStart called!'),
    onDrawEnd: () => print('onDrawEnd called!'),
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Signature Demo'),
        actions: [
          IconButton(
            onPressed: () {
              setState(() => _controller.undo());
            },
            icon: const Icon(Icons.undo),
          ),
          const SizedBox(width: 8.0),
          IconButton(
            onPressed: () {
              setState(() => _controller.redo());
            },
            icon: const Icon(Icons.redo),
          ),
          const SizedBox(width: 8.0),
        ],
      ),
      body: Column(
        children: [
          Signature(
            controller: _controller,
            height: 300,
            backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                FilledButton.icon(
                  style: FilledButton.styleFrom(
                    minimumSize: const Size.fromHeight(48.0),
                  ),
                  onPressed: () async {
                    final Uint8List? data = await _controller.toPngBytes(
                      height: 1000,
                      width: 1000,
                    );

                    print(data);
                  },
                  icon: const Icon(Icons.image),
                  label: const Text('Export Image'),
                ),
                const SizedBox(height: 8.0),
                FilledButton.icon(
                  style: FilledButton.styleFrom(
                    minimumSize: const Size.fromHeight(48.0),
                  ),
                  onPressed: () {
                    setState(() => _controller.clear());
                  },
                  icon: const Icon(Icons.clear),
                  label: Text('Clear'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
