import 'package:flutter/material.dart';
import 'package:sport_app/model/exercise_model.dart';

import '../../theme/color.dart';

class ExerciseCard extends StatelessWidget {
  final ExerciseModel exercise;

  const ExerciseCard({super.key, required this.exercise});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.surface,
      borderRadius: BorderRadius.circular(16),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            // مكان الصورة المصغرة
            Container(
              width: 72,
              height: 72,
              decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(Icons.fitness_center, color: AppColors.accent),
            ),
            const SizedBox(width: 14),
            // اسم التمرين والمجموعة العضلية
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    exercise.name,
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Tajawal',
                    ),
                  ),
                  const SizedBox(height: 6),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.accentSecondary.withOpacity(0.18),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      exercise.muscleGroup,
                      style: TextStyle(
                        color: AppColors.accentSecondary,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Tajawal',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Icon(Icons.play_circle_fill, color: AppColors.accent, size: 30),
          ],
        ),
      ),
    );
  }
}
