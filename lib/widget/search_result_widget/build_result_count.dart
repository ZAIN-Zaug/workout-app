import 'package:flutter/material.dart';

import '../../theme/color.dart';

class ResultsCount extends StatelessWidget {
  final int count;
  const ResultsCount({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
      child: Text(
        '$count نتائج',
        style: TextStyle(
          color: AppColors.textSecondary,
          fontSize: 13,
          fontFamily: 'Tajawal',
        ),
      ),
    );
  }
}
