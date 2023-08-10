// Popovers with the popover package by maxonflutter
// YT: https://www.youtube.com/@MaxonFlutter/
// Courses: https://www.atomsbox.com/learn-flutter

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:popover/popover.dart';

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
      home: const PopoverExample(),
    );
  }
}

class PopoverExample extends StatelessWidget {
  const PopoverExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<
        (
          String name,
          String path,
        )> popoverOptions = [
      ('Option 1', '/option-1'),
      ('Option 2', '/option-2'),
      ('Option 3', '/option-3')
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Popover Example'),
        centerTitle: true,
        actions: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              shape: BoxShape.circle,
            ),
            // The Builder widget helps us to add another context above its
            // children. Without the Builder, the context might refer to a
            // widget above the Container in the widget tree, which could
            // potentially cause issues when trying to show the popover.
            child: Builder(
              builder: (context) {
                return GestureDetector(
                  onTap: () => _showPopover(context, popoverOptions),
                  child: const Icon(Icons.more_vert),
                );
              },
            ),
          ),
          const SizedBox(width: 16.0),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ColorFiltered(
            colorFilter: ColorFilter.mode(
              Theme.of(context).colorScheme.primary,
              BlendMode.color,
            ),
            child: Lottie.asset(
              'assets/message_bubble.json',
              repeat: true,
              reverse: true,
              height: 300,
              width: double.infinity,
            ),
          ),
        ],
      ),
    );
  }

  Future<Object?> _showPopover(
    BuildContext context,
    List<(String, String)> popoverOptions,
  ) {
    Size size = MediaQuery.sizeOf(context);
    return showPopover(
      context: context,
      backgroundColor: Colors.white,
      radius: 16.0,
      bodyBuilder: (context) => ListView(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        children: popoverOptions.map((option) {
          return ListTile(
            title: Text(option.$1),
            onTap: () {
              Navigator.pushNamed(context, option.$2);
            },
          );
        }).toList(),
      ),

      direction: PopoverDirection.top,
      width: size.width * 0.5,
      arrowHeight: 16.0,
      arrowWidth: 16.0,
      // onPop: () {},
    );
  }
}
