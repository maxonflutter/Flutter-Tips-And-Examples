// More animations with flutter_animate by maxonflutter
// YT: https://www.youtube.com/@MaxonFlutter/
// Courses: https://www.atomsbox.com/
import 'package:carousel_slider/carousel_slider.dart';
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
      home: const TextAndImageAnimation(),
    );
  }
}

class TextAndImageAnimation extends StatelessWidget {
  const TextAndImageAnimation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Records
    List<(String city, String imageUrl)> destinations = [
      (
        'New York',
        'https://images.unsplash.com/photo-1500916434205-0c77489c6cf7?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80',
      ),
      (
        'Paris',
        'https://images.unsplash.com/photo-1499856871958-5b9627545d1a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1420&q=80',
      ),
      (
        'Tokyo',
        'https://images.unsplash.com/photo-1513407030348-c983a97b98d8?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1472&q=80',
      ),
      (
        'Sydney',
        'https://images.unsplash.com/photo-1506973035872-a4ec16b8e8d9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80',
      )
    ];

    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Let\'s choose your travel route',
            textAlign: TextAlign.center,
            style: theme.textTheme.displaySmall!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          )
              .animate(onPlay: (controller) => controller.repeat())
              .shimmer(
                duration: 2400.ms,
                color: theme.colorScheme.primary,
              )
              .animate()
              .fadeIn(duration: 1200.ms, curve: Curves.easeOutQuad)
              .slide(),
          const Spacer(),
          CarouselSlider(
            options: CarouselOptions(
              height: size.height * 0.66,
              enlargeCenterPage: true,
            ),
            items: destinations.map(
              (destination) {
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0.0),
                  ),
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Image.network(
                          destination.$2,
                          fit: BoxFit.cover,
                        ),
                      ).animate().shimmer(duration: 1200.ms),
                      const SizedBox(height: 8.0),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          destination.$1,
                          textAlign: TextAlign.center,
                          style: theme.textTheme.displayLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: theme.colorScheme.onPrimary,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ).toList(),
          ).animate().fadeIn(
                duration: 1200.ms,
                curve: Curves.easeOutQuad,
              ),
          const Spacer(),
        ],
      ),
    );
  }
}
