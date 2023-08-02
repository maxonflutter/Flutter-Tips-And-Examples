// Animations with flutter_animatie by maxonflutter
// YT: https://www.youtube.com/@MaxonFlutter/
// Courses: https://www.atomsbox.com/learn-flutter

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

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
      home: const AvatarStackAnimation(),
    );
  }
}

class AvatarStackAnimation extends StatelessWidget {
  const AvatarStackAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('Animations with'),
          Text(
            'flutter_animate',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const AvatarStack(
            avatars: [
              'https://images.unsplash.com/photo-1688920556232-321bd176d0b4?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80',
              'https://images.unsplash.com/photo-1689085781839-2e1ff15cb9fe?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80',
              'https://images.unsplash.com/photo-1688980034676-7e8ee518e75a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=735&q=80',
            ],
          ),
        ],
      ),
    );
  }
}

class AvatarStack extends StatelessWidget {
  const AvatarStack({
    super.key,
    required this.avatars,
    this.stackHeight = 120,
    this.extraParticipantsCount,
  });

  final List<String> avatars;
  final double stackHeight;
  final int? extraParticipantsCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: stackHeight,
      child: Stack(
        children: List.generate(
          avatars.length,
          (index) => Align(
            alignment: Alignment.center,
            child: Transform.translate(
              offset: Offset((index - 1) * 50.0, 0),
              child: Avatar(imageUrl: avatars[index])
                  .animate(
                    delay: const Duration(
                      milliseconds: 500,
                    ),
                  )
                  .fadeIn(
                    delay: Duration(
                      milliseconds: index * 100,
                    ),
                  )
                  .slide(
                    begin: const Offset(0.5, 0),
                    duration: const Duration(
                      milliseconds: 200,
                    ),
                    curve: Curves.easeOut,
                    delay: Duration(
                      milliseconds: index * 100,
                    ),
                  )
                  .animate(
                onPlay: (controller) {
                  controller.repeat();
                },
              ).shimmer(
                duration: 2400.ms,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Avatar extends StatelessWidget {
  const Avatar({
    super.key,
    required this.imageUrl,
    this.radius = 50,
    this.child,
  });

  final String imageUrl;
  final int radius;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius.toDouble() + 2,
      backgroundColor: Colors.white,
      child: CircleAvatar(
        radius: radius.toDouble(),
        backgroundImage: NetworkImage(imageUrl),
        child: child,
      ),
    );
  }
}
