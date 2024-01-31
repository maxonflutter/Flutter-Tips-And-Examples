// Funnel Chart with syncfusion_flutter_charts package
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
      home: const FunnelExample(),
    );
  }
}

class FunnelExample extends StatelessWidget {
  const FunnelExample({super.key});

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
                child: FunnelChart(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class FunnelChart extends StatefulWidget {
  const FunnelChart({super.key});

  @override
  State<FunnelChart> createState() => _FunnelChartState();
}

class _FunnelChartState extends State<FunnelChart> {
  var chartData = [
    ChartData(1, 'Sessions', 200),
    ChartData(2, 'Add to Cart', 40),
    ChartData(3, 'Checkout Start', 24),
    ChartData(4, 'Purchase Completed', 12),
  ];

  @override
  void initState() {
    chartData.sort((a, b) => a.index.compareTo(b.index));
    chartData = chartData.reversed.toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SfFunnelChart(
      legend: Legend(
        isVisible: true,
        overflowMode: LegendItemOverflowMode.scroll,
        position: LegendPosition.bottom,
        textStyle: Theme.of(context).textTheme.bodySmall,
      ),
      palette: const [
        Color(0xFFFFF7BF),
        Color(0xFF5AAB84),
        Color(0xFF909CDF),
        Color(0xFF9C254D),
      ],
      series: FunnelSeries<ChartData, String>(
        dataSource: chartData,
        gapRatio: 0.1,
        dataLabelSettings: const DataLabelSettings(
          isVisible: true,
          labelPosition: ChartDataLabelPosition.outside,
          useSeriesColor: true,
        ),
        emptyPointSettings:
            const EmptyPointSettings(mode: EmptyPointMode.average),
        xValueMapper: (ChartData data, _) => data.x,
        yValueMapper: (ChartData data, _) => data.y,
      ),
    );
  }
}

class ChartData {
  ChartData(this.index, this.x, this.y, [this.color]);
  final int index;
  final String x;
  final double y;
  final Color? color;
}
