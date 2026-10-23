import 'package:flutter/material.dart';

import '../../theme/color.dart';

class ResultCard extends StatelessWidget {
  final String name;
  final String muscleGroup;
  final String highlight;

  const ResultCard({
    super.key,
    required this.name,
    required this.muscleGroup,
    required this.highlight,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.surface,
      borderRadius: BorderRadius.circular(16),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(Icons.fitness_center, color: AppColors.accent),
            ),
            const SizedBox(width: 14),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                      muscleGroup,
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
            Icon(Icons.play_circle_fill, color: AppColors.accent, size: 28),
          ],
        ),
      ),
    );
  }
}
