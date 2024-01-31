// Radial Bar Chart with syncfusion_flutter_charts package
// YT: https://www.youtube.com/@MaxonFlutter/
// Courses: https://www.atomsbox.com/
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

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
      home: const RadialBarExample(),
    );
  }
}

class RadialBarExample extends StatelessWidget {
  const RadialBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Analytics with Flutter'),
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Card(
              child: Container(
                padding: const EdgeInsets.all(16.0),
                child: const RadialBarChart(),
              ),
            ),
            Card(
              child: Container(
                padding: const EdgeInsets.all(16.0),
                child: const RadialBarChartV2(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class RadialBarChart extends StatelessWidget {
  const RadialBarChart({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData('Target', 80, const Color(0xFF909CDF)),
      ChartData('Actuals', 50, const Color(0xFF9C254D)),
    ];

    return SfCircularChart(
      legend: const Legend(
        isVisible: true,
        position: LegendPosition.bottom,
      ),
      series: <RadialBarSeries<ChartData, String>>[
        RadialBarSeries<ChartData, String>(
          useSeriesColor: true,
          trackOpacity: 0.3,
          cornerStyle: CornerStyle.bothCurve,
          dataSource: chartData,
          maximumValue: 100,
          trackBorderWidth: 2,
          radius: '100%',
          trackBorderColor: Colors.white,
          pointColorMapper: (ChartData data, _) => data.color,
          xValueMapper: (ChartData sales, _) => sales.x,
          yValueMapper: (ChartData sales, _) => sales.y,
          dataLabelSettings: DataLabelSettings(
            isVisible: true,
            textStyle: Theme.of(context)
                .textTheme
                .labelMedium!
                .copyWith(fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}

class RadialBarChartV2 extends StatelessWidget {
  const RadialBarChartV2({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = <ChartData>[
      ChartData('Low', 3500, const Color(0xFF1313131)),
      ChartData('Average', 7200, const Color(0xFF909CDF)),
      ChartData('High', 10500, const Color(0xFF9C254D)),
    ];
    return SfCircularChart(
      legend: const Legend(
        isVisible: true,
        position: LegendPosition.bottom,
      ),
      series: <CircularSeries<ChartData, String>>[
        RadialBarSeries<ChartData, String>(
            maximumValue: 6000,
            radius: '100%',
            gap: '3%',
            dataSource: chartData,
            xValueMapper: (ChartData data, _) => data.x,
            yValueMapper: (ChartData data, _) => data.y,
            pointColorMapper: (ChartData data, _) => data.color)
      ],
    );
  }
}

class ChartData {
  ChartData(
    this.x,
    this.y,
    this.color,
  );
  final String x;
  final double y;
  final Color color;
}
