import 'package:flutter/material.dart';

import '../../theme/color.dart';

class ExerciseDescription extends StatelessWidget {
  const ExerciseDescription({super.key, required this.description});
  final String description;
  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      style: TextStyle(
        color: AppColors.textSecondary,
        fontSize: 14,
        height: 1.6,
        fontFamily: 'Tajawal',
      ),
    );
  }
}
