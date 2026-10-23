import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../model/progress_entry.dart';
import '../../theme/color.dart';

class ProgressChart extends StatelessWidget {
  final List<ProgressEntry> entries;

  const ProgressChart({super.key, required this.entries});

  @override
  Widget build(BuildContext context) {
    if (entries.isEmpty) {
      return _buildEmptyState();
    }

    final sortedEntries = List<ProgressEntry>.from(entries)
      ..sort((a, b) => a.date.compareTo(b.date));

    final spots = List.generate(sortedEntries.length, (index) {
      return FlSpot(index.toDouble(), sortedEntries[index].weight);
    });

    return SizedBox(
      height: 220,
      child: LineChart(
        LineChartData(
          minX: -0.5,
          maxX: spots.length - 1 + 0.5,
          gridData: FlGridData(
            show: true,
            drawVerticalLine: false,
            horizontalInterval: 5,
            getDrawingHorizontalLine: (value) =>
                FlLine(color: AppColors.surface, strokeWidth: 1),
          ),

          borderData: FlBorderData(show: false),

          titlesData: FlTitlesData(
            topTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            rightTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 34,
                getTitlesWidget: (value, meta) => Text(
                  value.toInt().toString(),
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 11,
                    fontFamily: 'Tajawal',
                  ),
                ),
              ),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 28,
                interval: 1,
                getTitlesWidget: (value, meta) {
                  final index = value.toInt();
                  if (index < 0 || index >= sortedEntries.length) {
                    return const SizedBox.shrink();
                  }
                  final date = sortedEntries[index].date;
                  return Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      DateFormat('d/M').format(date),
                      style: TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 11,
                        fontFamily: 'Tajawal',
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

          lineBarsData: [
            LineChartBarData(
              spots: spots,
              isCurved: true,
              color: AppColors.accent,
              barWidth: 3,
              dotData: FlDotData(
                show: true,
                getDotPainter: (spot, percent, bar, index) =>
                    FlDotCirclePainter(
                      radius: 4,
                      color: AppColors.accent,
                      strokeWidth: 2,
                      strokeColor: AppColors.background,
                    ),
              ),
              belowBarData: BarAreaData(
                show: true,
                color: AppColors.accent.withOpacity(0.15),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return SizedBox(
      height: 120,
      child: Center(
        child: Text(
          'ما في تسجيلات كفاية لعرض الرسم البياني بعد',
          style: TextStyle(
            color: AppColors.textSecondary,
            fontFamily: 'Tajawal',
          ),
        ),
      ),
    );
  }
}
