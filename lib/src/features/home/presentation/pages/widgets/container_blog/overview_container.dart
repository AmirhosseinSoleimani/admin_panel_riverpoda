import 'package:admin_panel/src/shared/resources/resources.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class OverviewContainer extends StatefulWidget {
  const OverviewContainer({super.key, required this.title, required this.number, required this.rate});
  final String title;
  final String number;
  final String rate;

  @override
  State<OverviewContainer> createState() => _OverviewContainerState();
}

class _OverviewContainerState extends State<OverviewContainer> {
  List<Color> gradientColors = [
    ColorThemeManager.green,
    ColorThemeManager.greenLight2,
  ];

  List<Color> gradientColors2 = [
    ColorThemeManager.redColor,
    ColorThemeManager.redLight2,
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('${widget.title}: ', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.onSecondary)),
              Space.h4,
              Text(widget.number, style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Theme.of(context).colorScheme.secondary)),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.all(AppPadding.p8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSize.s12),
            color: Theme.of(context).colorScheme.surface,
            border: Border.all(
              width: AppSize.s2,
              color: Theme.of(context).colorScheme.secondaryContainer
            )
          ),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: AspectRatio(
                  aspectRatio: 2.0,
                  child: LineChart(
                    mainData(),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only( left: AppPadding.p12),
                  child: Text(
                    widget.rate,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: AppSize.s12,
                      color: (widget.rate.contains('+') ? ColorThemeManager.green : Theme.of(context).colorScheme.error)
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: false,
        drawVerticalLine: false,
        horizontalInterval: 10,
        verticalInterval: 10,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: ColorThemeManager.blue,
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: ColorThemeManager.lightBlue,
            strokeWidth: 1,
          );
        },
      ),
      titlesData: const FlTitlesData(
        show: true,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 3),
            FlSpot(2.6, 2),
            FlSpot(4.9, 5),
            FlSpot(6.8, 3.1),
            FlSpot(8, 4),
            FlSpot(9.5, 3),
            FlSpot(11, 4),
          ],
          isCurved: true,
          gradient: LinearGradient(
            colors: (widget.rate.contains('+')) ? gradientColors : gradientColors2,
          ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: (widget.rate.contains('+')) ? gradientColors.map((color) => color.withOpacity(0.3))
                  .toList() : gradientColors2
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}
