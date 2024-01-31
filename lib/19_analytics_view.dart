// Radial Bar Chart with syncfusion_flutter_charts package
// YT: https://www.youtube.com/@MaxonFlutter/
// Courses: https://www.atomsbox.com/

import 'package:flutter/material.dart';
import 'package:flutter_tips_and_examples/17_funnel_chart.dart';

import '16_sparkline_chart.dart';
import '18_radial_bar_chart.dart';

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
      home: const AnalyticsViewExample(),
    );
  }
}

class AnalyticsViewExample extends StatelessWidget {
  const AnalyticsViewExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text(' Analytics with Flutter'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.tune),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 160,
                child: ListView(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.horizontal,
                  children: [
                    Card(
                      color: const Color(0xFF909CDF),
                      child: Container(
                        width: 285,
                        height: 160,
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '# of Sessions:',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall!
                                      .copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                Text(
                                  '200',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineLarge!
                                      .copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8.0),
                            Expanded(child: SparklineChart()),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      color: const Color(0xFF9C254D),
                      child: Container(
                        width: 285,
                        height: 160,
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '# of Users:',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall!
                                      .copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                Text(
                                  '134',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineLarge!
                                      .copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8.0),
                            Expanded(child: SparkareaChart()),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      color: const Color(0xFF131313),
                      child: Container(
                        width: 285,
                        height: 160,
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '# of Orders:',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall!
                                      .copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                Text(
                                  '59',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineLarge!
                                      .copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8.0),
                            Expanded(child: SparkbarChart()),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Card(
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  child: const RadialBarChartV2(),
                ),
              ),
              Card(
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  child: const FunnelChart(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
