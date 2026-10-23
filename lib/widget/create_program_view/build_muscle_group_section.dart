import 'package:flutter/material.dart';
import 'package:sport_app/model/exercise_model.dart';

import '../../theme/color.dart';

import 'build_selectable_exercise_tile.dart';

class MuscleGroupSection extends StatelessWidget {
  final String muscleGroup;
  final List<ExerciseModel> exercises;
  final Set<int> selectedExercises;
  final void Function(int id) onToggle;

  const MuscleGroupSection({
    super.key,
    required this.muscleGroup,
    required this.exercises,
    required this.selectedExercises,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    final selectedCount = exercises
        .where((e) => selectedExercises.contains(e.id))
        .length;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          initiallyExpanded: false,
          shape: const RoundedRectangleBorder(side: BorderSide.none),
          collapsedShape: const RoundedRectangleBorder(side: BorderSide.none),
          iconColor: AppColors.accentSecondary,
          collapsedIconColor: AppColors.textSecondary,
          title: Row(
            children: [
              Text(
                muscleGroup,
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Tajawal',
                ),
              ),
              if (selectedCount > 0) ...[
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.accent,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    '$selectedCount',
                    style: TextStyle(
                      color: AppColors.background,
                      fontSize: 12,
                      fontWeight: FontWeight.w800,
                      fontFamily: 'Tajawal',
                    ),
                  ),
                ),
              ],
            ],
          ),
          children: exercises
              .map(
                (exercise) => SelectableExerciseTile(
                  exercise: exercise,
                  isSelected: selectedExercises.contains(exercise.id),
                  onToggle: onToggle,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
