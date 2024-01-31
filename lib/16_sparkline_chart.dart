// Sparkline Chart with syncfusion_flutter_charts package
// YT: https://www.youtube.com/@MaxonFlutter/
// Courses: https://www.atomsbox.com/

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

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
      home: const SparklineExample(),
    );
  }
}

class SparklineExample extends StatelessWidget {
  const SparklineExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Data Analytics with Flutter'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: SizedBox(
        height: 160,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
                          'Users:',
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
    );
  }
}

class SparklineChart extends StatelessWidget {
  const SparklineChart({super.key});

  @override
  Widget build(BuildContext context) {
    return SfSparkLineChart(
      width: 1,
      axisLineWidth: 0,
      color: Colors.white,
      data: const [100, 60, 80, 50, 110, 50, 60],
      labelDisplayMode: SparkChartLabelDisplayMode.none,
      marker: const SparkChartMarker(
        shape: SparkChartMarkerShape.circle,
        borderColor: Colors.white,
        color: Colors.white,
        displayMode: SparkChartMarkerDisplayMode.all,
      ),
      trackball: SparkChartTrackball(
        activationMode: SparkChartActivationMode.tap,
        color: Theme.of(context).colorScheme.inverseSurface,
        borderWidth: 1,
      ),
    );
  }
}

// class SparklineChart extends StatelessWidget {
//   const SparklineChart({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SfSparkLineChart(
//       width: 1,
//       axisLineWidth: 0,
//       color: Colors.white,
//       data: const [100, 60, 80, 50, 110, 50, 60],
//        labelDisplayMode: SparkChartLabelDisplayMode.none,
//       marker: const SparkChartMarker(
//         shape: SparkChartMarkerShape.circle,
//         borderColor: Colors.white,
//         color: Colors.white,
//         displayMode: SparkChartMarkerDisplayMode.all,
//       ),
//       trackball: SparkChartTrackball(
//         activationMode: SparkChartActivationMode.tap,
//         color: Theme.of(context).colorScheme.inverseSurface,
//         borderWidth: 1,
//       ),
//     );
//   }
// }

class SparkbarChart extends StatelessWidget {
  const SparkbarChart({super.key});

  @override
  Widget build(BuildContext context) {
    return SfSparkBarChart(
      axisLineWidth: 0,
      color: Colors.white,
      data: const [100, 60, 80, 50, 110, 50, 60],
      labelDisplayMode: SparkChartLabelDisplayMode.all,
      trackball: SparkChartTrackball(
        activationMode: SparkChartActivationMode.tap,
        color: Theme.of(context).colorScheme.inverseSurface,
        borderWidth: 1,
      ),
    );
  }
}

class SparkareaChart extends StatelessWidget {
  const SparkareaChart({super.key});

  @override
  Widget build(BuildContext context) {
    return SfSparkAreaChart(
      axisLineWidth: 0,
      color: Colors.white,
      data: const [100, 60, 80, 50, 110, 50, 60],
      labelDisplayMode: SparkChartLabelDisplayMode.none,
      marker: const SparkChartMarker(
        shape: SparkChartMarkerShape.circle,
        borderWidth: 0.0,
        color: Colors.white,
        displayMode: SparkChartMarkerDisplayMode.all,
      ),
      trackball: SparkChartTrackball(
        activationMode: SparkChartActivationMode.tap,
        color: Theme.of(context).colorScheme.inverseSurface,
        borderWidth: 1,
      ),
    );
  }
}
