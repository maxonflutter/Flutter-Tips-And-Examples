// Copy & Paste in Flutter apps by maxonflutter
// YT: https://www.youtube.com/@MaxonFlutter/
// Courses: https://www.atomsbox.com/learn-flutter

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show Clipboard, ClipboardData;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(useMaterial3: true),
      home: const CopyAndPaste(),
    );
  }
}

class CopyAndPaste extends StatelessWidget {
  const CopyAndPaste({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller1 = TextEditingController();
    final controller2 = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Copy & Paste')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SelectableText(
              'This is a string that you can Select and Copy',
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(color: Theme.of(context).colorScheme.primary),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32.0),
            InkWell(
              onTap: () {
                Clipboard.setData(
                  const ClipboardData(
                    text: 'This is a string that you can Tap and Copy',
                  ),
                );
              },
              child: Text(
                'This is a string that you can Tap and Copy',
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(color: Theme.of(context).colorScheme.secondary),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 32.0),
            TextFormField(
              controller: controller1,
              decoration: const InputDecoration(
                hintText: 'Tap here to paste manually',
              ),
            ),
            const SizedBox(height: 32.0),
            TextFormField(
              controller: controller2,
              decoration: const InputDecoration(
                hintText: 'Tap here to paste automatically',
              ),
              onTap: () async {
                if (await Clipboard.hasStrings()) {
                  final data = await Clipboard.getData('text/plain');
                  final text = data?.text;
                  if (text != null) {
                    controller2.text = text;
                  }
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
