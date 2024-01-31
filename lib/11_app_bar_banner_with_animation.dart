// App bar with an animated banner
// YT: https://www.youtube.com/@MaxonFlutter/
// Courses: https://www.atomsbox.com/
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher.dart';

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
      home: const AppBarWithAnimatedBanner(),
    );
  }
}

class AppBarWithAnimatedBanner extends StatelessWidget {
  const AppBarWithAnimatedBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Image.asset(
          'assets/images/junior_logo_white.png',
          height: 48.0,
        ),
        bottom: const AppBarBanner(),
      ),
      body: Container(),
    );
  }
}

class AppBarBanner extends StatelessWidget implements PreferredSizeWidget {
  const AppBarBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.0,
      width: double.infinity,
      color: const Color(0XFF982043),
      child: InkWell(
        onTap: () async {
          await launchUrl(
            Uri.parse(
              'https://junior.atomsbox.com',
            ),
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Junior AI works in your GitHub. Install it now!',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Colors.white),
            ),
            const SizedBox(width: 8.0),
            const Icon(Icons.launch),
          ],
        ),
      ),
    )
        .animate(
          onComplete: (controller) => controller.repeat(),
        )
        .shimmer(
          duration: const Duration(milliseconds: 2000),
          delay: const Duration(milliseconds: 1000),
        );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}
