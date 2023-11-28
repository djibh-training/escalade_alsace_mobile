import 'package:flutter/material.dart';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

class CircularChart extends StatelessWidget {
  CircularChart(this.sections, {super.key});

  final Map sections;
  final List<Color> colors = [
    Colors.blue,
    Colors.purple,
    Colors.yellow,
    Colors.orange,
    Colors.red,
    Colors.redAccent
  ];

  @override
  Widget build(BuildContext context) {
    var sortedKeys = sections.keys.toList()..sort();
    var sumLevels = sections.values
        .fold<double>(0, ((previousValue, element) => previousValue + element));
    return PieChart(
      data: List.generate(sections.length, (idx) {
        var percentDataValue = (sections[sortedKeys[idx]] / sumLevels) * 100;
        return PieChartData(colors[idx], percentDataValue);
      }),
      radius: 70,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            'Routes',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          Text(
            'Global levels',
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}

// this is used to pass data about chart values to the widget
class PieChartData {
  const PieChartData(this.color, this.percent);

  final Color color;
  final double percent;
}

// our pie chart widget
class PieChart extends StatelessWidget {
  PieChart({
    required this.data,
    required this.radius,
    this.sumData = 0,
    this.strokeWidth = 7,
    this.child,
    Key? key,
  })  : // make sure sum of data is never ovr 100 percent
        assert(data.fold<double>(0, (sum, data) => sum + data.percent) < 101),
        super(key: key);

  final List<PieChartData> data;
  // radius of chart
  final int sumData;
  final double radius;
  // width of stroke
  final double strokeWidth;
  // optional child; can be used for text for example
  final Widget? child;

  @override
  Widget build(context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: CustomPaint(
        painter: _Painter(strokeWidth, data),
        size: Size.square(radius),
        child: SizedBox.square(
          // calc diameter
          dimension: radius * 2,
          child: Center(
            child: child,
          ),
        ),
      ),
    );
  }
}

// responsible for painting our chart
class _PainterData {
  const _PainterData(this.paint, this.radians);

  final Paint paint;
  final double radians;
}

class _Painter extends CustomPainter {
  _Painter(double strokeWidth, List<PieChartData> data) {
    // convert chart data to painter data
    dataList = data
        .map((e) => _PainterData(
              Paint()
                ..color = e.color
                ..style = PaintingStyle.stroke
                ..strokeWidth = strokeWidth
                ..strokeCap = StrokeCap.round,
              // remove padding from stroke
              (e.percent - _padding) * _percentInRadians,
            ))
        .toList();
  }

  static const _percentInRadians = 0.062831853071796;
  static const _padding = 3;
  static const _paddingInRadians = _percentInRadians * _padding;
  // 0 radians is to the right, but since we want to start from the top
  // we'll use -90 degrees in radians
  static const _startAngle = -1.570796 + _paddingInRadians / 2;

  late final List<_PainterData> dataList;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    // keep track of start angle for next stroke
    double startAngle = _startAngle;

    for (final data in dataList) {
      final path = Path()..addArc(rect, startAngle, data.radians);

      startAngle += data.radians + _paddingInRadians;

      canvas.drawPath(path, data.paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
