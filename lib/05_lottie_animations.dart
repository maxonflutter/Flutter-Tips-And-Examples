// Lottie Animation in Flutter apps by maxonflutter
// YT: https://www.youtube.com/@MaxonFlutter/
// Courses: https://www.atomsbox.com/learn-flutter

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(useMaterial3: true),
      home: const LottieAnimationExample(),
    );
  }
}

class LottieAnimationExample extends StatelessWidget {
  const LottieAnimationExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animations with Lottie'),
      ),
      body: Column(
        children: [
          Lottie.asset(
            'assets/message_bubble.json',
            repeat: true,
            reverse: true,
            height: 300,
            width: double.infinity,
          ),
          Lottie.network(
            'https://lottie.host/f8860271-91c6-4b5f-aa91-7f954c590d35/EnOXnA2gtT.json',
            repeat: true,
            reverse: true,
            height: 300,
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}


// https://lottiefiles.com/animations/pizza-VnnHMy9OOV
