import 'package:flutter/material.dart';

import '../../model/exercise_model.dart';
import '../../theme/color.dart';

class SelectableExerciseTile extends StatelessWidget {
  final ExerciseModel exercise;
  final bool isSelected;
  final void Function(int id) onToggle;

  const SelectableExerciseTile({
    super.key,
    required this.exercise,
    required this.isSelected,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 0, 12, 10),
      child: Material(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () => onToggle(exercise.id),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            child: Row(
              children: [
                Icon(
                  isSelected ? Icons.check_circle : Icons.circle_outlined,
                  color: isSelected
                      ? AppColors.accent
                      : AppColors.textSecondary,
                ),
                const SizedBox(width: 12),
                Text(
                  exercise.name,
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Tajawal',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
