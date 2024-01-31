// Carousel Slider with dots indication in a Flutter app by maxonflutter
// YT: https://www.youtube.com/@MaxonFlutter/
// Courses: https://www.atomsbox.com/
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
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
      home: const CarouselSliderWithDots(),
    );
  }
}

class CarouselSliderWithDots extends StatefulWidget {
  const CarouselSliderWithDots({
    super.key,
    this.items = const [
      'https://images.unsplash.com/photo-1688920556232-321bd176d0b4?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80',
      'https://images.unsplash.com/photo-1689085781839-2e1ff15cb9fe?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80',
      'https://images.unsplash.com/photo-1688980034676-7e8ee518e75a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=735&q=80',
    ],
  });

  final List<String> items;

  @override
  State<CarouselSliderWithDots> createState() => _CarouselSliderWithDotsState();
}

class _CarouselSliderWithDotsState extends State<CarouselSliderWithDots> {
  late CarouselController controller;
  int currentIndex = 0;

  @override
  void initState() {
    controller = CarouselController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Carousel with Dots Indicator')),
      body: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          CarouselSlider(
            carouselController: controller,
            items: widget.items
                .map(
                  (item) => Image.network(
                    item,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                )
                .toList(),
            options: CarouselOptions(
              height: 400,
              autoPlay: true,
              onPageChanged: (index, reason) {
                setState(() {
                  currentIndex = index;
                });
              },
            ),
          ),
          Positioned(
            bottom: 8.0,
            child: DotsIndicator(
              dotsCount: widget.items.length,
              position: currentIndex,
              onTap: (index) {
                controller.animateToPage(index);
              },
              decorator: DotsDecorator(
                color: Colors.white,
                activeColor: Colors.amber,
                size: const Size.square(12.0),
                activeSize: const Size(24.0, 12.0),
                activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
